`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2024 04:46:58 PM
// Design Name: 
// Module Name: Instruction_memory
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
`define IM_FILE "IM.mem"

module Instruction_memory(
input [31:0] addr,            // Address đầu vào
output reg [31:0] instruction     // Instruction đầu ra
);
    reg [31:0] instruction_mem [0:16384]; // 64 KB memory
    initial begin
        $readmemh(`IM_FILE,instruction_mem);
        /*
        instruction_mem[0] = 32'b00000000000000010000000000000000;
        instruction_mem[1] = 32'b00000000011000100000000000000000;
        instruction_mem[2] = 32'b00000000100001010000000000000000;
        instruction_mem[3] = 32'b00000000110001110000000000000000;
        instruction_mem[4] = 32'b00000001000010010000000000000000;
        instruction_mem[5] = 32'b00000001011010100000000000000000;
        instruction_mem[6] = 32'b00000000000000010000000000000000;
        instruction_mem[7] = 32'b00000000000000010000000000000000;
        instruction_mem[8] = 32'b00000000000000010000000000000000;
        instruction_mem[9] = 32'b00000000000000010000000000000000;
        instruction_mem[10] = 32'b00000000000000010000000000000000;
        */
    end 
    always @(*) begin
    instruction <= instruction_mem[addr[15:2]];
    end
endmodule
