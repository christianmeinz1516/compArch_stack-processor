`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:11:51 10/31/2019
// Design Name:   PCandAdder
// Module Name:   C:/Comp Arch 1/MARS Items/1920a-csse232-2V/implementation/components/PCandAdder_tb_0.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PCandAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PCandAdder_tb_0;

	// Inputs
	reg clk;
	reg regWrite;
	reg reset;
	reg [15:0] oldVal;

	// Outputs
	wire [15:0] newPC;

	// Instantiate the Unit Under Test (UUT)
	PCandAdder uut (
		.clk(clk), 
		.regWrite(regWrite),
		.reset(reset),
		.newPC(newPC)
	);

	always @(*) begin
		#1;
		clk <= ~clk;
		end

	initial begin
		// Initialize Inputs
		clk = 0;
		regWrite = 0;
		oldVal = 0;
		reset = 0;
		#100;
		
		reset = 1;
		#1;
		
		reset = 0;
		#1;
		
		
		repeat (4) begin
			#1;
			if((regWrite == 1) && (newPC != oldVal + 2)) $display("PC not incremented. regWrite = %b, oldVal = %b, newVal = %b", regWrite, oldVal, newPC);
			if((regWrite == 0) && (newPC == oldVal + 2)) $display("PC incremented while write was disabled. regWrite = %b, oldVal = %b, newVal = %b", regWrite, oldVal, newPC);
			if(regWrite == 1) begin
				oldVal = oldVal + 2;
				regWrite = 0;
			end
			
			if(regWrite == 0) regWrite = 1;
			
		end
		$finish;

	end
      
endmodule

