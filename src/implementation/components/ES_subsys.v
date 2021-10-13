`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Tori Szalay
// 
// Create Date:    21:04:37 11/07/2019 
// Design Name: 
// Module Name:    es_subsys.v
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This file implements one of the four subsystems of our final datapth.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: This subsystem includes:
//1. execution stack
//2. a, b, aluout registers
//3. sign extender
//4. alu
//5. alusrcb mux/control bit logic
//
//////////////////////////////////////////////////////////////////////////////////
module ES_subsys(
	 clk,
	 reset,
    IRw,
    popAmt,
    ESAct,
    ESop,
	 ALUOp,
	 ALUSrcB,
    PushValw,
    aWire,
    SEw,
    ALUOutWire,
    bWire,
    zero,
	 overflow
    );
	 
	 //control signals
	 input popAmt;
	 input ESAct;
	 input [1:0] ESop;
	 input [1:0] ALUOp;
	 input ALUSrcB;
	 
	 input clk;
	 input reset;
	 
	 //input wires
	 input [15:0] IRw;
	 input [15:0] PushValw;
	 
	 //outputs
	 output [15:0] aWire;
	 output[15:0] bWire;
	 output [15:0] SEw;
	 output [15:0] ALUOutWire;
	 output zero;
	 output overflow;
	 
	 //wires
	 wire [15:0] stack_rega;
	 wire [15:0] stack_regb;

	 wire [15:0] alu_aluout;
	 reg [15:0] mux_alu;
	 
	 
//mux
	 always @ (*) begin
		case(ALUSrcB)
			0: mux_alu <= bWire;
			1: mux_alu <= SEw;
			default: mux_alu <= bWire;
		endcase
	 end
	 
	 ex_stack ES(
	 .pushVal(PushValw),
    .popNum(popAmt),
    .dupNum(IRw[1:0]),
    .outA(stack_rega),
    .outB(stack_regb),
    .ESOp(ESop),
	 .ESAct(ESAct),
	 .clk(clk),
	 .reset(reset)
	 );
	 

	 
register A (
	 .regWrite(1'b1), 
    .clk(clk), 
	 .reset(reset),
    .w_data(stack_rega), 
    .r_data(aWire)
    );
	 
register B (
	 .regWrite(1'b1), 
    .clk(clk), 
	 .reset(reset),
    .w_data(stack_regb), 
    .r_data(bWire)
    );
	 
// Instantiate the module
sign_extend signExtend (
    .in(IRw[11:4]), 
    .extended(SEw)
    );

	 
// Instantiate the module
alu16b ALUmachine (
    .a(aWire), 
    .b(mux_alu), 
    .op(ALUOp), 
    .r(alu_aluout), 
    .ovflw(overflow), 
    .zero(zero)
    );
	 
register ALUOut (
	 .regWrite(1'b1), 
    .clk(clk), 
	 .reset(reset),
    .w_data(alu_aluout), 
    .r_data(ALUOutWire)
    );
	 

	 


endmodule
