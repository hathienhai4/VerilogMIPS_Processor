`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2024 03:54:34 PM
// Design Name: 
// Module Name: adder_32bit_tb
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


module adder_32bit_tb(

    );

    reg [31:0] a,b;
    wire [31:0] sum;
    wire c_out;
    adder_32bit UUT(.a(a),.b(b),.sum(sum),.c_out(c_out));
    initial
    begin
    $monitor("Time = %0t: a = %d, b = %d, sum = %d, c_out = %d", $time, a, b, sum, c_out);
    a = 0;
    b = 0;
    #5
    a = 5;
    b = 10;
    #10
    a = 200;
    b = 500;
    #10
    a = 2500000000;
    b = 2000000000;
    #10
    $finish;
    end
  
endmodule
