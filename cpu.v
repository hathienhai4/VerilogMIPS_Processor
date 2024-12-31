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
output reg [31:0] cpu_out0,
output reg [31:0] cpu_out1,
output reg [31:0] cpu_out2
,
output reg [31:0] cpu_out3,
output reg [31:0] cpu_out4,
output reg [31:0] cpu_out5,
output reg [31:0] cpu_out6,
output reg [31:0] cpu_out7,
output reg [31:0] cpu_out8,
output reg [31:0] cpu_out9,
output reg [31:0] cpu_out10,
output reg [31:0] cpu_out11,
output reg [31:0] cpu_out12,
output reg [31:0] cpu_out13,
output reg [31:0] cpu_out14,
output reg [31:0] cpu_out15,
output reg [31:0] cpu_out16,
output reg [31:0] cpu_out17,
output reg [31:0] cpu_out18,
output reg [31:0] cpu_out19,
output reg [31:0] cpu_out20,
output reg [31:0] cpu_out21,
output reg [31:0] cpu_out22,
output reg [31:0] cpu_out23
    );
    
reg [31:0] pc_in = 32'b0;
wire [31:0] pc_out;
  
PC_counter PC (.pc_in(pc_in), .pc_out(pc_out));

wire [31:0] adder0;
//wire [31:0] pc_next;

wire [31:0] IM_out;
Instruction_memory IM0 (.addr(pc_out), .instruction(IM_out));

wire [31:0] pc_next;
adder_32bit ADD0 (.a(pc_out), .b(32'b100), .carry_in(32'b0), .sum(adder0),.c_out());

wire RegDst;
wire Branch;
wire MemtoReg;
wire MemWrite;
wire MemRead;
wire [1:0] ALUOp;
wire ALUSrc;
wire RegWrite;
wire Jump;
Control_unit CONTROL0 (.control(IM_out[31:26]),.RegDst(RegDst),.Branch(Branch),.MemtoReg(MemtoReg),
             .MemWrite(MemWrite), .MemRead(MemRead), .ALUOp(ALUOp), .ALUSrc(ALUSrc),
              .RegWrite(RegWrite), .Jump(Jump));
              
wire [4:0] write_reg;               
mux_5bit MUX0 (.control(RegDst), .in1(IM_out[20:16]), .in2(IM_out[15:11]), .out(write_reg));
              
wire [31:0] read_data [1:0];
wire [31:0] write_data;
register REG0 (.clk(clk), .read_reg1(IM_out[25:21]), .read_reg2(IM_out[20:16]),
               .write_reg(write_reg), .write_data(write_data),.RegWrite(RegWrite),
               .read_data1(read_data[0]), .read_data2(read_data[1]));
               
wire [31:0] sign_extend_out;
Sign_extend SE0 (.in(IM_out[15:0]), .out(sign_extend_out));

wire [31:0] oprd2;
mux_32bit MUX1 (.control(ALUSrc), .in1(read_data[1]), .in2(sign_extend_out), .out(oprd2));

wire [31:0] shift_left;
wire [31:0] adder1;
ShiftLeft_2bit SHIFT0 (.a(sign_extend_out), .out(shift_left));
adder_32bit ADD1 (.a(adder0), .b(shift_left), .carry_in(32'b0), .sum(adder1),.c_out());

wire [3:0] ALU_Operation;
ALUControl AC0 (.ALUOp(ALUOp), .Function(IM_out[5:0]), .ALU_Operation(ALU_Operation));

wire zero;
wire [31:0] ALU_result;
ALU ALU0 (.oprd1(read_data[0]), .oprd2(oprd2), .option(ALU_Operation), .zero(zero), .result(ALU_result));

wire PCSrc;
and AND0 (PCSrc, Branch, zero);


mux_32bit MUX2 (.control(PCSrc), .in1(adder0), .in2(adder1), .out(pc_next));

wire [31:0] read_mem;
DataMemory DM0 (.MemWrite(MemWrite), .MemRead(MemRead),
    .Address(ALU_result), .WriteData(read_data[1]),
    .ReadData(read_mem));
    
mux_32bit MUX3 (.control(MemtoReg), .in1(ALU_result), .in2(read_mem), .out(write_data));

             
always @(posedge clk) begin
    $display("time: %t",$time);
    pc_in <= pc_next;
    cpu_out0 <= IM_out;
    cpu_out1 <= read_data[0];
    cpu_out2 <= IM_out[25:21];
    cpu_out3 <= sign_extend_out;
    cpu_out4 <= RegDst;
    cpu_out5 <= RegWrite;
    cpu_out6 <= ALUSrc;
    cpu_out7 <= oprd2;
    cpu_out8 <= ALUOp;
    cpu_out9 <= ALU_Operation;
    cpu_out10 <= ALU_result;
    cpu_out11 <= MemWrite;
    cpu_out12 <= MemRead;
    cpu_out13 <= MemtoReg;
    cpu_out14 <= Branch;
    cpu_out15 <= zero;
    cpu_out16 <= adder0;
    cpu_out17 <= adder1;
    cpu_out18 <= pc_next;
    cpu_out19 <= write_data;
    cpu_out20 <= read_mem;
    cpu_out21 <= pc_out;
    cpu_out22 <= write_reg;
    cpu_out23 <= PCSrc;   
end   
endmodule
