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
    output reg zero,
    output reg [31:0] result
);
    always @(*) begin
        case (option)
            4'b0000: result = oprd1 & oprd2;            // AND
            4'b0001: result = oprd1 | oprd2;            // OR
            4'b0010: result = oprd1 + oprd2;            // ADD
            4'b0011: result = oprd1 ^ oprd2;            // XOR
            4'b0100: result = oprd1 << oprd2;           // SLL (Logical Shift Left)
            4'b0101: result = oprd1 >> oprd2;           // SRL (Logical Shift Right)
            4'b0110: result = oprd1 - oprd2;            // SUBTRACT
            4'b0111: result = (oprd1 < oprd2) ? 1 : 0;  // SET LESS THAN (SLT)
            4'b1000: result = oprd1 * oprd2;            // MULTIPLY
            4'b1001: result = oprd1 / oprd2;            // DIVIDE
            4'b1010: result = $signed(oprd1) >>> oprd2; // SRA (Arithmetic Shift Right)
            4'b1100: result = ~(oprd1 | oprd2);         // NOR
            4'b1111: result = oprd1;                   // MOVE
            default: result = 32'b0;                    // Default case: 0
        endcase
        
        // Cập nhật cờ zero
        zero = (result == 32'b0) ? 1'b1 : 1'b0;
    end    
endmodule

