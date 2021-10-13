`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: William Dalby
//
// Create Date:   20:48:23 10/22/2019
// Design Name:   PCadder
// Module Name:   C:/Comp Arch 1/MARS Items/1920a-csse232-2V/implementation/components/PCadder_tb_0.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PCadder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: This test is NOT used in final processor implementation. It was useful
//for finding bugs in datapath, but it was too difficult to implement together with original integration plan
// 
////////////////////////////////////////////////////////////////////////////////

module PCadder_tb_0;

	// Inputs
	reg [15:0] PCin;

	// Outputs
	wire [15:0] PCout;

	// Instantiate the Unit Under Test (UUT)
	PCadder uut (
		.PCin(PCin), 
		.PCout(PCout)
	);

	initial begin
		// Initialize Inputs
		PCin = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		PCin = 128;
		#1;
		
		$write("PCin = %b, PCout = %b", PCin, PCout);
		
		if(PCout != PCin + 2) $display("FAIL! :( " );
		
		
		
	end
      
endmodule

