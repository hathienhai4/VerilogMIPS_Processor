`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/01/2025 04:54:24 PM
// Design Name: 
// Module Name: Jump_block
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


module Jump_block(
    input [31:0] pc,
    input [31:0] shift_instruction,
    output [31:0] jump_addr
);
    assign jump_addr = {pc[31:28], shift_instruction[27:0]};
endmodule

