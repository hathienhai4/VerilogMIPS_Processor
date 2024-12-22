`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2024 09:21:21 PM
// Design Name: 
// Module Name: rom
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
`define FILE "test.bin"

module rom(i_addr, o_data);
parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 32;
parameter ROM_BLOCK = 2**10;

input [ADDR_WIDTH - 1 : 0] i_addr;
output reg [DATA_WIDTH - 1 : 0] o_data;
reg [DATA_WIDTH - 1 : 0] mem [0 : ROM_BLOCK - 1];
initial begin : INIT
    integer i;
    for(i = 0;i < ROM_BLOCK; i = i + 1) begin
        mem[i] = {DATA_WIDTH{1'b0}};
    end
    $readmemh(`FILE,mem);
end
always @(i_addr) begin
    if(i_addr > ROM_BLOCK)
        o_data = {DATA_WIDTH{1'b0}};
    else
        o_data = mem[i_addr];
end
endmodule
