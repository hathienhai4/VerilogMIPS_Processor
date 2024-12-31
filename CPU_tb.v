`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/31/2024 10:34:31 AM
// Design Name: 
// Module Name: CPU_tb
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


module CPU_tb;
reg clk;
reg rst;
wire [31:0] instr;
wire [31:0] cur_pc;
wire [31:0] next_pc;

CPU cpu_uut(
.i_clk(clk),
.i_arst(rst),
.o_instruction(instr),
.o_cur_pc(cur_pc),
.o_next_pc(next_pc)
);
initial begin
    clk = 0;
    forever #10 clk = ~clk;
end
initial begin 
    #0 rst = 1;
    #10 rst = 0;
    #20000 $finish;
end
endmodule
