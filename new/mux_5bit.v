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
    output [4:0] out
);
    assign out = (control == 1'b0) ? in1 : in2;
endmodule
