`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2024 05:08:00 PM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
    input MemWrite, MemRead,
    input [31:0] Address, WriteData,
    output reg [31:0] ReadData
    );
    
    reg [31:0] DMemory [9999:0];
    integer i, baseAddr, offset;
//    wire [31:0] DM_Addr = Address[31:0];
    initial
    begin
        for (i = 0; i < 10000; i = i + 1)
        begin
            DMemory[i] <= 32'b0;
        end            
    end
    
    always @(WriteData or Address or MemRead or MemWrite)
    begin
        if (MemRead == 1'b1)
        begin
            ReadData = DMemory[Address];
        end
        if (MemWrite == 1'b1)
        begin
            DMemory[Address] <= WriteData;
        end
    end
//    assign ReadData = (MemRead == 1'b1) ? DMemory[DM_Addr] : 32'b0;
endmodule
