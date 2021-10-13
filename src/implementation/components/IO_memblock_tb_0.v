`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:35:27 11/13/2019
// Design Name:   IO_memblock
// Module Name:   C:/Users/meinzecp/Documents/School/2019-2020 Courses/Computer Archetecture 1/Project/1920a-csse232-2V/implementation/components/IO_memblock_tb_0.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IO_memblock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module IO_memblock_tb_0;

	// Inputs
	reg [15:0] fromInput;
	reg [15:0] address;
	reg [15:0] data_in;
	reg wea;
	reg clk;

	// Outputs
	wire [15:0] toOutput;
	wire [15:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	IO_memblock uut (
		.fromInput(fromInput), 
		.address(address), 
		.data_in(data_in), 
		.toOutput(toOutput), 
		.data_out(data_out), 
		.wea(wea), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		fromInput = 0;
		address = 0;
		data_in = 0;
		wea = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		//test reading from coe file
		//read from memory address 0 without writing to it (address 0 = 0x0000)
		#100;
		
		
		//read from memory address 0 without writing to it (address 0 = 0x0000)
		#100;
		clk = ~clk;
		wea = 1'b0;
		address = 10'd1;
		repeat(2)begin
			#100;
			clk = ~clk;
		end

		//read from memory address 1 without writing to it (address 1 = 0x1000)
		wea = 1'b0;
		address = 10'd1;
		if(data_out == 16'h0000)
			$display("Stores address0 coe (%d) : PASS", data_out);
		if(data_out != 16'h0000)
			$display("Stores address0 coe(%d) : FAIL", data_out);
		repeat(2)begin
			#100;
			clk = ~clk;
		end

		//read from memory address 2 without writing to it (address 2 = 8c00)
		address = 10'd2;

		repeat(2)begin
			#100;
			clk = ~clk;
		end
		if(data_out == 16'h1000)
			$display("Stores address1 coe (%d) : PASS", data_out);
		if(data_out != 16'h1000)
			$display("Stores address1 coe (%d) : FAIL", data_out);


		//test writing to memory
		wea = 1'b1;
		//write address 4 = 0x8888
		address = 10'd4;
		data_in = 16'h8888;
		repeat(2)begin
			#100;
			clk = ~clk;
		end
		if(data_out == 16'h8c00)
			$display("Stores address2 coe (%d) : PASS", data_out);
		if(data_out != 16'h8c00)
			$display("Stores address2 coe (%d) : FAIL", data_out);
		
		//write address 17 = 0x9999
		address = 10'd17;
		data_in = 16'h9999;
		repeat(2)begin
			#100;
			clk = ~clk;
		end
		if(data_out == 16'h8888)
			$display("tests writing at address 4 (%d) : PASS", data_out);
		if(data_out != 16'h8888)
			$display("tests writing at address 4 (%d) : FAIL", data_out);	
		//rewrite address 1 = 0x5656 ( was already written by coe file)
		address = 10'd1;
		data_in = 16'h5656;

		repeat(2)begin
			#100;
			clk = ~clk;
		end
		if(data_out == 16'h9999)
			$display("tests writing at address 17 (%d) : PASS", data_out);
		if(data_out != 16'h9999)
			$display("tests writing at address 17 (%d) : FAIL", data_out);	
		repeat(2)begin
			#100;
			clk = ~clk;
		end
		if(data_out == 16'h5656)
			$display("tests rewriting at address 1(%d) : PASS", data_out);
		if(data_out != 16'h5656)
			$display("tests rewriting at address 1 (%d) : FAIL", data_out);	
			
		
		// write to IO
		address = 16'h7001;
		data_in = 16'h1515;
		repeat(2)begin
			#100;
			clk = ~clk;
		end
		if(toOutput == 16'h1515)
			$display("IO rewriting at address 0x7001(%d) : PASS", toOutput);
		if(toOutput != 16'h1515)
			$display("IO rewriting at address 0x7001 (%d) : FAIL", toOutput);
		
		// read from IO
		wea = 0;
		address = 16'h7001;
		data_in = 16'h1616;
		fromInput = 16'h1515;
		repeat(2)begin
			#100;
			clk = ~clk;
		end
		if(data_out == 16'h1515)
			$display("IO reading from address 0x7001(%d) : PASS", data_out);
		if(data_out != 16'h1515)
			$display("IO reading from address 0x7001 (%d) : FAIL", data_out);
		
		// write to IO at top bound
		wea = 1;
		address = 16'h7ffe;
		data_in = 16'h0005;
		repeat(2)begin
			#100;
			clk = ~clk;
		end
		if(toOutput == 16'h0005)
			$display("IO rewriting at address 0x7ffe(%d) : PASS", toOutput);
		if(toOutput != 16'h0005)
			$display("IO rewriting at address 0x7ffe (%d) : FAIL", toOutput);
			
		address = 16'h6999;
		data_in = 16'h0000;
		repeat(2)begin
			#100;
			clk = ~clk;
		end
		// Test outside of IO stuff
		if(toOutput == 16'h0005)
			$display("IO rewriting at address 0x7fff(%d) : PASS", toOutput);
		if(toOutput != 16'h0005)
			$display("IO rewriting at address 0x7fff (%d) : FAIL", toOutput);
		
	end
endmodule

