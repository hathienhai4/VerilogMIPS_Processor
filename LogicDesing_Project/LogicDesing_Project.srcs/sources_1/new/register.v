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
`define REG_FILE "REG.mem"
module register(
input clk,
input [4:0] read_reg1,
input [4:0] read_reg2,
input [4:0] write_reg,
input [31:0] write_data,
input RegWrite,
output reg [31:0] read_data1,
output reg [31:0] read_data2
    );
    reg [31:0] registers [31:0]; // 32 thanh ghi 32-bit
    integer i, file;
    initial begin
        $readmemh(`REG_FILE, registers);
    end
    
    always @(*)begin
        read_data1 <= registers[read_reg1];
        read_data2 <= registers[read_reg2];
//        if (RegWrite == 1'b1)  
//            registers[write_reg] <= write_data;
//        read_data1 <= read_reg1;
//        read_data2 <= read_reg2;
//        $display("at time: %t, write: %b",$time, write_data);
    end    
    always @(posedge clk) begin
        if (RegWrite == 1'b1) begin   
              registers[write_reg] <= write_data;
//            read_data1 = registers[write_reg];
//            $display("at time: %t, read_reg1: %b",$time, write_reg);
//            $display("at time: %t, read_data1: %b",$time, registers[write_reg]);
        end
            file = $fopen("E:\\LogicDesign_Project\\LogicDesing_Project\\LogicDesing_Project.output\\register_file.txt","w");
        for(i = 0; i < 32; i = i + 1) begin
            $fwrite(file,"%h\n",registers[i]);
        end
        $fclose(file);
    end   
endmodule

