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
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define MEM_FILE "DM.mem"
module DataMemory(
    input MemWrite, MemRead, clk,
    input [31:0] Address, WriteData,
    output [31:0] ReadData
    );
    
    reg [31:0] DMemory [1023:0];
    integer i, baseAddr, offset, file;
//    wire [31:0] DM_Addr = Address[31:0];
    initial
    begin
        $readmemh(`MEM_FILE, DMemory);
        for (i = 100; i < 1024; i = i + 1)
        begin
            DMemory[i] <= 32'b0;
        end            
    end
    assign ReadData = (MemRead == 1'b1) ? DMemory[{2'b00, Address[31:2]}] : 32'bz;    
    always @(posedge clk)
    begin
        if (MemWrite == 1'b1)
        begin
            DMemory[{2'b00,Address[31:2]}] = WriteData;
            $display("Time :",$time);
            $display("write data",WriteData);
            $display("write addr",Address[31:2]);
            file = $fopen("D:\\Vivado project\\Vivado_output\\mem_file.txt","w");
            for(i = 0; i < 1024; i = i + 1) begin
                $fwrite(file,"%h\n",DMemory[i]);
            end
            $fclose(file);
        end
        
    end 
endmodule
