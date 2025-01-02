`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2024 12:46:29 PM
// Design Name: 
// Module Name: adder_4bit
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


module adder_32bit(
    input [31:0] a,
    input [31:0] b,
    input carry_in,
    output [31:0] sum,
    output c_out
    );
    wire [1:0] carry; // carry signal
    adder_16bit add0(a[15:0], b[15:0], carry_in, sum[15:0], carry[0]);
    adder_16bit add1(a[31:16], b[31:16], carry[0], sum[31:16], c_out);       
endmodule
