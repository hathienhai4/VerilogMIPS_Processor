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
    output [3:0] ALU_Operation
    );
    assign ALU_Operation = (ALUOp == 2'b00) ? 4'b0010 : // add (used for lw, sw, addi)
                           (ALUOp == 2'b01) ? 4'b0110 : // subtract (used for beq)
                           (ALUOp == 2'b10) ? (
                               (Function == 6'b100000) || (Function == 6'b100001) ? 4'b0010 : // add, addu
                               (Function == 6'b100010) || (Function == 6'b100011) ? 4'b0110 : // sub, subu
                               (Function == 6'b100100) ? 4'b0000 : // and
                               (Function == 6'b100101) ? 4'b0001 : // or
                               (Function == 6'b100110) ? 4'b0011 : // xor
                               (Function == 6'b100111) ? 4'b1100 : // nor
                               (Function == 6'b101010) || (Function == 6'b101011) ? 4'b0111 : // slt, sltu
                               (Function == 6'b000000) ? 4'b0100 : // shift left logical (sll)
                               (Function == 6'b000010) ? 4'b0101 : // shift right logical (srl)
                               (Function == 6'b000011) ? 4'b1010 : // shift right arithmetic (sra)
                               4'bxxxx // undefined
                           ) :
                           (ALUOp == 2'b11) ? (
                               (Function == 6'b001000) || (Function == 6'b001001) ? 4'b0010 : // addi, addiu
                               (Function == 6'b001100) ? 4'b0000 : // andi
                               (Function == 6'b001010) ? 4'b0111 : // slti
                               (Function == 6'b001101) ? 4'b0001 : // ori
                               (Function == 6'b001110) ? 4'b0011 : // xori
                               (Function == 6'b001111) ? 4'b1101 : // lui
                               (Function == 6'b000101) ? 4'b1110 : // bne
                               4'bxxxx // undefined
                           ) :
                           4'bxxxx; // undefined
endmodule