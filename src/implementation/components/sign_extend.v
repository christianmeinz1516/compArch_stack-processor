`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Christian Meinzen
// 
// Create Date:    17:07:11 10/21/2019 
// Design Name: 
// Module Name:    sign_extend 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This file implements our sign extender component
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module sign_extend(
    input [7:0] in,
    output [15:0] extended
    );
	
	assign extended[15:0] = {{8{in[7]}}, in[7:0]};

endmodule
