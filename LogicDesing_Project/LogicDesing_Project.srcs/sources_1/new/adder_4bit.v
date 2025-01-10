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


module adder_4bit(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output [3:0] sum,
    output c_out
);
    wire [2:0] carry; // carry signal
    full_adder fa0 (a[0], b[0], c_in, sum[0], carry[0]);
    full_adder fa1 (a[1], b[1], carry[0], sum[1], carry[1]);
    full_adder fa2 (a[2], b[2], carry[1], sum[2], carry[2]);
    full_adder fa3 (a[3], b[3], carry[2], sum[3], c_out);
endmodule