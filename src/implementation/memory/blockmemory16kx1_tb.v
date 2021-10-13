`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:05:59 10/18/2019
// Design Name:   blockmemory16x1
// Module Name:   C:/Users/szalayvm/Documents/CSSE232/memory/blockmemory16kx1_tb.v
// Project Name:  memory
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: blockmemory16x1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module blockmemory16kx1_tb;

	// Inputs
	reg clka;
	reg [0:0] wea;
	reg [9:0] addra;
	reg [15:0] dina;

	// Outputs
	wire [15:0] douta;

	// Instantiate the Unit Under Test (UUT)
	blockmemory16x1 uut (
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
		//read from memory address 0 without writing to it (address 0 = 0x0000 = R)
		#100;
		clka = ~clka;
		wea = 1'b0;
		addra = 10'b0000000000;
		//flip clock so that data can be read on rising-edge of clock cycle
		#100;
		clka = ~clka;
		//read on this clock edge
		#100;
		clka = ~clka;
			
		//read from memory address 4 without writing to it (address 4 = 0x0004 = beq)
		#100;
		clka = ~clka;
		wea = 1'b0;
		addra = 10'd1;
		//flip clock so that data can be read on rising-edge of clock cycle
		#100;
		clka = ~clka;
		//read on this clock edge
		#100;
		clka = ~clka;

		//read from memory address 8 without writing to it (address 4 = 0x0023 = load word)
		#100;
		clka = ~clka;
		wea = 1'b0;
		//addra = 10'b0000001000;
		addra = 10'd2;
		//flip clock so that data can be read on rising-edge of clock cycle
		#100;
		clka = ~clka;
		//read on this clock edge
		#100;
		clka = ~clka;

		//read from memory address 16 without writing to it (address 6 = 0x002b=storeword)
		#100;
		clka = ~clka;
		wea = 1'b0;
		addra = 10'd3;
		//flip clock so that data can be read on rising-edge of clock cycle
		#100;
		clka = ~clka;
		//read on this clock edge
		#100;
		clka = ~clka;		
		//read on this clock edge
		#100;
		clka = ~clka;			

		

		
		
		

	end
      
endmodule

