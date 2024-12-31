`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2024 06:12:48 PM
// Design Name: 
// Module Name: PC_counter
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


module PC_counter(
input [31:0] pc_in,
output reg [31:0] pc_out
    );
always @(pc_in)
begin
    pc_out <= pc_in;
end 
endmodule
