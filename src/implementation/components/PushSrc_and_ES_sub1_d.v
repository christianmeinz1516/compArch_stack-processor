`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Christian Meinzen
// 
// Create Date:    10:32:57 11/05/2019 
// Design Name: 
// Module Name:    PushSrc_and_ES_sub1_d 
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
module PushSrc_and_ES_sub1_d(
    input [1:0] ESOp,
    input [2:0] pushSrc,
    input ESAct,
    input reset,
    input clk,
	 output [15:0] tosRega,
	 output [15:0] tosRegb
    );

wire [15:0] pushVal_stack;
wire [15:0] a_mux;
wire [15:0] b_mux;
reg [15:0] mux_pushVal;

ex_stack ES (
	 .pushVal(pushVal_stack),
    .popNum(1'b0),
    .dupNum(2'b00),
    .outA(tosRega),
    .outB(tosRegb),
    .ESOp(ESOp),
	 .ESAct(ESAct),
	 .clk(clk)
	 );

register A (
	 .regWrite(1'b1), 
    .clk(clk), 
	 .reset(reset),
    .w_data(tosRega), 
    .r_data(a_mux)
    );
	 
register B (
	 .regWrite(1'b1), 
    .clk(clk), 
	 .reset(reset),
    .w_data(tosRegb), 
    .r_data(b_mux)
    );
	 
register pushVal (
	 .regWrite(1'b1), 
    .clk(clk), 
	 .reset(reset),
    .w_data(mux_pushVal), 
    .r_data(pushVal_stack)
    );
	 
	 always @ (*) begin
		case(pushSrc)
			0: mux_pushVal <= 0;
			1: mux_pushVal <= 1;
			2: mux_pushVal <= 2;
			3: mux_pushVal <= 3;
			4: mux_pushVal <= 4;
			5: mux_pushVal <= 5;
			6: mux_pushVal <= a_mux;
			7: mux_pushVal <= b_mux;
			default: mux_pushVal <= 0;
		endcase
	 end
endmodule
