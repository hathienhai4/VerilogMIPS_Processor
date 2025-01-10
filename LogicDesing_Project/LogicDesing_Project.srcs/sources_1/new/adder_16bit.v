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


module adder_16bit(
    input [15:0] a,
    input [15:0] b,
    input c_in,
    output [15:0] sum,
    output c_out
    );
    wire [2:0] carry; // carry signal
    adder_4bit add0(a[3:0], b[3:0], c_in, sum[3:0], carry[0]);
    adder_4bit add1(a[7:4], b[7:4], carry[0], sum[7:4], carry[1]);
    adder_4bit add2(a[11:8], b[11:8], carry[1], sum[11:8], carry[2]);
    adder_4bit add3(a[15:12], b[15:12], carry[2], sum[15:12], c_out);    
endmodule