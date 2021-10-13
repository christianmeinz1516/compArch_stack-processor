`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Tori Szalay
//
// Create Date:   11:24:59 11/08/2019
// Design Name:   Mem_subsys
// Module Name:   C:/Users/szalayvm/Documents/CSSE232/componentsthree/mem_subsys_tb.v
// Project Name:  componentsthree
// Target Device:  
// Tool versions:  
// Description: tests our mem_subsys file
//
// Verilog Test Fixture created by ISE for module: Mem_subsys
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: there is a premade waveform for this test
// 
////////////////////////////////////////////////////////////////////////////////

module mem_subsys_tb;

	// Inputs
	reg IorD;
	reg wea;
	reg clk;
	reg reset;
	reg IRWrite;
	reg [15:0] ALUoutWire;
	reg [15:0] PCWire;
	reg [15:0] bWire;
	reg [15:0] input_IO;

	// Outputs
	wire [15:0] IRw;
	wire [15:0] Memoutw;
	wire [15:0] output_IO;

	// Instantiate the Unit Under Test (UUT)
	Mem_subsys uut (
		.IorD(IorD), 
		.wea(wea), 
		.clk(clk), 
		.reset(reset), 
		.IRWrite(IRWrite), 
		.ALUoutWire(ALUoutWire), 
		.PCWire(PCWire), 
		.bWire(bWire), 
		.IRw(IRw), 
		.Memoutw(Memoutw),
		.input_IO(input_IO),
		.output_IO(output_IO)
	);

	always #1 clk = ~clk;
	initial begin
		// Initialize Inputs
		IorD = 0;
		wea = 0;
		clk = 0;
		reset = 1;
		IRWrite = 0;
		ALUoutWire = 16'h0001;
		PCWire = 16'h0005;
		bWire = 0;
		input_IO = 0;
		
		//write to 0x8888 to memory address 5 from pc-led address and dont let IR register be written to
		#2;
		reset = 0;
		wea = 1;
		bWire = 16'h8888;
		#2;
		//turn off memory write
		wea = 0;
		#2;
		if(Memoutw == 16'h8888)
		$display("test1 Memoutw is written correctly: PASS");
		else
		$display("test1 Memoutw is written correctly: FAIL");
		if(IRw == 0)
		$display("test2 IRWrite disable works: PASS");
		else
		$display("test2 IRWrite disable works: FAIL");
		
		//let IR be written to, check that Memoutw = IRw
		IRWrite = 1;
		#2;
		if(Memoutw == IRw)
		$display("test3 IRWrite enable works: PASS");
		else
		$display("test3 IRWrite enable works: FAIL");
		
        
	$finish;

	end
      
endmodule

