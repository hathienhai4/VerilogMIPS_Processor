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
    output reg RegDst,
    output reg Branch,
    output reg MemtoReg,
    output reg MemWrite,
    output reg MemRead,
    output reg [1:0] ALUOp,
    output reg ALUSrc,
    output reg RegWrite,
    output reg Jump //j and jal only
    );
        always @(control) begin
        // Mặc định tín hiệu đều ở mức 0
        RegDst = 0;
        Branch = 0;
        MemtoReg = 0;
        MemWrite = 0;
        MemRead = 0;
        ALUOp = 0;
        ALUSrc = 0;
        RegWrite = 0;
        Jump = 0;
        case (control)
            6'b000000: begin // Lệnh R-type
                RegDst = 1;    // Ghi vào rd
                RegWrite = 1;  // Cho phép ghi
                ALUOp = 2'b10;     // Điều khiển ALU (theo funct)
            end

            6'b100011: begin // lw (load word)
                MemtoReg = 1;  // Dữ liệu từ memory
                MemRead = 1;   // Đọc từ bộ nhớ
                ALUSrc = 1;    // Toán hạng 2 là immediate
                RegWrite = 1;  // Ghi vào thanh ghi
                ALUOp = 2'b00;
            end

            6'b101011: begin // sw (store word)
                MemWrite = 1;  // Ghi vào bộ nhớ
                ALUSrc = 1;    // Toán hạng 2 là immediate
                ALUOp = 2'b00;
            end

            6'b000100: begin // beq (branch if equal)
                Branch = 1;    // Thực hiện nhánh
                ALUOp = 2'b01;     // Điều khiển ALU tính hiệu số (so sánh)
            end

            6'b001000: begin // addi (add immediate)
                ALUSrc = 1;    // Toán hạng 2 là immediate
                RegWrite = 1;  // Ghi vào thanh ghi
                ALUOp = 2'b00;
            end

            6'b001100: begin // andi (and immediate)
                ALUSrc = 1;    // Toán hạng 2 là immediate
                RegWrite = 1;  // Ghi vào thanh ghi
                ALUOp = 2'b00;     // Điều khiển ALU thực hiện phép `AND`
            end
            6'b000010: begin // jump
                Jump = 1;
            end
            default: begin // Opcode không xác định
                // Các tín hiệu mặc định đã được thiết lập ở mức 0.
            end
        endcase
    end
endmodule