`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2024 09:07:25 PM
// Design Name: 
// Module Name: Adder32Bit
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


module Adder32Bit(
    input [31:0] a,
    input [31:0] b,
    output reg c_out,
    output reg [31:0] sum
    );
always@(a or b)
begin
    {sum, c_out} = a + b;    
end
endmodule
