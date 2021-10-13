`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: William Dalby
// 
// Create Date:    20:47:39 10/22/2019 
// Design Name: 
// Module Name:    PCadder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This file implements our PCadder component to the datapath
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: The original PCadder added 2 originally, but our final implementation is 1 due to how our
//memory addressing works
//
//////////////////////////////////////////////////////////////////////////////////
module PCadder(
    input [15:0] PCin,
    output [15:0] PCout
    );
	 
	 assign PCout = PCin + 1;


endmodule
