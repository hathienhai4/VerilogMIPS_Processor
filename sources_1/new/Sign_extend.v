`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2024 05:29:45 PM
// Design Name: 
// Module Name: Sign_extend
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


module Sign_extend(
    input [15:0] in,        // Đầu vào 16-bit
    output [31:0] out      // Đầu ra 32-bit sau khi mở rộng
);
    // Đầu ra out được gán ngay lập tức.
    assign out = {{16{in[15]}}, in}; // Lặp bit MSB (in[15]) để mở rộng
endmodule