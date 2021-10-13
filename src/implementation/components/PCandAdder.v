`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Will Dalby
// 
// Create Date:    13:03:55 10/31/2019 
// Design Name: 
// Module Name:    PCandAdder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This file implements our original implementation plan subsystem. It is NOT used in the final implmentation of
//our datapath, though we did find valuable fixes while conducting tests 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PCandAdder(
		input clk,
		input regWrite,
		input reset,
		output reg [15:0] newPC
    );

wire [15:0] beforeVal;
wire [15:0] afterVal;

PCadder A (
    .PCin(beforeVal), 
    .PCout(afterVal)
    );
	 
	 
register PC (
    .regWrite(regWrite), 
    .clk(clk), 
	 .reset(reset),
    .w_data(afterVal), 
    .r_data(beforeVal)
    );
	 
always @(*) begin
	newPC <= beforeVal;
end
	 
	 



endmodule
