`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Tori Szalay
//
// Create Date:   08:07:34 11/08/2019
// Design Name:   PC_subsys
// Module Name:   C:/Users/szalayvm/Documents/CSSE232/componentsthree/pc_subsys_tb.v
// Project Name:  componentsthree
// Target Device:  
// Tool versions:  
// Description: Tests our pc_subsys file
//
// Verilog Test Fixture created by ISE for module: PC_subsys
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: there is a premade waveform for this test
// 
////////////////////////////////////////////////////////////////////////////////

module pc_subsys_tb;

	// Inputs
	reg BEQCond;
	reg zero;
	reg BNECond;
	reg PCWrite;
	reg [15:0] IRw;
	reg [15:0] aWire;
	reg [1:0] PCSource;
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] PCw;

	// Instantiate the Unit Under Test (UUT)
	PC_subsys uut (
		.BEQCond(BEQCond), 
		.zero(zero), 
		.BNECond(BNECond), 
		.PCWrite(PCWrite), 
		.IRw(IRw), 
		.aWire(aWire), 
		.PCSource(PCSource), 
		.PCw(PCw), 
		.clk(clk), 
		.reset(reset)
	);

	always #1 clk = ~clk;
	initial begin
		// Initialize Inputs
		BEQCond = 0;
		zero = 0;
		BNECond = 0;
		PCWrite = 1;
		IRw = 0;
		aWire = 0;
		PCSource = 0;
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#2
		// make sure that pc increments by two
		reset = 0;
		#20
		//test setting PC to aWire value
		aWire = 16'd5;
		#2
		if(PCw == 16'd11)
		$display("test1 increment PC from reset: PASS");
		else
		$display("test1 increment PC from reset: FAIL");
		//set PCSource to aWire
		PCSource = 2'b10;
		#2

//set PC to 0 to increment PC again		
		PCSource = 0;
		#2
		if(PCw == 16'd5)
		$display("test2 set PC to A value: PASS");
		else
		$display("test2 set PC to A value : FAIL");
		#2
		if(PCw == 16'd6)
		$display("test3 increment PC value after setting it to A: PASS");
		else
		$display("test3 increment PC value after setting it to A : FAIL");
		//let increment so that PCw has upper MSB that is not zero
		#5
		//set IRw to value not zero with upper bits not 0
		IRw = 16'hffc5;
		#2
		//set PCSource to Branchw calculation
		PCSource = 2'b01;
		PCWrite = 0;
		BEQCond = 1;
		zero = 1;
		#4
		if(PCw == 16'h0fc5)
		$display("test4 PC set to branch: PASS");
		else
		$display("test4 PC set to branch : FAIL");
		#2;
		//make sure that it doesn't branch when zero condition changes
		IRw = 16'h7777;
		zero = 0;
		#10;
		if(PCw == 16'h0fc5)
		$display("test5 PC do not set to branch: PASS");
		else
		$display("test5 PC do not set to branch : FAIL");
		
        
	
		$finish;

	end
      
endmodule

