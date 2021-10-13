`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:58:59 11/05/2019
// Design Name:   PushSrc_and_ES_sub1_d
// Module Name:   C:/Users/meinzecp/Documents/School/2019-2020 Courses/Computer Archetecture 1/Project/1920a-csse232-2V/implementation/components/PushSrc_and_ES_sub1_d_tb_0.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PushSrc_and_ES_sub1_d
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PushSrc_and_ES_sub1_d_tb_0;

	// Inputs
	reg [1:0] ESOp;
	reg [2:0] pushSrc;
	reg ESAct;
	reg reset;
	reg clk;

	// Outputs
	wire [15:0] tosRega;
	wire [15:0] tosRegb;

	// Instantiate the Unit Under Test (UUT)
	PushSrc_and_ES_sub1_d uut (
		.ESOp(ESOp), 
		.pushSrc(pushSrc), 
		.ESAct(ESAct), 
		.reset(reset), 
		.clk(clk), 
		.tosRega(tosRega), 
		.tosRegb(tosRegb)
	);
	
	always @(*) begin
	#1;
	clk <= ~clk;
	end

	initial begin
		// Initialize Inputs
		ESOp = 0;
		pushSrc = 0;
		ESAct = 0;
		reset = 1;
		clk = 0;
		#100;
		
		// Sync the clock
		clk = 0;
		reset = 0;
		#2;
        
		/**
		* Test 1:
		*/
			#2;
			
			repeat (7) begin
				pushSrc = pushSrc + 1;
				ESAct = 1;
				ESOp = 0;
				#2;
			end
			
			#2;
			$stop;
			
			ESAct = 0;
			#2;
			$stop; // check to see if all push values are now in the stack. NOTE** Reg A and B should be 3 because of the last 2 mux values
			
			
		/**
		* Test 2:
		*/
			pushSrc = 0;
			ESAct = 1;
			ESOp = 2;
			#2;
			$stop;
			
			ESAct = 0;
			#2;
			
			ESAct = 1;
			ESOp = 1;
			#2;
			#2;
			#2;
			$stop;
			
			ESAct = 0;
			pushSrc = 7;
			#2;
			
			ESAct = 1;
			ESOp = 0;
			#2;
			$stop;
			

	end
      
endmodule

