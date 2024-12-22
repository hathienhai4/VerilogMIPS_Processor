`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2024 07:37:49 PM
// Design Name: 
// Module Name: ALUControl
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


module ALUControl(
    input [1:0] ALUOp,
    input [5:0] Function,
    output reg [3:0] ALU_Operation
    ); 
    always @(ALUOp or Function)
    begin
        if (ALUOp == 2'b00) //lw,sw
        begin 
            ALU_Operation = 4'b0010; //add
        end
        
        if (ALUOp == 2'b01) //beq
        begin 
            ALU_Operation = 4'b0110; //subtract
        end
        
        if (ALUOp == 2'b10) //R-type
        begin
            case (Function)
                6'b100000: ALU_Operation = 4'b0010; //add
                6'b100010: ALU_Operation = 4'b0110; //subtract
                6'b100100: ALU_Operation = 4'b0000; //and
                6'b100101: ALU_Operation = 4'b0001; //or
                6'b101010: ALU_Operation = 4'b0111; //set on less than
            endcase
        end
    end
endmodule
