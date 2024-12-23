`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2024 04:40:12 PM
// Design Name: 
// Module Name: register
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


module register(
input [4:0] read_reg1,
input [4:0] read_reg2,
input [4:0] write_reg,
input [31:0] write_data,
input RegWrite,
output [31:0] read_data1,
output [31:0] read_data2
    );
    reg [31:0] registers [31:0]; // 32 thanh ghi 32-bit
    
    assign read_data1 = registers[read_addr1];
    assign read_data2 = registers[read_addr2];
        
endmodule
