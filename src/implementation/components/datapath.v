`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Tori Szalay
// 
// Create Date:    14:02:05 11/06/2019 
// Design Name: 
// Module Name:    datapath 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This file completely implements all four of subsystems for a complete datapath. 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: These subsystems are:
//1. ES_subsys
//2. Push_subsys
//3. PC_subsys
//4. Mem_subsys
//
//////////////////////////////////////////////////////////////////////////////////
module datapath(
								  popAmt,
                          ESOp,
                          ESAct,
								  IRwrite,
                          ALUSrcB,
                          ALUop,
								  PCSrc,
								  PushSrc,
								  ShiftSrc,
								  ShamtSrc,
								  regWrite,
								  IorD,
								  wea,
								  PCwrite,
								  BEQCond,
								  BNECond,
								  clk,
                          reset,
								  fromPushVal,
								  overflow,
								  ir_stack_push_pc,
								  input_IO,
								  output_IO

    );
	 
	input   popAmt;
   input [1:0] ESOp;
   input   ESAct;
	input IRwrite;
   input ALUSrcB;
   input [1:0] ALUop;
   input [1:0] PCSrc;
	input [2:0] PushSrc;
	input	ShiftSrc;
	input	ShamtSrc;
	input	regWrite;
	input	IorD;
	input	wea;
	input	PCwrite;
	input	BEQCond;
	input	BNECond;
	
	input clk;
	input reset;
	input [15:0] input_IO;
	output [15:0] output_IO;
	
	wire [15:0] fromALUout;
	output [15:0] fromPushVal;
	wire [15:0] PCout;
	output overflow;
	
	
	
wire [15:0] memout_push;
output [15:0] ir_stack_push_pc;
//wire [15:0] alu_push_mem;
//wire [15:0] pc_mem;
wire zero_pc;
//wire [15:0] pushVal_stack;
wire [15:0] aVal_pc_push;
wire [15:0] bVal_push_mem;
wire [15:0] se_push;


// Instantiate the module
Push_subsys pushSys (
    .ShiftSrc(ShiftSrc), 
    .ShamtSrc(ShamtSrc), 
    .RegWrite(regWrite), 
    .PushSrc(PushSrc), 
    .PushValw(fromPushVal), 
    .ALUOutWire(fromALUout), 
    .bWire(bVal_push_mem), 
    .aWire(aVal_pc_push), 
    .Memoutw(memout_push), 
    .IRw(ir_stack_push_pc), 
    .SEw(se_push), 
    .clk(clk), 
    .reset(reset)
    );

// Instantiate the module
PC_subsys pcSys (
    .BEQCond(BEQCond), 
    .zero(zero_pc), 
    .BNECond(BNECond), 
    .PCWrite(PCwrite), 
    .IRw(ir_stack_push_pc), 
    .aWire(aVal_pc_push), 
    .PCSource(PCSrc), 
    .PCw(PCout), 
    .clk(clk), 
    .reset(reset)
    );

// Instantiate the module
ES_subsys esSys (
    .clk(clk), 
    .reset(reset), 
    .IRw(ir_stack_push_pc), 
    .popAmt(popAmt), 
    .ESAct(ESAct),
    .ESop(ESOp), 
    .ALUOp(ALUop), 
    .ALUSrcB(ALUSrcB), 
    .PushValw(fromPushVal), 
    .aWire(aVal_pc_push), 
    .SEw(se_push),
    .ALUOutWire(fromALUout), 
    .bWire(bVal_push_mem), 
    .zero(zero_pc), 
    .overflow(overflow)
    );

// Instantiate the module
Mem_subsys memSys (
    .IorD(IorD), 
    .wea(wea), 
    .clk(clk), 
    .reset(reset), 
    .IRWrite(IRwrite), 
    .ALUoutWire(fromALUout), 
    .PCWire(PCout), 
    .bWire(bVal_push_mem), 
    .IRw(ir_stack_push_pc), 
    .Memoutw(memout_push),
	 .input_IO(input_IO),
	 .output_IO(output_IO)
    );






endmodule
