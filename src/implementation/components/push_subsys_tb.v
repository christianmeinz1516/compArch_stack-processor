`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Tori Szalay
//
// Create Date:   15:08:56 11/09/2019
// Design Name:   Push_subsys
// Module Name:   C:/Users/szalayvm/Documents/CSSE232/componentsthree/push_subsys_tb.v
// Project Name:  componentsthree
// Target Device:  
// Tool versions:  
// Description: tests our push_subsys file
//
// Verilog Test Fixture created by ISE for module: Push_subsys
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: there is a premade waveform for this file
// 
////////////////////////////////////////////////////////////////////////////////

module push_subsys_tb;

	// Inputs
	reg ShiftSrc;
	reg ShamtSrc;
	reg RegWrite;
	reg [2:0] PushSrc;
	reg [15:0] ALUOutWire;
	reg [15:0] bWire;
	reg [15:0] aWire;
	reg [15:0] Memoutw;
	reg [15:0] IRw;
	reg [15:0] SEw;
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] PushValw;

	// Instantiate the Unit Under Test (UUT)
	Push_subsys uut (
		.ShiftSrc(ShiftSrc), 
		.ShamtSrc(ShamtSrc), 
		.RegWrite(RegWrite), 
		.PushSrc(PushSrc), 
		.PushValw(PushValw), 
		.ALUOutWire(ALUOutWire), 
		.bWire(bWire), 
		.aWire(aWire), 
		.Memoutw(Memoutw), 
		.IRw(IRw), 
		.SEw(SEw), 
		.clk(clk), 
		.reset(reset)
	);
	
	always #1 clk = ~clk;

	initial begin
		// Initialize Inputs
		ShiftSrc = 0;
		ShamtSrc = 0;
		RegWrite = 0;
		PushSrc = 0;
		ALUOutWire = 0;
		bWire = 0;
		aWire = 0;
		Memoutw = 0;
		IRw = 0;
		SEw = 0;
		clk = 0;
		reset = 1;

		#2;
		reset = 0;
		IRw = 16'hffff;
		#4;
		//change PushSrc value to reg file output so that PushVal gets sp value
		PushSrc = 3'b100;
		//set IR[1:0] to sp's address and IR[5-2] = 3 for shamt amount
		IRw = 16'h000d;
		if(PushValw == 16'h00ff)
		$display("test1 zeroextender push: PASS");
		else
		$display("test1 zeroextender push: FAIL");
		#4;
		//set aValue to 0xffdd and set pushSrc to shifter output
		aWire = 16'hffdd;
		PushSrc = 3'b010;
		if(PushValw == 16'h7fcd)
		$display("test2 regfile push: PASS");
		else
		$display("test2 regfile push: FAIL");
		#4;
		if(PushValw == 16'hdd00)
		$display("test3 shifter push: PASS");
		else
		$display("test3 shifter push: FAIL");
		
		
        
		// Add stimulus here
		$finish;

	end
      
endmodule

