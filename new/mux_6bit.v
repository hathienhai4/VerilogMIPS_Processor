`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2025 10:36:38 AM
// Design Name: 
// Module Name: mux_6bit
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

module mux_6bit(
    input [1:0] ALUOp,
    input [5:0] Opcode,
    input [5:0] Funct,
    output [5:0] out
    );
    assign out = (ALUOp == 2'b11) ? Opcode : Funct;
endmodule
