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
`define FILE "register_values.txt"

module CPU_tb;
    reg clk;
    reg rst;
    wire [31:0] instr;
    wire [31:0] cur_pc;
    wire [31:0] next_pc;  // Declaring as wire to match the module output
    reg [31:0] registers [31:0];
    // Instantiate the CPU Unit Under Test (UUT)
    CPU cpu_uut (
        .i_clk(clk),
        .i_arst(rst),
        .o_instruction(instr),
        .o_cur_pc(cur_pc),
        .o_next_pc(next_pc)
    );
    initial begin : INIT
        integer i;
        for(i = 0;i < 32; i = i + 1) begin
            registers[i] = {32{1'b0}};
        end
        $readmemh(`FILE,registers);
    end
    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    // Reset generation
    initial begin
        rst = 1;
        #10 rst = 0;
        #20000 $finish;
    end

endmodule
