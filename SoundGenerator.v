`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:02:12 05/16/2017 
// Design Name: 
// Module Name:    SoundGenerator 
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
module SoundGenerator(Note, rst, Sound, clk);

input clk;
input rst;
input [16:0] Note;
reg [16:0] counter;
output reg Sound;

always @(posedge clk) begin
if(rst)
  counter <= 0;
else begin
  if (counter == Note) begin
    Sound <= ~Sound;
    counter <= 0;
  end
  else begin
    counter <= counter+1;
  end
  end
end
  
endmodule
