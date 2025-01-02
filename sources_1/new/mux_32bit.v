`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2024 04:34:44 PM
// Design Name: 
// Module Name: mux_32bit
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


module mux_32bit(
input control,
input [31:0] in1,
input [31:0] in2,
output reg [31:0] out
    );
    always @(*) begin
    out = 8'h00000000;
    case(control)
    1'b0: out = in1;
    1'b1: out = in2;
    endcase
    end
endmodule
