`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:43:28 10/22/2019
// Design Name:   shifter
// Module Name:   C:/Comp Arch 1/MARS Items/1920a-csse232-2V/implementation/components/shifter_tb_0.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shifter_tb_0;

	// Inputs
	reg [15:0] in;
	reg [3:0] shamt;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	shifter uut (
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
		in = 15;
		shamt = 3;
		
		$write("in = %b, out = %b, shamt = %b", in, out, shamt);
        
		// Add stimulus here

	end
      
endmodule

