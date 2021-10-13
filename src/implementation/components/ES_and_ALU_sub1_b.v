`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Christian Meinzen
// 
// Create Date:    10:31:28 11/04/2019 
// Design Name: 
// Module Name:    ES_and_ALU_sub1_b 
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
module ES_and_ALU_sub1_b(
    input clk,
	 input reset,
	 input stackSrc,
	 input [15:0] valIn,
    input [1:0] ESOp,
    input ESAct,
	 input [1:0] dupAmt,
	 input popAmt,
    input [1:0] ALUOp,
    output [15:0] ALUOut,
	 output zero_out,
	 output ovflw_out
    );
	 
wire [15:0] stack_reg_a;
wire [15:0] stack_reg_b;
wire [15:0] reg_alu_a;
wire [15:0] reg_alu_b;
reg [15:0] stack_input;
	 
ex_stack ES (
    .pushVal(stack_input),
    .popNum(popAmt),
    .dupNum(dupAmt),
    .outA(stack_reg_a),
    .outB(stack_reg_b),
    .ESOp(ESOp),
	 .ESAct(ESAct),
	 .clk(clk)
	 );
	 
alu16b ALU (
	 .a(reg_alu_a),
    .b(reg_alu_b),
    .op(ALUOp),
    .r(ALUOut),
	 .ovflw(ovflw_out),
	 .zero(zero_out)
	 );
	 
register A (
    .regWrite(1'b1), 
    .clk(clk), 
	 .reset(reset),
    .w_data(stack_reg_a), 
    .r_data(reg_alu_a)
    );
	 
register B (
    .regWrite(1'b1), 
    .clk(clk), 
	 .reset(reset),
    .w_data(stack_reg_b), 
    .r_data(reg_alu_b)
    );

	always @ (stackSrc, valIn, ALUOut) begin
		if(stackSrc == 0)
			stack_input <= valIn;
		else
			stack_input <= ALUOut;
	end
endmodule
