`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:50:29 10/21/2019
// Design Name:   zero_extend
// Module Name:   C:/Users/meinzecp/Documents/School/2019-2020 Courses/Computer Archetecture 1/Project/1920a-csse232-2V/implementation/components/zero_extend_tb_0.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: zero_extend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module zero_extend_tb_0;

	// Inputs
	reg [7:0] in;

	// Outputs
	wire [15:0] extended;

	// Instantiate the Unit Under Test (UUT)
	zero_extend uut (
		.in(in), 
		.extended(extended)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		// Wait 100 ns for global reset to finish
		#100; 
		// Add stimulus here
		if (extended == in)
			$display("(%d, %d) : PASS", in, extended);
		else
			$display("(%d, %d) : FAIL", in, extended);
			
		in = 97;
		// Wait 100 ns for global reset to finish
		#100; 
		// Add stimulus here
		if (extended == in)
			$display("(%d, %d) : PASS", in, extended);
		else
			$display("(%d, %d) : FAIL", in, extended);
			
		in = 128;
		// Wait 100 ns for global reset to finish
		#100; 
		// Add stimulus here
		if (extended == in)
			$display("(%d, %d) : PASS", in, extended);
		else
			$display("(%d, %d) : FAIL", in, extended);
		
		in = 223;
		// Wait 100 ns for global reset to finish
		#100; 
		// Add stimulus here
		if (extended == in)
			$display("(%d, %d) : PASS", in, extended);
		else
			$display("(%d, %d) : FAIL", in, extended);
	end
      
endmodule

