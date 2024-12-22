`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2024 10:00:31 PM
// Design Name: 
// Module Name: DM_tb
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


module DM_tb(

    );
    reg MemWrite, MemRead;
    reg [31:0] Address, WriteData;
    wire [31:0] ReadData;
    
    // Instance of the DataMemory module
    DataMemory dm(
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .Address(Address),
        .WriteData(WriteData),
        .ReadData(ReadData)
    );
    
    // Initialize signals and run test cases
    initial begin
        // Initialize Inputs
        MemWrite = 0;
        MemRead = 0;
        Address = 0;
        WriteData = 0;

        // Display header for clarity
        $display("Time | MemWrite | MemRead | Address | WriteData | ReadData");
        $monitor("%4t |    %b    |    %b    | 0x%h   | 0x%h      | 0x%h", 
                 $time, MemWrite, MemRead, Address, WriteData, ReadData);

        // Load initial data into DataMemory
        #5 MemWrite = 1; Address = 32'h0000_0004; WriteData = 32'hAABBCCDD; // Write data at address 0x4
        #10 MemWrite = 0; MemRead = 1; Address = 32'h0000_0004; // Read from address 0x4
        #10 MemWrite = 1; Address = 32'h0000_0008; WriteData = 32'h11223344; // Write data at address 0x8
        #10 MemRead = 1; Address = 32'h0000_0008; // Read from address 0x8
        
        #20 $finish;
    end
endmodule
