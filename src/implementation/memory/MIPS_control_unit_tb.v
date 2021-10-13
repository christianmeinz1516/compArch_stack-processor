`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:35:42 10/21/2019
// Design Name:   MIPS_control_unit
// Module Name:   C:/Users/szalayvm/Documents/CSSE232/memory/MIPS_control_unit_tb.v
// Project Name:  memory
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MIPS_control_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MIPS_control_unit_tb;

	// Inputs
	reg [5:0] Opcode;
	reg CLK;
	reg Reset;

	// Outputs
	wire ALUSrc;
	wire MemtoReg;
	wire RegDst;
	wire RegWrite;
	wire MemRead;
	wire MemWrite;
	wire Branch;

	// Instantiate the Unit Under Test (UUT)
	MIPS_control_unit uut (
		.ALUSrc(ALUSrc), 
		.MemtoReg(MemtoReg), 
		.RegDst(RegDst), 
		.RegWrite(RegWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.Opcode(Opcode), 
		.CLK(CLK), 
		.Reset(Reset)
	);

	initial begin
		// Initialize Inputs
		Opcode = 0;
		CLK = 0;
		Reset = 0;
		

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//test R-type instructions
		#100;
		CLK = ~CLK;
		Opcode = 6'b000000;
		//let stuff be read on positive edge
		#100;
		CLK = ~CLK;
		
		//test beq
		#100;
		CLK = ~CLK;
		Opcode = 6'b000100;
		//let stuff be read on positive edge
		#100;
		CLK = ~CLK;
		
		//test lw
		#100;
		CLK = ~CLK;
		Opcode = 6'b100011;	
		//let stuff be read on positive edge
		#100;
		CLK = ~CLK;
		
		//test sw
		#100;
		CLK = ~CLK;
		Opcode = 6'b101011;
		//let stuff be read on positive edge
		#100;
		CLK = ~CLK;
		

	end
      
endmodule

