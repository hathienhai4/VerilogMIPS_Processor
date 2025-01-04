`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2024 05:06:19 PM
// Design Name: 
// Module Name: ALU
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

module ALU(
    input [31:0] oprd1,
    input [31:0] oprd2,
    input [3:0] option,
    output wire zero,
    output wire [31:0] result
);

    // Kết quả của phép toán
    assign result = (option == 4'b0000) ? (oprd1 & oprd2) :            // AND
                    (option == 4'b0001) ? (oprd1 | oprd2) :            // OR
                    (option == 4'b0010) ? (oprd1 + oprd2) :            // ADD
                    (option == 4'b0011) ? (oprd1 ^ oprd2) :            // XOR
                    (option == 4'b0100) ? (oprd2 << oprd1[4:0]) :      // SLL (Logical Shift Left)
                    (option == 4'b0101) ? (oprd2 >> oprd1[4:0]) :      // SRL (Logical Shift Right)
                    (option == 4'b0110) ? (oprd1 - oprd2) :            // SUBTRACT
                    (option == 4'b0111) ? (((oprd1 < oprd2) && (oprd1[31] == oprd2[31]) || (oprd1[31] > oprd2[31])) ? 32'b1 : 32'b0) : // SLT
                    (option == 4'b1000) ? (oprd1 * oprd2) :            // MULTIPLY
                    (option == 4'b1001) ? (oprd1 / oprd2) :            // DIVIDE
                    (option == 4'b1010) ? $signed(oprd1) >>> oprd2[4:0] : // SRA (Arithmetic Shift Right)
                    (option == 4'b1100) ? ~(oprd1 | oprd2) :           // NOR
                    (option == 4'b1101) ? (oprd2 << 16) :              // lui
                    (option == 4'b1111) ? oprd1 :                      // MOVE
                    32'b0;                                             // Default case: 0
    
    // Cờ zero: bằng 1 nếu `result` bằng 0
    assign zero = (result == 32'b0);

endmodule