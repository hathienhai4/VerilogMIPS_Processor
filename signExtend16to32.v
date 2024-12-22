`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2024 09:21:16 PM
// Design Name: 
// Module Name: signExtend16to32
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


module signExtend16to32(
    input [15:0] a,
    output reg [31:0] out
    );
    always@(a)
    begin
    out[15:0] = a[15:0];
    out[31:16] = {16{a[15]}};
    end
endmodule
