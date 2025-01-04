`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2024 05:05:37 PM
// Design Name: 
// Module Name: Control_unit
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


module Control_unit(
    input [5:0] control,
    output wire RegDst,
    output wire Branch,
    output wire MemtoReg,
    output wire MemWrite,
    output wire MemRead,
    output wire [1:0] ALUOp,
    output wire ALUSrc,
    output wire RegWrite,
    output wire Jump
    );
    
    // Gán giá trị cho các tín hiệu đầu ra dựa trên giá trị của `control`
    assign RegDst   = (control == 6'b000000);                           // Lệnh R-type
    assign Branch   = (control == 6'b000100);                           // Lệnh beq
    assign MemtoReg = (control == 6'b100011);                           // Lệnh lw
    assign MemWrite = (control == 6'b101011);                           // Lệnh sw
    assign MemRead  = (control == 6'b100011);                           // Lệnh lw
    
    assign ALUSrc   = (control == 6'b100011) || (control == 6'b101011) || 
                      (control == 6'b001000) || (control == 6'b001100) || 
                      (control == 6'b001101) || (control == 6'b001111) || 
                      (control == 6'b001001) || (control == 6'b001010) ||
                      (control == 6'b001001) || (control == 6'b001110); // Immediate operations
                      
    assign RegWrite = (control == 6'b000000) || (control == 6'b100011) || 
                      (control == 6'b001000) || (control == 6'b001100) || 
                      (control == 6'b001101) || (control == 6'b001111) || 
                      (control == 6'b001001) || (control == 6'b001010) ||
                      (control == 6'b001001) || (control == 6'b001110); // Lệnh ghi vào thanh ghi
                      
    assign Jump     = (control == 6'b000010);                           // Lệnh jump

    // Điều khiển ALU
    assign ALUOp = (control == 6'b000000) ? 2'b10 :                 // R-type
                   (control == 6'b000100) ? 2'b01 :                 // beq
                   (control == 6'b100011) || (control == 6'b101011) ? 2'b00 :                 // lw, sw
                   2'b11;                                           // Các lệnh còn lại (addi, andi, lui, ...)
endmodule