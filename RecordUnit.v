`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:43:39 05/16/2017 
// Design Name: 
// Module Name:    RecordUnit 
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
module RecordUnit(RCLK,Key,Address,Signal,RecordEn,WriteEn);

input RCLK;
input [7:0] Key;
input RecordEn;
output reg WriteEn;
output reg [10:0]Address;
output reg [11:0]Signal;
reg [3:0]count;
reg [1:0] state;
reg [7:0] current;
parameter [1:0] A=2'b00, B=2'b01, C=2'b10, D=2'b11;

initial begin
Address = 0;
Signal = 0;
current = 0;
count = 0;
state = A;
end

always @(posedge RCLK) begin
	case(state)
	A:begin
		if(Key != 0) begin
		  current <= Key;
		  state <= B;
		  end
		else
		  state <= A;
		  end
	B: begin
	   if(Key == current) begin
		   count <= count + 1;
			state <= B;
		end
		else
		state <= C;
		end
	C: begin
	   Signal <= {Key,count};
		if(RecordEn) begin
	     WriteEn <= 1;
		  Address <= Address + 1;
		  state <= D;
		  end
		end
	default: begin
	   count <=0;
		WriteEn <= 0;
		state <= A;
		end
	endcase

end

endmodule
