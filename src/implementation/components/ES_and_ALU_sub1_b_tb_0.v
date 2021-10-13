`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Christian Meinzen
//
// Create Date:   11:03:45 11/04/2019
// Design Name:   ES_and_ALU_sub1_b
// Module Name:   C:/Users/meinzecp/Documents/School/2019-2020 Courses/Computer Archetecture 1/Project/1920a-csse232-2V/implementation/components/ES_and_ALU_sub1_b_tb_0.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ES_and_ALU_sub1_b
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: This test is NOT used in final processor implementation. It was useful
//for finding bugs in datapath, but it was too difficult to implement together with original integration plan
// 
////////////////////////////////////////////////////////////////////////////////

module ES_and_ALU_sub1_b_tb_0;

	// Inputs
	reg clk_in;
	reg reset_in;
	reg [1:0] ESOp_in;
	reg ESAct_in;
	reg [1:0] dupNum_in;
	reg popNum_in;
	reg [1:0] ALUOp_in;
	reg [15:0] valIn;
	reg stackSrc;

	// Outputs
	wire [15:0] ALUOut;
	wire zero_out;
	wire ovflw_out;

	// Instantiate the Unit Under Test (UUT)
	ES_and_ALU_sub1_b uut (
		.clk(clk_in), 
		.reset(reset_in), 
		.ESOp(ESOp_in), 
		.ESAct(ESAct_in), 
		.dupAmt(dupNum_in), 
		.popAmt(popNum_in), 
		.ALUOp(ALUOp_in), 
		.ALUOut(ALUOut), 
		.zero_out(zero_out), 
		.ovflw_out(ovflw_out),
		.stackSrc(stackSrc),
	   .valIn(valIn)
	);

	always @(*) begin
	#1;
	clk_in <= ~clk_in;
	end

	initial begin
		// Initialize Inputs
		clk_in = 0;
		reset_in = 1;
		ESOp_in = 0;
		ESAct_in = 0;
		dupNum_in = 0;
		popNum_in = 0;
		ALUOp_in = 0;
		#100;
		
		// Sync the clock *make sure to check that it is in sync and not 1 ns off*
		clk_in = 0;
		reset_in = 0;
		#2;
		
		/**
		* Test Add:
		*/
			// Push 1 and 2 onto the stack
			ESAct_in = 1;
			valIn = 1;
			stackSrc = 0;
			#2;
			valIn = 2;
			#2;
			
			// Make sure that nothing happens to the stack now
			// Reg A and B should now have the correct data
			ESAct_in = 1;
			ESOp_in = 1;
			popNum_in = 1;
			#2;
			
			//Go through the ALU and add
			ALUOp_in = 1;
			ESAct_in = 0;
			#2;
			
			// Push the ALUout onto the stack
			ESAct_in = 1;
			ESOp_in = 0;
			stackSrc = 1;
			#2;
			
			// Wait for the new data to go into Reg A and stop to check.
			ESAct_in = 0;
			#2;
			
			$stop; // Reg A should have w=3 and r=2
			#2;
			$stop; // Reg A should have w=3 and r =3
		
		// Reset the system
		reset_in = 0;
		#2;
		reset_in = 1;
		ESOp_in = 0;
		ESAct_in = 0;
		dupNum_in = 0;
		popNum_in = 0;
		ALUOp_in = 0;
		#2;
		reset_in = 0;
		#100;
		
		
		/**
		* Test 2:
		*/
		
		// Wait 100 ns for global reset to finish
		#100;
	end
      
endmodule

