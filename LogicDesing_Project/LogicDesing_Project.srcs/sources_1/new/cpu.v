`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2024 04:37:25 PM
// Design Name: 
// Module Name: cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cpu(
input clk,
output reg [31:0] cpu_IM_out,
output reg [5:0] cpu_Control_input,
output reg [4:0] cpu_reg1,
output reg [4:0] cpu_reg2,
output reg cpu_RegDst,
output reg [4:0] cpu_write_reg,
output reg [31:0] cpu_write_data,
output reg cpu_RegWrite,
output reg [31:0] cpu_read_reg1,
output reg [31:0] cpu_read_reg2,
//output reg [15:0] cpu_sign_extend_input,
output reg cpu_ALUSrc,
output reg [31:0] cpu_oprd1,
output reg [31:0] cpu_oprd2,
output reg [1:0] cpu_ALUOp,
output reg [3:0] cpu_ALU_Operation,
output reg cpu_zero,
output reg [31:0] cpu_ALU_result,
//output reg [31:0] cpu_adder0,
//output reg [31:0] cpu_adder1,
output reg cpu_Branch,
output reg [31:0] cpu_Jump_addr,
output reg cpu_PCSrc,
output reg cpu_Jump,
output reg [31:0] cpu_pc_next,
output reg [31:0] cpu_write_mem,
output reg [31:0] cpu_addr_mem,
output reg cpu_MemRead,
output reg cpu_MemWrite,
output reg cpu_MemtoReg,
output reg [31:0] cpu_read_mem
    );
    
reg [31:0] pc_in = 32'h00400000;
wire [31:0] pc_out; 
PC_counter PC (.pc_in(pc_in), .pc_out(pc_out));

wire [31:0] adder0;
//wire [31:0] pc_next;

wire [31:0] IM_out;
Instruction_memory IM0 (.addr(pc_out), .instruction(IM_out));

wire [31:0] pc_next;
wire [1:0] carry_out;
adder_32bit ADD0 (.a(pc_out), .b(32'b100), .carry_in(1'b0), .sum(adder0),.c_out(carry_out[0]));

wire RegDst;
wire Branch;
wire MemtoReg;
wire MemWrite;
wire MemRead;
wire [1:0] ALUOp;
wire ALUSrc;
wire RegWrite;
wire Jump;
//wire Jump_jr;
//assign Jump_jr = (IM_out[31:26] == 6'b0 && IM_out[5:0] == 6'b001000) ? 1 : 0;
Control_unit CONTROL0 (.control(IM_out[31:26]),.RegDst(RegDst),.Branch(Branch),.MemtoReg(MemtoReg),
             .MemWrite(MemWrite), .MemRead(MemRead), .ALUOp(ALUOp), .ALUSrc(ALUSrc),
              .RegWrite(RegWrite), .Jump(Jump));
//assign Jump = Jump || Jump_jr;             
wire [31:0] shift_instruction;              
ShiftLeft_2bit SHIFT0 (.a({6'b0,IM_out[25:0]}), .out(shift_instruction));

wire [31:0] jump_addr;
Jump_block JB0 (.shift_instruction(shift_instruction), .pc(adder0), .jump_addr(jump_addr));

wire [4:0] pre_write_reg;              
mux_5bit MUX0 (.control(RegDst), .in1(IM_out[20:16]), .in2(IM_out[15:11]), .out(pre_write_reg));

wire [4:0] write_reg; 
mux_5bit MUX7 (.control(Jump), .in1(pre_write_reg), .in2(5'b11111), .out(write_reg));

wire [31:0] data_in;
wire [31:0] write_data;
mux_32bit MUX8 (.control(Jump), .in1(data_in), .in2(adder0), .out(write_data));
wire RegWrite_enable;              
mux_1bit MUX10 (.control(RegWrite && IM_out[31:26] == 6'b0 && IM_out[5:0] == 6'b001000), .in1(RegWrite), .in2(1'b0), .out(RegWrite_enable));              
wire [31:0] read_data [1:0];
register REG0 (.clk(clk), .read_reg1(IM_out[25:21]), .read_reg2(IM_out[20:16]),
               .write_reg(write_reg), .write_data(write_data),.RegWrite(RegWrite_enable),
               .read_data1(read_data[0]), .read_data2(read_data[1]));
               
wire [31:0] sign_extend_out;
Sign_extend SE0 (.in(IM_out[15:0]), .out(sign_extend_out));

wire [31:0] oprd2;
mux_32bit MUX1 (.control(ALUSrc), .in1(read_data[1]), .in2(sign_extend_out), .out(oprd2));

wire [31:0] shift_left;
wire [31:0] adder1;
ShiftLeft_2bit SHIFT1 (.a(sign_extend_out), .out(shift_left));
adder_32bit ADD1 (.a(adder0), .b(shift_left), .carry_in(1'b0), .sum(adder1),.c_out(carry_out[1]));


wire [5:0] outALUControl;
mux_6bit MUX5 (.control(ALUOp == 2'b11), .in1(IM_out[5:0]), .in2(IM_out[31:26]), .out(outALUControl));

wire [3:0] ALU_Operation;
ALUControl AC0 (.ALUOp(ALUOp), .Function(outALUControl), .ALU_Operation(ALU_Operation));

wire [31:0] oprd1;
mux_32bit MUX6(
    .control((IM_out[31:26] == 6'b000000) && ((IM_out[5:0] == 6'b000000) || (IM_out[5:0] == 6'b000010))),
    .in1(read_data[0]),
    .in2({27'b0,IM_out[10:6]}),
    .out(oprd1)
);

wire zero;
wire [31:0] ALU_result;
ALU ALU0 (.oprd1(oprd1), .oprd2(oprd2), .option(ALU_Operation), .zero(zero), .result(ALU_result));

wire PCSrc;
and AND0 (PCSrc, Branch, zero);

wire [31:0] pc_addr;
wire [31:0] pc_jump;
mux_32bit MUX2 (.control(PCSrc), .in1(adder0), .in2(adder1), .out(pc_addr));
mux_32bit MUX3 (.control(Jump), .in1(pc_addr), .in2(jump_addr), .out(pc_jump));
mux_32bit MUX9 (.control(IM_out[31:26] == 6'b0 && IM_out[5:0] == 6'b001000), .in1(pc_jump), .in2(read_data[0]), .out(pc_next));

wire [31:0] read_mem;
DataMemory DM0 (.MemWrite(MemWrite), .MemRead(MemRead),.clk(clk),
    .Address(ALU_result), .WriteData(read_data[1]),
    .ReadData(read_mem));
    
mux_32bit MUX4 (.control(MemtoReg), .in1(ALU_result), .in2(read_mem), .out(data_in));

             
always @(posedge clk) begin
    pc_in <= pc_next;
    cpu_IM_out <= IM_out;
    cpu_Control_input <= IM_out[31:26];
    cpu_reg1 <= IM_out[25:21];
    cpu_reg2 <= IM_out[20:16];
    cpu_RegDst <= RegDst;
    cpu_write_reg <= write_reg;
    cpu_write_data <= write_data;
    cpu_RegWrite <= RegWrite_enable;
    cpu_read_reg1 <= read_data[0];
    cpu_read_reg2 <= read_data[1];
//    cpu_sign_extend_input  <= IM_out[15:0];
    cpu_ALUSrc  <= ALUSrc;
    cpu_oprd1  <= oprd1;
    cpu_oprd2  <= oprd2;
    cpu_ALUOp  <= ALUOp;
    cpu_ALU_Operation  <= ALU_Operation;
    cpu_zero  <= zero;
    cpu_ALU_result  <= ALU_result;
//    cpu_adder0  <= adder0;
//    cpu_adder1  <= adder1;
    cpu_Branch  <= Branch;
    cpu_Jump_addr  <= jump_addr;
    cpu_PCSrc  <= PCSrc;
    cpu_Jump  <= Jump || (IM_out[31:26] == 6'b0 && IM_out[5:0] == 6'b001000);
    cpu_pc_next  <= pc_next;
    cpu_write_mem  <= read_data[1];
    cpu_addr_mem  <= ALU_result;
    cpu_MemRead  <= MemRead;
    cpu_MemWrite  <= MemWrite;
    cpu_MemtoReg  <= MemtoReg;
    cpu_read_mem  <= read_mem; 
end   
endmodule