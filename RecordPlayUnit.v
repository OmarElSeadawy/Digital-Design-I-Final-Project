`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:47:15 05/16/2017 
// Design Name: 
// Module Name:    RecordPlayUnit 
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
module RecordPlayUnit(RPUClk, WKey, rst, PBKey, ReadEn, WriteEn );

input RPUClk,ReadEn,WriteEn, rst;
input [7:0]WKey;
output [7:0]PBKey;
reg [10:0] Address;
reg [10:0] RAddress;
reg [7:0] Current;
reg [7:0] Mem [100:0];
reg [16:0] TimeMem[100:0];
integer Counter;
integer Counter2;
assign PBKey = Mem[RAddress];

always @(posedge RPUClk) begin
if(rst) Address <= 0;else begin
if(WriteEn) begin
if(Address<100)
begin
if(Current==WKey)
begin
if(Counter>25000000/8)
	begin
	Counter <=0;
	TimeMem[Address] <= TimeMem[Address]+1;
	end
else
	Counter<=Counter+1;
end
else
begin
	Address <= Address+1;
	Current <= WKey;
	Counter <=0;
	Mem[Address+1] <= WKey;
end
end
end
end
end

integer d = 0;
always @(posedge RPUClk)  begin
if(!ReadEn) begin RAddress <=0; end
else begin
if(RAddress<100)
begin
	if(TimeMem[RAddress]>d)
	begin
	if(Counter2>=25000000/8)
		begin
		d <= d+1;
		Counter2<=0;
		end 
	else
		Counter2<=Counter2+1;
	end
	else
		begin
		RAddress<=RAddress+1;
		d<=0;
		end
end

end
end

endmodule
