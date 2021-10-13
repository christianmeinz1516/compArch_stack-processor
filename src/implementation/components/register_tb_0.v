`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:58:26 10/22/2019
// Design Name:   register
// Module Name:   C:/Users/meinzecp/Documents/School/2019-2020 Courses/Computer Archetecture 1/Project/1920a-csse232-2V/implementation/components/register_tb_0.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module register_tb_0;

	// Inputs
	reg regWrite;
	reg clk;
	reg [15:0] w_data;

	// Outputs
	wire [15:0] r_data;

	// Instantiate the Unit Under Test (UUT)
	register uut (
		.regWrite(regWrite), 
		.clk(clk), 
		.w_data(w_data), 
		.r_data(r_data)
	);

	initial begin
		//case 1
		regWrite = 1;
		clk = 0;
		w_data = 1;
		#100;
		clk = 1;
		#100
		clk = 0;
		regWrite = 0;
		#100
		if(r_data != w_data)
			$display("Case1 : Fail");
		clk = 1;
		#100;
			
		//case 2
		regWrite = 1;
		clk = 0;
		w_data = 256;
		#100;
		clk = 1;
		#100
		clk = 0;
		regWrite = 0;
		#100
		if(r_data != w_data)
			$display("Case2 : Fail");
		clk = 1;
		#100;
		
		//case 3
		regWrite = 1;
		clk = 0;
		w_data = 'b1111111111111111;
		#100;
		clk = 1;
		#100
		clk = 0;
		regWrite = 0;
		#100
		if(r_data != w_data)
			$display("Case3 : Fail");
		clk = 1;
		#100;
	end
      
endmodule



