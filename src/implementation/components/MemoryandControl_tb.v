// Verilog test fixture created from schematic C:\Users\szalayvm\Documents\CSSE232\components\MemoryandControl.sch - Tue Nov 12 14:42:10 2019

`timescale 1ns / 1ps

module MemoryandControl_MemoryandControl_sch_tb();

// Inputs
   reg Reset;
   reg [15:0] dina;
   reg [9:0] addra;
   reg CLK;

// Output
   wire popAmt;
   wire flip;
   wire ESAct;
   wire ALUSrcA;
   wire IRWrite;
   wire ShiftSrc;
   wire ShamtSrc;
   wire RegWrite;
   wire IorD;
   wire PCWrite;
   wire BEQCond;
   wire BNECond;
   wire RegDst;
   wire [1:0] ESOp;
   wire [1:0] ALUSrcB;
   wire [1:0] ALUOP;
   wire [1:0] PCSrc;
   wire [2:0] PushSrc;
   wire [1:0] dupNum;
   wire [4:0] current_state;
   wire [4:0] next_state;

// Bidirs

// Instantiate the UUT
   MemoryandControl UUT (
		.Reset(Reset), 
		.dina(dina), 
		.addra(addra), 
		.CLK(CLK), 
		.popAmt(popAmt), 
		.ESAct(ESAct), 
		.IRWrite(IRWrite), 
		.ShiftSrc(ShiftSrc), 
		.ShamtSrc(ShamtSrc), 
		.RegWrite(RegWrite), 
		.IorD(IorD), 
		.PCWrite(PCWrite), 
		.BEQCond(BEQCond), 
		.BNECond(BNECond), 
		.RegDst(RegDst), 
		.ESOp(ESOp), 
		.ALUSrcB(ALUSrcB), 
		.ALUOP(ALUOP), 
		.PCSrc(PCSrc), 
		.PushSrc(PushSrc),  
		.current_state(current_state), 
		.next_state(next_state)
   );
		always #1 CLK = ~CLK;
// Initialize Inputs
  initial begin
		Reset = 1;
		dina = 0;
		addra = 10'd15;
		CLK = 0;
		#2
		
		//read from memory address 0 to set pushLi
		addra = 10'd0;
		Reset = 0;

		#6 //read from memory address 2 to set add
		addra = 10'd2;
		#10
		//read from address 3 to set dup0
		addra = 10'd3;
		#6
		//read from address 8 to set pushM
		addra = 10'd8;
		#12
//		//reset
//		Reset = 1;
//		#4
//		
//		//read from memory address 1 to set popM controls 
//		addra = 10'd1;
//		Reset = 0;
//		
//		Reset = 1;
//		#4
//		//read from memory address 4 to set pushli controls 
//		addra = 10'd4;
//		Reset = 0;
//		#4;
//		Reset = 1;
//		#4;
//		//read from memory address 4 to set dup controls 
//		addra = 10'd6;
//		Reset = 0;
//		#10
		
		$finish;
		
	end
  
endmodule
