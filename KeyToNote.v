`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:17 05/16/2017 
// Design Name: 
// Module Name:    KeyToNote 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module KeyToNote(clk,rst, Note, KEY, PBKEY, ReadEn);

input clk;
input rst;
input ReadEn;
output reg [16:0] Note;
input [7:0]PBKEY;
input [7:0]KEY;
wire [7:0] CheckKey;

assign CheckKey = (ReadEn) ? PBKEY : KEY;

initial begin
Note = 1;
end

always @(posedge clk) begin
if(rst)
   Note <= 1;
else begin
case(CheckKey)
    8'b00010110: Note <= 56818; 
    8'b00011110: Note <= 50709; 
    8'b00100110: Note <= 95556; 
    8'b00100101: Note <= 85131; 
    8'b00101110: Note <= 75987; 
    8'b00110110: Note <= 71633; 
    8'b00111101: Note <= 63775; 
    default: Note<=1;
    endcase
end
end

endmodule


