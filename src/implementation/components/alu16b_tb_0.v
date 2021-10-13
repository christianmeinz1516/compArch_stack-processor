`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:16:39 10/28/2019
// Design Name:   alu16b
// Module Name:   C:/Comp Arch 1/MARS Items/1920a-csse232-2V/implementation/components/alu16b_tb_0.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu16b
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu16b_tb_0;

	// Inputs
	reg signed [15:0] a;
	reg signed [15:0] b;
	reg [1:0] op;

	// Outputs
	wire signed [15:0] r;
	wire ovflw;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	alu16b uut (
		.a(a), 
		.b(b), 
		.op(op), 
		.r(r), 
		.ovflw(ovflw), 
		.zero(zero)
	);

initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		op = 0;

		// Wait 100 ns for global reset to finish
		#100;	
		op = 0;
		repeat (4) begin // op values
			a = -256;
			repeat (512) begin // a values
				b = -256;
				repeat (512) begin // b values
					#1;
					case(op)
						0: if (r != (a | b)) $display("FAIL. OR. a = %b, b = %b, r = %b, expected = %b", a, b, r, a|b);
						
						1:	if (r != (a + b)) $display("FAIL. ADD. a = %b, b = %b, r = %b, expected = %b", a, b, r, a+b);
							
						2: if (r != (a - b)) $display("FAIL. SUB. a = %b, b = %b, r = %b, expected = %b", a, b, r, a-b);
						
						3: 
							begin
								//sub = a - b;
								if ((a<b) && (r != 1) && (ovflw == 0))
									begin
										$display("FAIL. SLT. a = %b, b = %b, r = %b", a, b, r);
										$finish;
									end
							end
					endcase
					
					if ((r==0) & (zero != 1)) $display("ZERO DETECTOR INCORRECT  a = %b, b = %b, zero = %b, op = %b", a, b, zero, op);
					
					b = b + 1;
				end
				a = a + 1;
			end
			op = op + 1;
		end
		
	
	end 
      
endmodule

