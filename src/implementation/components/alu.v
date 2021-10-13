`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:52:50 10/22/2019 
// Design Name: 
// Module Name:    alu 
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
module alu(
    input [15:0] a,
    input [15:0] b,
    input [3:0] op,
    output reg [15:0] r,
    output reg zero,
    output reg overflow
    );
	 
	 parameter Or = 0;
	 parameter Add = 1;
	 parameter Sub = 2;
	 parameter SLT = 3;
	 
	 reg [16:0] ovflwDetector;
	 
	 always @(a, b, op) begin
		zero = 0;
		overflow = 0;
		r = 0;
		ovflwDetector = 0;
	 
		case(op)
			Or: r = a | b;
			Add: 
				begin
					ovflwDetector = a + b;
					r = ovflwDetector[15:0];
				end
			Sub:
				begin
					ovflwDetector = a - b;
					r = ovflwDetector[15:0];
				end
			SLT: r = a < b;
		endcase
		
		zero = ~(r[15] | r[14] | r[13] | r[12] | r[11] | r[10] | r[9] | r[8] | r[7] | r[6] | r[5] | r[4] | r[3] | r[2] | r[1] | r[0]);
		overflow = ovflwDetector[16];
	end
			


endmodule
