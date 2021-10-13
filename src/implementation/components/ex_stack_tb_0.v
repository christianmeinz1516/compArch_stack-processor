`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:08:09 10/23/2019
// Design Name:   ex_stack
// Module Name:   C:/Users/meinzecp/Documents/School/2019-2020 Courses/Computer Archetecture 1/Project/1920a-csse232-2V/implementation/components/ex_stack_tb_0.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ex_stack
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ex_stack_tb_0;

	// Inputs
	reg [15:0] pushVal;
	reg popNum;
	reg [1:0] dupNum;
	reg [1:0] ESOp;
	reg ESAct;
	reg clk;

	// Outputs
	wire [15:0] outA;
	wire [15:0] outB;

	// Instantiate the Unit Under Test (UUT)
	ex_stack uut (
		.pushVal(pushVal), 
		.popNum(popNum), 
		.dupNum(dupNum), 
		.outA(outA), 
		.outB(outB),
		.ESOp(ESOp),
		.ESAct(ESAct),
		.clk(clk)
	);

	always @(*) begin
	#1;
	clk <= ~clk;
	end

	initial begin
		// initialize everything and sync up the clock
		clk = 0;
		ESOp = 0;
		ESAct = 0;
		dupNum = 0;
		popNum = 0;
		#100;	
		clk = 0;
		#2;
		
		/**
		* This tests an initial push and initial pop
		*/
			// begin first push test
			ESAct = 1;
			pushVal = 1;
			#2;

			// wait until the value TOS goes into OutA
			ESAct = 0;
			#2;
			
			if(outA != 1)
				$display("FAIL: initial push");
			#2;
			
			ESAct = 1;
			ESOp = 1;
			popNum = 0;
			#2;
			
			ESAct = 0;
			#2;
			
			// manually check to see that there is nothing on the stack
			$stop;
			
			pushVal = 0;
			#100;
		
		/**
		* This will test pushing 32 things onto the stack (the state of the stack should not change after this)
		* We shall also look at popping 2 things at once as well as duplicate.
		*/
			repeat (32) begin
				ESAct = 1;
				ESOp = 0;
				pushVal = pushVal + 1;
				#2;
			end
			
			ESAct = 0;
			#2;
			$stop;
			// try to push one more on (should do nothing)
			ESAct = 1;
			ESOp = 0;
			pushVal = pushVal + 1;
			#2;

			ESAct = 0;
			#2;
			$stop;
			
			// test popping off two items at once
			ESAct = 1;
			ESOp = 1;
			popNum = 1;
			#2;
			
			ESAct = 0;
			#2;
			#2; // check that the actCount works properly
			$stop;
			
			// Now try duplicating (there should be 29 and 30 twice in the top four spots)
			ESAct = 1;
			ESOp = 2;
			dupNum = 1;
			#2;
			$stop;
			
	end
endmodule

