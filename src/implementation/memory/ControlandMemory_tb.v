// Verilog test fixture created from schematic C:\Users\szalayvm\Documents\CSSE232\memory\ControlandMemory.sch - Tue Oct 22 11:30:38 2019

`timescale 1ns / 1ps

module ControlandMemory_ControlandMemory_sch_tb();

// Inputs
   reg CLK;
   reg RESET;
   reg [9:0] addra;
   reg [15:0] dina;
   reg [0:0] wea;

// Output
   wire ALUSrc;
   wire MemtoReg;
   wire RegDst;
   wire RegWrite;
   wire MemRead;
   wire MemWrite;
   wire Branch;

// Bidirs

// Instantiate the UUT
   ControlandMemory UUT (
		.CLK(CLK), 
		.RESET(RESET), 
		.addra(addra), 
		.dina(dina), 
		.wea(wea), 
		.ALUSrc(ALUSrc), 
		.MemtoReg(MemtoReg), 
		.RegDst(RegDst), 
		.RegWrite(RegWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch)
   );
// Initialize Inputs

   initial begin
		CLK = 0;
		RESET = 0;
		//read R-type's instruction address
		addra = 10'd0;
		dina = 0;
		wea = 0;
		repeat(2)begin
			#100;
			CLK = ~CLK;
		end
		//read beq's instruction address
		addra = 10'd1;
		repeat(2)begin
			#100;
			CLK = ~CLK;
		end
		//read load word's instruction address
		addra = 10'd2;
		repeat(2)begin
			#100;
			CLK = ~CLK;
		end
		//read store word's instruction address
		addra = 10'd3;
		repeat(4)begin
			#100;
			CLK = ~CLK;
		end
		
   end
endmodule
