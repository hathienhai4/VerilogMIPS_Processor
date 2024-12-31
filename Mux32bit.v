`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2024 09:41:44 PM
// Design Name: 
// Module Name: Mux32bit
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


module Mux32bit(control, i_1, i_2, out);
input control;
input [31:0] i_1;
input [31:0] i_2;
output reg [31:0] out;
always @(*) begin
    if(control)
        out <= i_1;
    else 
        out <= i_2;
end
endmodule
