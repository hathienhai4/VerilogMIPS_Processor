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
    end 
    always @(addr) begin
    instruction <= instruction_mem[addr[15:2]];
    end
endmodule