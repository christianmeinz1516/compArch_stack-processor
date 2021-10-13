`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Christian Meinzen
//
// Create Date:   14:53:13 11/06/2019
// Design Name:   Mem_RegFile_ES_sub1_f
// Module Name:   C:/Users/meinzecp/Documents/School/2019-2020 Courses/Computer Archetecture 1/Project/1920a-csse232-2V/implementation/components/Mem_RegFile_ES_sub1_f_tb_0.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mem_RegFile_ES_sub1_f
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: This test is NOT used in final processor implementation. It was useful
//for finding bugs in datapath, but it was too difficult to implement together with original integration plan
// 
////////////////////////////////////////////////////////////////////////////////

module Mem_RegFile_ES_sub1_f_tb_0;

	// Inputs
	reg [1:0] regAddress;
	reg wea;
	reg regWrite;
	reg [15:0] push_in;
	reg [1:0] pushSrc;
	reg popNum;
	reg [1:0] ESOp;
	reg ESAct;
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] a_out;
	wire [15:0] b_out;

	// Instantiate the Unit Under Test (UUT)
	Mem_RegFile_ES_sub1_f uut (
		.a_out(a_out), 
		.b_out(b_out), 
		.regAddress(regAddress), 
		.wea(wea), 
		.regWrite(regWrite), 
		.push_in(push_in), 
		.pushSrc(pushSrc), 
		.popNum(popNum), 
		.ESOp(ESOp), 
		.ESAct(ESAct), 
		.clk(clk), 
		.reset(reset)
	);
	
	always @(*) begin
	#1;
	clk <= ~clk;
	end

	initial begin
		// Initialize Inputs
		regAddress = 0;
		wea = 0;
		regWrite = 0;
		push_in = 0;
		pushSrc = 0;
		popNum = 0;
		ESOp = 0;
		ESAct = 0;
		clk = 0;
		reset = 1;
		#100;
		
		
		// Sync the clock
		clk = 0;
		reset = 0;
		#2;
		
		/**
		* Test 1:
		*/
			// Pushes '0' onto the stack
			push_in = 1;
			pushSrc = 1;
			ESAct = 1;
			ESOp = 0;
			#2;
			
			// Value should now be in reg A -- checked
			ESAct = 0;
			#2;
			
			// Adress of mem = a_out -- checked
			wea = 0;
			#2;
			
			// pushVal should now be the mem_out value and tos should decrement
			ESAct = 1;
			ESOp = 1;
			popNum = 0;
			pushSrc = 2;
			#2;
			
			// stack should now be updated to inclued mem_out -- checked
			ESAct = 1;
			ESOp = 0;
			#2;
			$stop;
		
		/**
		* Test 2:
		*/
			// Value should now be in reg A
			ESAct = 0;
			#2;
			
			// regFile = a_out -- checked
			ESAct = 1;
			ESOp = 1;
			popNum = 0;
			regWrite = 1;
			regAddress = 0;
			#2;
			$stop;
			
		/**
		* Test 3:
		*/
			// make sure that nothing really happens to the regFile and stack -- checked
			ESAct = 0;
			regWrite = 0;
			#4;
			
			// stack should now have stack[tos] = 1 and stack[tos+1] = 15 -- checked
			ESAct = 1;
			push_in = 15;
			pushSrc = 1;
			ESOp = 0;
			#2;
			pushSrc = 0;
			#2;
			
			ESAct = 0;
			#2;
			
			// Memory[0] should update to 15 -- checked
			wea = 1;
			ESAct = 1;
			popNum = 1;
			ESOp = 1;
			#2;
			
			// Nothing should happen -- checked
			wea = 0;
			ESAct = 0;
			#100;
			$stop;
		
	end
      
endmodule

