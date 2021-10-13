`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Tori Szalay
//
// Create Date:   09:21:51 11/05/2019
// Design Name:   ALU_ALUOut_and_Memory_sub1_e
// Module Name:   C:/Users/szalayvm/Documents/CSSE232/components/ALU_ALUOut_and_Memory_sub1_e_tb.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_ALUOut_and_Memory_sub1_e
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: This test is NOT used in final processor implementation. It was useful
//for finding bugs in datapath, but it was too difficult to implement together with original integration plan
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_ALUOut_and_Memory_sub1_e_tb;

	// Inputs
	reg [1:0] ALUOp;
	reg [15:0] Avalue;
	reg [15:0] Bvalue;
	reg [15:0] signImm;
	reg wea;
	reg reset;
	reg CLK;

	// Outputs
	wire [15:0] MemOutVal;
	wire zero_out;
	wire ovflw_out;

	// Instantiate the Unit Under Test (UUT)
	ALU_ALUOut_and_Memory_sub1_e uut (
		.ALUOp(ALUOp), 
		.Avalue(Avalue), 
		.Bvalue(Bvalue), 
		.signImm(signImm), 
		.wea(wea), 
		.reset(reset), 
		.CLK(CLK), 
		.MemOutVal(MemOutVal), 
		.zero_out(zero_out), 
		.ovflw_out(ovflw_out)
	);
	
	always #1 CLK = ~CLK;

	initial begin
		// Initialize Inputs
		//test 0 read address 0
		ALUOp = 2'b01;
		Avalue = 0;
		Bvalue = 0;

		signImm = 0;

		wea = 0;
		reset = 0;
		CLK = 0;
		#2;

		
		//test 1: read address 1
		wea = 0;
		Avalue = 16'h0001;
		#2;
		

		//test 2: read address 2
		Avalue = 16'h0002;
		#2;
		
		//test 0 check
		if(MemOutVal == 16'h00f0)
		$display("test0 - reading address 0 (%d) : PASS",MemOutVal);
		else
		$display("test0 - reading at address 0 (%d): FAIL", MemOutVal);
		
		//test3: read address 1 again (this time using different value of signImm)
		Avalue = 16'h0000;
		signImm = 1;
		#2;
		
		//test1 check
		if(MemOutVal == 16'h10f0)
		$display("test1 - reading address 1 (%d) : PASS",MemOutVal);
		else
		$display("test1 - reading at address 1 (%d): FAIL", MemOutVal);

		//test4: read address 0 again (checking to see not rewritten)
		signImm = 0;
		#2;
		//test2 check
		if(MemOutVal == 16'h00f4)
		$display("test2 - reading address 0 (%d) : PASS",MemOutVal);
		else
		$display("test2 - reading at address 0 (%d): FAIL", MemOutVal);
		//READ testing complete
		
		//WRITE testing begin
		
		//test5: write 8888 to address 0x1234
		Bvalue = 16'h8888;
		Avalue = 16'h1234;
		#2;
		
		//test3 check
		if(MemOutVal == 16'h10f0)
		$display("test3 - reading address 1 (%d) : PASS",MemOutVal);
		else
		$display("test3 - reading at address 1 (%d): FAIL", MemOutVal);
		wea = 1;
		
		#2;
		
		//test4 check
		if(MemOutVal == 16'h00f0)
		$display("test4 - reading address 0 (%d) : PASS",MemOutVal);
		else
		$display("test4 - reading at address 0 (%d): FAIL", MemOutVal);
		
		wea = 0;
		#2;
		
		//test5 check
		if(MemOutVal == 16'h8888)
		$display("test5 - writing to address 1234 (%d) : PASS",MemOutVal);
		else
		$display("test5 - writing to address 1234 (%d): FAIL", MemOutVal);
		
		//read value of address 0
		Avalue = 0;
		#2;
		
		//test6: read value of address 0x1234 (using different value of signImm)
		Avalue = 16'h1232;
		signImm = 16'h0002;
		
		#6;
		
		//test6 test
		if(MemOutVal == 16'h8888)
		$display("test6 - reading address 0x1232+2 = 1234 (%d) : PASS",MemOutVal);
		else
		$display("test6 - reading at address 0x1232 + 2 = 1234 (%d): FAIL", MemOutVal);
		
		
		
		
		
		$finish;
	end
      
endmodule

