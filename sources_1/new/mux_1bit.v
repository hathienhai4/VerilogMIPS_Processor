`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2025 10:27:33 PM
// Design Name: 
// Module Name: mux_1bit
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


module mux_1bit(
    input control,
    input in1,
    input in2,
    output out
);
    assign out = (control == 1'b0) ? in1 : in2;
endmodule
