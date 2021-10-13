`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:53:32 10/22/2019
// Design Name:   blockMemory16
// Module Name:   C:/Users/szalayvm/Documents/CSSE232/components/blockMemory16_tb_0.v
// Project Name:  components
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: blockMemory16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module blockMemory16_tb_0;

	// Inputs
	reg clka;
	reg [0:0] wea;
	reg [9:0] addra;
	reg [15:0] dina;

	// Outputs
	wire [15:0] douta;

	// Instantiate the Unit Under Test (UUT)
	blockMemory16 uut (
		.clka(clka), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.douta(douta)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		wea = 0;
		addra = 0;
		dina = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		//test reading from coe file
		//read from memory address 0 without writing to it (address 0 = 0x0000)
		#100;
			
		//read from memory address 0 without writing to it (address 0 = 0x0000)
		#100;
		clka = ~clka;
		wea = 1'b0;
		addra = 10'd1;
		repeat(2)begin
			#100;
			clka = ~clka;
		end

		//read from memory address 1 without writing to it (address 1 = 0x1000)
		wea = 1'b0;
		addra = 10'd1;
		if(douta == 16'h0000)
			$display("Stores address0 coe (%d) : PASS", douta);
		if(douta != 16'h0000)
			$display("Stores address0 coe(%d) : FAIL", douta);
		repeat(2)begin
			#100;
			clka = ~clka;
		end

		//read from memory address 2 without writing to it (address 2 = 8c00)
		addra = 10'd2;

		repeat(2)begin
			#100;
			clka = ~clka;
		end
		if(douta == 16'h1000)
			$display("Stores address1 coe (%d) : PASS", douta);
		if(douta != 16'h1000)
			$display("Stores address1 coe (%d) : FAIL", douta);


	//test writing to memory
	wea = 1'b1;
	//write address 4 = 0x8888
	addra = 10'd4;
	dina = 16'h8888;
	repeat(2)begin
		#100;
		clka = ~clka;
	end
	if(douta == 16'h8c00)
		$display("Stores address2 coe (%d) : PASS", douta);
	if(douta != 16'h8c00)
		$display("Stores address2 coe (%d) : FAIL", douta);
	
	//write address 17 = 0x9999
	addra = 10'd17;
	dina = 16'h9999;
	repeat(2)begin
		#100;
		clka = ~clka;
	end
	if(douta == 16'h8888)
		$display("tests writing at address 4 (%d) : PASS", douta);
	if(douta != 16'h8888)
		$display("tests writing at address 4 (%d) : FAIL", douta);	
	//rewrite address 1 = 0x5656 ( was already written by coe file)
	addra = 10'd1;
	dina = 16'h5656;

	repeat(2)begin
		#100;
		clka = ~clka;
	end
	if(douta == 16'h9999)
		$display("tests writing at address 17 (%d) : PASS", douta);
	if(douta != 16'h9999)
		$display("tests writing at address 17 (%d) : FAIL", douta);	
	repeat(2)begin
		#100;
		clka = ~clka;
	end
	if(douta == 16'h5656)
		$display("tests rewriting at address 1(%d) : PASS", douta);
	if(douta != 16'h5656)
		$display("tests rewriting at address 1 (%d) : FAIL", douta);	
	

	end
      
endmodule

