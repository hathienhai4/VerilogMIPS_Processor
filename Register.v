`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2024 10:10:40 PM
// Design Name: 
// Module Name: Register
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


module Register(i_clk, i_arst, RegWrite, i_reg1, i_reg2, i_writeReg, i_data, o_reg1, o_reg2);
input i_clk, i_arst, RegWrite;
input [4:0] i_reg1;
input [4:0] i_reg2;
input [4:0] i_writeReg;
input [31:0] i_data;
output [31:0] o_reg1;
output [31:0] o_reg2;
integer i;
integer file_1;
integer file_2;
reg [31:0]registers[31:0]; 
assign o_reg1 = (i_reg1 == 0) ? 32'd0 : registers[i_reg1];
assign o_reg2 = (i_reg2 == 0) ? 32'd0 : registers[i_reg2];

always @(posedge i_clk or posedge i_arst) begin
   if(i_arst) begin
    for(i = 0;i < 32; i = i + 1) begin
       registers[i] <= 32'd0;     
    end
   end else if(RegWrite) begin
        registers[i_writeReg] <= (i_writeReg == 0) ? 32'd0 : i_data;
   end else begin
    for(i = 0;i < 32; i = i + 1) begin
       registers[i] <= registers[i]; 
    end    
   end
   file_1 = $fopen("D:\\HDL Design\\register_values.txt", "w");
   file_2 = $fopen("D:\\HDL Design\\MIPS_Project\\MIPS_Project.srcs\\sim_1\\new\\register_values.txt","w");
   if(file_1 == 0) 
       $display("Error open file 1\n");
   if(file_2 == 0) 
       $display("Error open file 2\n");
   for(i = 0;i < 32; i = i + 1) begin
        $fwrite(file_1, "Register[%0d] = %h\n", i, registers[i]);
        $fwrite(file_2, "%h\n", registers[i]);
   end
   $fwrite(file_1,"\n");
   $fwrite(file_2,"\n");
   $fclose(file_1);
   $fclose(file_2);
end
endmodule
