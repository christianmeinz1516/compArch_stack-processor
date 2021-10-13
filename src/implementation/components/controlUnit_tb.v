`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:57:12 11/01/2019
// Design Name:   controlUnit
// Module Name:   C:/Users/szalayvm/Documents/CSSE232/components/controlUnit_tb.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module controlUnit_tb;

	// Inputs
	reg [3:0] Opcode;
	reg [1:0] dampt;
	reg [1:0] funct;
	reg CLK;
	reg Reset;

	// Outputs
	wire popAmt;
	wire flip;
	wire [1:0] ESOp;
	wire ESAct;
	wire ALUSrcA;
	wire IRWrite;
	wire [1:0] ALUSrcB;
	wire [1:0] ALUOp;
	wire [1:0] PCSrc;
	wire [2:0] PushSrc;
	wire ShiftSrc;
	wire ShamtSrc;
	wire RegWrite;
	wire IorD;
	wire wea;
	wire PCWrite;
	wire BEQCond;
	wire BNECond;
	//wire IRWrite;
	//wire RegWrite;
	wire RegDst;
	wire [1:0] dupNum;
	wire [3:0] current_state;
	wire [3:0] next_state;

	// Instantiate the Unit Under Test (UUT)
	controlUnit uut (
		.popAmt(popAmt), 
		.flip(flip), 
		.ESOp(ESOp), 
		.ESAct(ESAct), 
		.ALUSrcA(ALUSrcA), 
		.ALUSrcB(ALUSrcB), 
		.ALUOp(ALUOp), 
		.PCSrc(PCSrc), 
		.PushSrc(PushSrc), 
		.ShiftSrc(ShiftSrc), 
		.ShamtSrc(ShamtSrc), 
		.IorD(IorD), 
		.wea(wea), 
		.PCWrite(PCWrite), 
		.BEQCond(BEQCond), 
		.BNECond(BNECond), 
		.RegWrite(RegWrite), 
		.IRWrite(IRWrite), 
		.RegDst(RegDst), 
		.dupNum(dupNum), 
		.Opcode(Opcode), 
		.dampt(dampt), 
		.funct(funct), 
		.current_state(current_state), 
		.next_state(next_state), 
		.CLK(CLK), 
		.Reset(Reset)
	);

	initial begin
		// Initialize Inputs
		Opcode = 0;
		dampt = 0;
		funct = 0;
		CLK = 0;
		Reset = 0;
		

		// Wait 100 ns for global reset to finish
		
		#100;
		//test PUSHM instruction which goes through five stages
		#100;
		CLK = ~CLK;
		Opcode = 4'b0000;
		funct = 2'b00;
		//let stuff be read on positive edge
		#100;
		CLK = ~CLK;
		#100;
		CLK = ~CLK;
		#100;
		CLK = ~CLK;
		#100;
		CLK = ~CLK;
		#100;
		CLK = ~CLK;
		#100;
		CLK = ~CLK;
		#100;
		CLK = ~CLK;
		#100;
		CLK = ~CLK;
		#100;
		CLK = ~CLK;
        
		// Add stimulus here

	end
      
endmodule

