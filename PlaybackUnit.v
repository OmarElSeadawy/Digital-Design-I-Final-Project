`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:40:41 05/16/2017 
// Design Name: 
// Module Name:    PlaybackUnit 
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
module PlaybackUnit(PCLK, PBrst, PBK, Address, SignalFromMem, ReadEn);

input PCLK;
input PBrst;
input ReadEn;
input [11:0] SignalFromMem;
output reg [7:0] PBK;
output reg [10:0] Address; 
reg [3:0] PlayCount;
reg state;
parameter A=1'b0, B=1'b1;


initial begin
PlayCount = 0;
PBK = 0;
Address =0;
state = A;
end

always @(posedge PCLK) begin
if(ReadEn) begin
case(state)
A: begin
PlayCount <= SignalFromMem[3:0];
  if(PlayCount != 0) begin
		state <= B;
	end
	else begin
	  state <= A;
	  Address <= Address + 1;
	 end
	 end
B:
   if(PlayCount != 0) begin
       PBK <= SignalFromMem[11:4];
	    PlayCount <= PlayCount - 1;
		 state <= B;
   end
   else begin
    Address <= Address + 1;
	 state <= A;
   end

endcase
end
end
endmodule
