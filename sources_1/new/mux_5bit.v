`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2024 03:18:10 PM
// Design Name: 
// Module Name: mux_2bit
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


module mux_5bit(
input control,
input [4:0] in1,
input [4:0] in2,
output reg [4:0] out
    );
    always @(*) begin
    out = 5'b00000;
    case(control)
    1'b0: out = in1;
    1'b1: out = in2;
    endcase
    end
endmodule
