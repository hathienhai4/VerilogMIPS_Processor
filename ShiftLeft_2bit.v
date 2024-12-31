`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2024 09:34:01 PM
// Design Name: 
// Module Name: ShiftLeft_2bit
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


module ShiftLeft_2bit(
    input [31:0] a,
    output reg [31:0] out
    );
    always@(a)
    begin
    out = a << 2;
    end
endmodule
