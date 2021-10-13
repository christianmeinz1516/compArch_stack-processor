`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:50:05 11/09/2019
// Design Name:   ES_subsys
// Module Name:   C:/Users/szalayvm/Documents/CSSE232/componentsthree/ES_subsys_tb.v
// Project Name:  componentsthree
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ES_subsys
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ES_subsys_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [15:0] IRw;
	reg popAmt;
	reg ESAct;
	reg flip;
	reg [1:0] ESop;
	reg [1:0] ALUOp;
	reg [1:0] ALUSrcB;
	reg [15:0] PushValw;

	// Outputs
	wire [15:0] aWire;
	wire [15:0] SEw;
	wire [15:0] ALUOutWire;
	wire [15:0] bWire;
	wire zero;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	ES_subsys uut (
		.clk(clk), 
		.reset(reset), 
		.IRw(IRw), 
		.popAmt(popAmt), 
		.ESAct(ESAct), 
		.ESop(ESop), 
		.ALUOp(ALUOp), 
		.ALUSrcB(ALUSrcB), 
		.PushValw(PushValw), 
		.aWire(aWire), 
		.SEw(SEw), 
		.ALUOutWire(ALUOutWire), 
		.bWire(bWire), 
		.zero(zero), 
		.overflow(overflow)
	);
	
	always #1 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		IRw = 0;
		popAmt = 0;
		ESAct = 0;
		ESop = 0;
		ALUOp = 0;
		ALUSrcB = 0;
		PushValw = 0;

		// Wait 100 ns for global reset to finish
		#2;
		reset = 0;
		
		//test pushing	
		#2;
		PushValw = 16'h2222;
		ESAct = 1;
		ESop = 2'b00;
		ALUOp = 2'b01;
		
		//only push 0x2222 on twice so that ALUOp is adding
		#4;
		ESAct = 0;
		#2;		
		
//check that AlU performs on peek values of execution stack (ALUSrcB = 0)
		#2;
		if(ALUOutWire == 16'h4444)
		$display("test1 addfromES push: PASS");
		else
		$display("test1 addfromES push %d: FAIL", ALUOutWire);
		
		//set IRw to pushLi 8 opcode (is cut in the ES_subsys to just get immediate, then is sign-extended)
		//check that ALUSrcB works for sign extended immediate (ALUSrcB = 1)
		IRw = 16'h2090;
		ALUSrcB = 1;
		#4;
		
		if(ALUOutWire == 16'h222b)
		$display("test2 addfromSEimmediate: PASS");
		else
		$display("test2 addfromSEimmediate %d: FAIL", ALUOutWire);
		
		
		#2;
		
      $finish;
		

	end
      
endmodule

