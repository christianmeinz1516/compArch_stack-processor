`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:35:53 11/17/2019 
// Design Name: 
// Module Name:    arithmeticShifter 
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
module arithmeticShifter(
    input signed [15:0] in,
    input [4:0] shamt,
    output reg [15:0] out
    );
	 
	 
	 always @(*) begin
		case(shamt)
			0: out <= in <<< 1;
			1: out <= in <<< 2;
			2: out <= in <<< 3;
			3: out <= in <<< 4;
			4: out <= in <<< 5;
			5: out <= in <<< 6;
			6: out <= in <<< 7;
			7: out <= in <<< 8;
			8: out <= in <<< 9;  //01000 -> +8 so left shift by 8
			9: out <= in <<< 10;
			10: out <= in <<< 11;
			11: out <= in <<< 12;
			12: out <= in <<< 13;
			13: out <= in <<< 14;
			14: out <= in <<< 15;
			15: out <= in <<< 16; 
			16: out <= in >>> 16; // 10000 -> -16 so right shift by 16
			17: out <= in >>> 15;
			18: out <= in >>> 14;
			19: out <= in >>> 13;
			20: out <= in >>> 12;
			21: out <= in >>> 11;
			22: out <= in >>> 10;
			23: out <= in >>> 9;
			24: out <= in >>> 8;
			25: out <= in >>> 7;
			26: out <= in >>> 6;
			27: out <= in >>> 5;
			28: out <= in >>> 4;
			29: out <= in >>> 3;
			30: out <= in >>> 2;
			31: out <= in >>> 1;
			endcase
		end


endmodule
