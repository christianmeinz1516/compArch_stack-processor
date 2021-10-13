`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Tori Szalay
//
// Create Date:   20:37:47 11/05/2019
// Design Name:   Memory_IR_SE__ZE_Shifter_sub1_c
// Module Name:   C:/Users/szalayvm/Documents/CSSE232/components/Memory_IR_SE_ZE_Shifter_sub1_c_tb.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Memory_IR_SE__ZE_Shifter_sub1_c
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: This test is NOT used in final processor implementation. It was useful
//for finding bugs in datapath, but it was too difficult to implement together with original integration plan
// 
////////////////////////////////////////////////////////////////////////////////

module Memory_IR_SE_ZE_Shifter_sub1_c_tb;

	// Inputs
	reg [9:0] addra;
	reg wea;
	reg CLK;
	reg reset;
	reg [15:0] dina;

	// Outputs
	wire [15:0] SEout;
	wire [15:0] ZEout;
	wire [15:0] ShifterOut;

	// Instantiate the Unit Under Test (UUT)
	Memory_IR_SE__ZE_Shifter_sub1_c uut (
		.addra(addra), 
		.wea(wea), 
		.CLK(CLK), 
		.reset(reset), 
		.dina(dina), 
		.SEout(SEout), 
		.ZEout(ZEout), 
		.ShifterOut(ShifterOut)
	);
	always #1 CLK = ~CLK;
	initial begin
		// Initialize Inputs
		//test 1, inst[11-4] = 0x0f and inst[5-2] = 1100 (right shift, zero=signextend)
		addra = 0;
		wea = 0;
		CLK = 0;
		reset = 0;
		dina = 0;

		// Wait 100 ns for global reset to finish
		#2;
		//test 2: write address 9 = 0x1D0F, so inst[11-4] = d0 and inst[5-2] = 0011 (left shift, zero != signextend)
		wea = 1;
		addra = 10'd9;
		dina = 16'h1d0f;
		#2
		wea = 0;
		
		//test1 checks
		if(ZEout == 16'h000f)
		$display("test1 ZE if 0 is leading: PASS");
		else
		$display("test1 ZE if 0 is leading ($d) : FAIL", ZEout);
		if(SEout == 16'h000f)
		$display("test1 SE if 0 is leading: PASS");
		else
		$display("test1 if 0 is leading ($d) : FAIL", SEout);
		if(ShifterOut == 16'h0000)
		$display("test1 Shifter -right shift: PASS");
		else
		$display("test1 Shifter -right shift ($d) : FAIL", ShifterOut);
		#2
				//test2 checks
		if(ZEout == 16'h00d0)
		$display("test2 ZE if 1 is leading: PASS");
		else
		$display("test2 ZE if 1 is leading ($d) : FAIL", ZEout);
		if(SEout == 16'hffd0)
		$display("test2 SE if 1 is leading: PASS");
		else
		$display("test2 if 1 is leading ($d) : FAIL", SEout);
		if(ShifterOut == 16'hfe80)
		$display("test2 Shifter - left shift: PASS");
		else
		$display("test2 Shifter - left shift ($d) : FAIL", ShifterOut);
		
        
		
		
		$finish;

	end
      
endmodule

