`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2024 10:38:53 PM
// Design Name: 
// Module Name: CPU
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


module CPU(i_clk, i_arst, o_instruction, o_cur_pc, o_next_pc);
input i_clk;
input i_arst;
output [31:0] o_instruction;
output [31:0] o_cur_pc;
output [31:0] o_next_pc;
// Control Unit
wire RegDst;
wire RegWrite;
wire ALUSrc;
wire [1:0] ALUOp;
wire MemRead;
wire MemWrite;
wire MemToReg;
wire Branch;
wire Jump;
wire PCSrc;
wire Zero;
wire [3:0] ALUOperation;
//
reg [31:0] pc_next;
wire [31:0] pc_cur;
wire [31:0] sign_extend;
wire [31:0] pc_plus4;
//
wire [31:0] ROM;
wire [31:0] Instructions;
assign ROM = pc_cur;
//
assign o_instruction = Instructions;
assign o_cur_pc = pc_cur;
assign o_next_pc = pc_next;
//
rom rom(.i_addr(ROM), .o_data(Instructions));
assign pc_plus4 = pc_cur + 32'd4;
assign PCSrc = Branch & Zero;
always @(*) begin
    casex(Jump)
        1'b0:
            begin
                casex(PCSrc)
                    1'b0:
                        begin
                            pc_next = pc_plus4;
                        end
                    1'b1:
                        begin
                            pc_next = pc_plus4 + {sign_extend[29:0], 2'b00};
                        end
                endcase
            end
        1'b1:
            begin
                pc_next = {pc_plus4[31:28], Instructions[25:0], 2'b00};
            end
    endcase
end
PC PC(.i_clk(i_clk), .i_arst(i_arst), .i_addr(pc_next), .o_cur(pc_cur));

signExtend16to32 signExtend(.a(Instructions[15:0]), .out(sign_extend));

Control_unit Control_Unit (
    .control(Instructions[31:26]),
    .RegDst(RegDst),
    .Branch(Branch),
    .MemtoReg(MemToReg),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .ALUOp(ALUOp),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite),
    .Jump(Jump)
);

ALUControl ALUControl(
    .ALUOp(ALUOp),
    .Function(Instructions[5:0]),
    .ALU_Operation(ALUOperation)
);

wire [4:0] r_reg1;
wire [4:0] r_reg2;
reg [4:0] w_reg;
wire [31:0] w_data;
wire [31:0] r_data1;
wire [31:0] r_data2;
reg [31:0] temp_result;
assign r_reg1 = Instructions[25:21];
assign r_reg2 = Instructions[20:16];
always @(*) begin
    if (RegDst) 
        w_reg = Instructions[15:11];
    else
        w_reg = r_reg2;
end

assign w_data = temp_result;

Register register(.i_clk(i_clk), 
.i_arst(i_arst),
.RegWrite(RegWrite), 
.i_reg1(r_reg1), 
.i_reg2(r_reg2), 
.i_writeReg(w_reg), 
.i_data(w_data),
.o_reg1(r_data1),
.o_reg2(r_data2));

wire [31:0] oprd1;
wire [31:0] oprd2;
wire [31:0] alu_result;
Mux32bit mux2(.control(ALUSrc),.i_1(sign_extend), .i_2(r_data2), .out(oprd2));
assign oprd1 = r_data1;

ALU alu(.oprd1(oprd1), .oprd2(oprd2), .option(ALUOperation), .zero(Zero), .result(alu_result));
wire [31:0] readData;
DataMemory data_memory(.MemWrite(MemWrite), 
.MemRead(MemRead), 
.Address(alu_result), 
.WriteData(r_data2),
.ReadData(readData));
always @(*) begin
    if (MemToReg)
        temp_result = readData;
    else
        temp_result = alu_result;
end

endmodule

