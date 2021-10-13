`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Christian Meinzen
// 
// Create Date:    14:25:09 11/06/2019 
// Design Name: 
// Module Name:    Mem_RegFile_ES_sub1_f 
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
module Mem_RegFile_ES_sub1_f(
    output [15:0] a_out,
    output [15:0] b_out,
    input [1:0] regAddress,
    input wea,
    input regWrite,
    input [15:0] push_in,
    input [1:0] pushSrc,
    input popNum,
    input [1:0] ESOp,
    input ESAct,
    input clk,
	 input reset
    );

wire [15:0] stack_rega;
wire [15:0] stack_regb;
wire [15:0] reg_read;
wire [15:0] mem_read;
reg [15:0] pushVal;

ex_stack ES(
	 .pushVal(pushVal),
    .popNum(popNum),
    .dupNum(2'b00),
    .outA(stack_rega),
    .outB(stack_regb),
    .ESOp(ESOp),
	 .ESAct(ESAct),
	 .clk(clk)
	 );
	 
register A (
	 .regWrite(1'b1), 
    .clk(clk), 
	 .reset(reset),
    .w_data(stack_rega), 
    .r_data(a_out)
    );
	 
register B (
	 .regWrite(1'b1), 
    .clk(clk), 
	 .reset(reset),
    .w_data(stack_regb), 
    .r_data(b_out)
    );

reg_file_4 RegFile(
	 .w_data(a_out),
    .r_data(reg_read),
    .address(regAddress),
	 .clk(clk),
    .regWrite(regWrite)
	 );

blockMemory16 Mem (
	 .clka(clk),
	 .wea(wea),
	 .addra(a_out),
	 .dina(b_out),
	 .douta(mem_read)
);	 

	always @ (*) begin
		case(pushSrc)
			0: pushVal <= 0;
			1: pushVal <= push_in;
			2: pushVal <= mem_read;
			3: pushVal <= reg_read;
			default: pushVal <= 0;
		endcase
	 end

endmodule
