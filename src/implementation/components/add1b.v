`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:31:55 10/27/2019 
// Design Name: 
// Module Name:    add1b 
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
module add1b(
    input a,
    input b,
    input ci,
    output r,
    output co
    );
	 
	 assign r = (ci & ~a & ~b) | (~ci & a & ~b) | (~ci & ~a & b) | (ci & a & b);
	 assign co = (ci & a) | (ci & b) | (a & b);


endmodule