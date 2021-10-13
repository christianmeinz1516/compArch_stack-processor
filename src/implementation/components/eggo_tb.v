`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:46:04 11/12/2019
// Design Name:   datapathCONTROL_eggo
// Module Name:   C:/Users/szalayvm/Documents/CSSE232/components/eggo_tb.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: datapathCONTROL_eggo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//runs these series of instructions from .coe file thus far:
//0.pushLi 8 
//1.pushLi 17
//2.add
//3.dup 0
//4.beq 6
//5.pushLi 7
//6.pushLi 43
//7.pushLi 0
//8.pushM 0
//9.popR $v0
//10.pushLi 42
//11.slt
//12.ls 3
//13. j 15
//14. pushLi 15
//15. pushLi 18
//16. js
//17. pushLi 5 
//18. dup 0
//bne
// 
////////////////////////////////////////////////////////////////////////////////

module eggo_tb;

	// Inputs
	reg reset;
	reg clk;
	reg [15:0] input_IO;

	// Outputs
	wire [15:0] fromPushVal;
	wire overflow;
	wire [4:0] current_state;
	wire [4:0] next_state;
	wire [15:0] IRtoControlwire;
	wire [15:0] output_IO;

	// Instantiate the Unit Under Test (UUT)
	datapathCONTROL_eggo uut (
		.reset(reset), 
		.clk(clk), 
		.fromPushVal(fromPushVal), 
		.overflow(overflow), 
		.current_state(current_state), 
		.next_state(next_state),
		.IRtoControlwire(IRtoControlwire),
		.input_IO(input_IO),
		.output_IO(output_IO)
	);

	always #1 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		#100;
		reset = 1;
		input_IO = 5040;
		#4;
		reset = 0;
		#2;
		if (output_IO != 0)
			$finish;
		else
			#2;
		
    end
endmodule

