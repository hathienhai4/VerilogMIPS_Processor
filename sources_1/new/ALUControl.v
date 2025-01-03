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
        case (ALUOp)
            2'b00: 
                ALU_Operation = 4'b0010; // add (used for lw, sw, addi)
            
            2'b01: 
                ALU_Operation = 4'b0110; // subtract (used for beq)
            
            2'b10: // R-type instructions
            begin
                case (Function)
                    6'b100000: ALU_Operation = 4'b0010; // add
                    6'b100010: ALU_Operation = 4'b0110; // subtract
                    6'b100100: ALU_Operation = 4'b0000; // and
                    6'b100101: ALU_Operation = 4'b0001; // or
                    6'b100110: ALU_Operation = 4'b0011; // xor
                    6'b100111: ALU_Operation = 4'b1100; // nor
                    6'b101010: ALU_Operation = 4'b0111; // set less than
                    6'b101011: ALU_Operation = 4'b1110; // set less than unsigned
                    6'b000000: ALU_Operation = 4'b1000; // shift left logical (sll)
                    6'b000010: ALU_Operation = 4'b1001; // shift right logical (srl)
                    6'b000011: ALU_Operation = 4'b1010; // shift right arithmetic (sra)
                    default:   ALU_Operation = 4'bxxxx; // undefined
                endcase
            end
            
            2'b11: // Immediate instructions
            begin
                case (Function)
                    6'b001000: ALU_Operation = 4'b0010; // addi
                    6'b001100: ALU_Operation = 4'b0000; // andi
                    6'b001101: ALU_Operation = 4'b0001; // ori
                    6'b001110: ALU_Operation = 4'b0011; // xori
                    6'b001111: ALU_Operation = 4'b1000; // lui (load upper immediate)
                    default:   ALU_Operation = 4'b1111; // undefined
                endcase
            end

            default: 
                ALU_Operation = 4'bxxxx; // undefined
        endcase
    end
endmodule

