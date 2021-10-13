`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Christian Meinzen
// 
// Create Date:    17:10:50 10/21/2019 
// Design Name: 
// Module Name:    zero_extend 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This file implements our zero extender component
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module zero_extend(
    input [7:0] in,
    output [15:0] extended
    );

	assign extended[7:0] = in[7:0];
	assign extended[15:8] = 'b0;
	
endmodule
