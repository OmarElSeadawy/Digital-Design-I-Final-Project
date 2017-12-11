`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:32 05/16/2017 
// Design Name: 
// Module Name:    ClkDivider 
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
module clkDiv(clk, reset, clkA, clkB, en);
    parameter n= 8;
    parameter k = 1;
    parameter l = 2;
    input clk, reset, en;
    output reg clkA, clkB;
    reg [31:0]counterA, counterB;
    always @(posedge clk) begin
        if(reset) begin
            counterA<=32'd1;
            counterB<=32'd1;
            clkA <= 1'b0;
            clkB <= 1'b0;
        end
        else begin
            if(en) begin
                if(counterA == (n/(2*k))) begin
                    clkA <= ~clkA;
                    counterA <= 32'd1;
                end
                else begin
                counterA <= counterA +1;
                end
                
                if(counterB == (n/(2*l))) begin
                    clkB <= ~clkB;
                    counterB <= 32'd1;
                end
                else begin
                counterB <= counterB +1;
                end
            end
            else begin
                counterA <= counterA;
                counterB <= counterB;
                clkB <= clkB;
                clkA <= clkA;
            end            
        end
    end
endmodule