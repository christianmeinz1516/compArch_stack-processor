`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:08:16 10/22/2019
// Design Name:   reg_file_4
// Module Name:   C:/Users/meinzecp/Documents/School/2019-2020 Courses/Computer Archetecture 1/Project/1920a-csse232-2V/implementation/components/reg_file_4_tb_0.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_file_4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module reg_file_4_tb_0;

	// Inputs
	reg [15:0] w_data;
	reg [1:0] address;
	reg clk;
	reg regWrite;

	// Outputs
	wire [15:0] r_data;

	// Instantiate the Unit Under Test (UUT)
	reg_file_4 uut (
		.w_data(w_data), 
		.r_data(r_data), 
		.address(address), 
		.clk(clk), 
		.regWrite(regWrite)
	);

	initial begin
		// Initial set up
		address = 0;
		w_data = 10;
		repeat (4) begin
			clk = 1;
			#50;
			regWrite = 1;
			clk = 0;
			#50;
			address = address + 1;
			w_data = w_data + 10;
		end
		
		// Test initial set up
		address = 0;
		w_data = 10;
		repeat (3) begin
			clk = 1;
			#50;
			regWrite = 0;
			clk = 0;
			#50;
			if(r_data != w_data)
				$display("Initial Set-Up (%d) : FAIL", address);
			address = address + 1;
			w_data = w_data + 10;
		end
		
		clk = 1;
		#50;
		regWrite = 0;
		clk = 0;
		#50;
		if(r_data != 0)
			$display("Initial Set-Up (%d) : FAIL", address);
	end
      
endmodule

