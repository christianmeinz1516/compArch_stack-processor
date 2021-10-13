`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:56:24 11/17/2019
// Design Name:   arithmeticShifter
// Module Name:   C:/Comp Arch 1/MARS Items/reworked/implementation/components/arithmeticShifter_tb_0.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: arithmeticShifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module arithmeticShifter_tb_0;

	// Inputs
	reg [15:0] in;
	reg [4:0] shamt;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	arithmeticShifter uut (
		.in(in), 
		.shamt(shamt), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		shamt = 0;

		// Wait 100 ns for global reset to finish
		#100;
		in = 17;
		shamt = 3;
		#10
		$finish;
        
		// Add stimulus here

	end
      
endmodule

