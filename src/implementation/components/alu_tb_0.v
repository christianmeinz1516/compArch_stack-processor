`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:03:03 10/22/2019
// Design Name:   alu
// Module Name:   C:/Comp Arch 1/MARS Items/1920a-csse232-2V/implementation/components/alu_tb_0.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_tb_0;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg [3:0] op;

	// Outputs
	wire [15:0] r;
	wire zero;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.a(a), 
		.b(b), 
		.op(op), 
		.r(r), 
		.zero(zero), 
		.overflow(overflow)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		op = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		a = 64;
		#1;
		b = 27;
		#1;
		op = 3;
		#1;
		
		$write("op = %b, a = %b, b = %b, r = %b, zero = %b, overflow = %b", op, a, b, r, zero, overflow);
		
        
		// Add stimulus here

	end
      
endmodule

