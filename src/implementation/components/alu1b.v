`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: William Dalby
// 
// Create Date:    19:33:15 10/27/2019 
// Design Name: 
// Module Name:    alu1b 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This file implements a 1 bit alu used to build our 16 bit alu component
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu1b(
	 input a,
    input b,
    input ci,
    input [1:0] op,
	 input less,
	 output reg set,
    output reg r,
    output co
    );
	 
	 parameter Or = 0;
	 parameter Add = 1;
	 parameter Sub = 2;
	 parameter SLT = 3;
	 
	 reg adderIn;
	 wire adderOut;
	 
	 always @(*) begin
		
		case (op)				
			Add: adderIn <= b;
				
			Sub: adderIn <= ~b;
			
			SLT: adderIn <= ~b;
				
			default: adderIn <= b;
		endcase
	end
	
	
	
	add1b A (
    .a(a), 
    .b(adderIn), 
    .ci(ci), 
    .r(adderOut), 
    .co(co)
    );
	 
	 
	 
	 always @(*) begin
		set <= 0;
		case(op)
			Or: r <= a | b;
			Add: r <= adderOut;
			Sub: r <= adderOut;
			SLT: 
				begin
					r <= less;
					set <= adderOut;
				end
			default: r <= a | b;
		endcase
	end					


endmodule
