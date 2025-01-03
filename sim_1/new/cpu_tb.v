`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2024 06:46:44 PM
// Design Name: 
// Module Name: cpu_tb
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


module cpu_tb;
reg clk;
wire [31:0] IM_out;
wire [5:0] Control_input;
wire [4:0] reg1;
wire [4:0] reg2;
wire RegDst;
//wire [4:0] write_reg;
wire [31:0] write_data;
wire RegWrite;
wire [31:0] read_reg1;
wire [31:0] read_reg2;
//wire [15:0] sign_extend_input;
wire ALUSrc;
//wire [31:0] oprd1;
wire [31:0] oprd2;
wire [1:0] ALUOp;
wire [3:0] ALU_Operation;
wire zero;
wire [31:0] ALU_result;
//wire [31:0] adder0;
//wire [31:0] adder1;
wire Branch;
wire [31:0] Jump_addr;
wire PCSrc;
wire Jump;
wire [31:0] pc_next;
wire [31:0] write_mem;
wire [31:0] addr_mem;
wire MemRead;
wire MemWrite;
wire MemtoReg;
wire [31:0] read_mem;
cpu UUT(
clk,
IM_out,
Control_input,
reg1,
reg2,
RegDst,
//write_reg,
write_data,
RegWrite,
read_reg1,
read_reg2,
//sign_extend_input,
ALUSrc,
//oprd1,
oprd2,
ALUOp,
ALU_Operation,
zero,
ALU_result,
//adder0,
//adder1,
Branch,
Jump_addr,
PCSrc,
Jump,
pc_next,
write_mem,
addr_mem,
MemRead,
MemWrite,
MemtoReg,
read_mem
        );

initial begin
clk = 0;
forever #1 clk = ~clk;
end
initial #80 $finish;
    
endmodule
