`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:41:25 05/16/2017 
// Design Name: 
// Module Name:    Memory 
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
module Memory(MCLK, WriteEn,ReadEn,InData,OutData, RAddress, WAddress);


input [10:0] RAddress, WAddress;
input MCLK;
input WriteEn,ReadEn;
input [10:0] InData;
output reg [11:0] OutData;
reg [11:0] Mem [100:0];

always @(posedge MCLK) begin
 if((WriteEn) && (~ReadEn))
      Mem[WAddress] <= InData;
	else if((~WriteEn) && (ReadEn))
		OutData <= Mem[RAddress];
end

endmodule
