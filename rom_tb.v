`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2024 05:02:25 PM
// Design Name: 
// Module Name: rom_tb
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


module rom_tb;
parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 32;
parameter ROM_BLOCK = 2**10;

reg [ADDR_WIDTH-1:0] i_addr;
wire [DATA_WIDTH-1:0] o_data;
integer i;
rom uut(.i_addr(i_addr), .o_data(o_data));
initial begin
    $display("Starting ROM testbench...");

    for (i = 0; i < ROM_BLOCK; i = i + 1) begin
        i_addr = i;
        #1
        $display("Address: %d, Data: %h", i, o_data); 
    end
    i_addr = ROM_BLOCK;
    #1;
    $display("Address: %d, Data: %h (Out of bounds)", i_addr, o_data);

    i_addr = ROM_BLOCK + 1;
    #1;
    $display("Address: %d, Data: %h (Out of bounds)", i_addr, o_data);

    $display("ROM testbench completed.");
    $finish;
end
endmodule
