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
integer file;
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
   file = $fopen("D:\\HDL Design\\register_values.txt", "w");
   if(file == 0) 
       $display("Error open file\n");
   for(i = 0;i < 32; i = i + 1) begin
        $fwrite(file, "Register[%0d] = %h\n", i, registers[i]);
   end
   $fwrite(file,"\n");
   $fclose(file);
end
endmodule
