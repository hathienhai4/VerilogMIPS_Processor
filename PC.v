`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2024 10:35:07 PM
// Design Name: 
// Module Name: PC
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


module PC(i_clk, i_arst, i_addr, o_cur);
input i_clk, i_arst;
input [31:0] i_addr;
output reg [31:0] o_cur;
always @(posedge i_clk or posedge i_arst) begin
    if(i_arst) begin
        o_cur <= 32'h00400000;
    end else begin
        o_cur <= i_addr;
    end
end
endmodule
