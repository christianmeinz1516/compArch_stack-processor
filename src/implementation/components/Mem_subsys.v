`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Tori Szalay
// 
// Create Date:    17:31:07 11/07/2019 
// Design Name: 
// Module Name:    Mem_subsys 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This file implements one of our four subsystems of the datapath.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: This subsystem includes:
//1. mux logic for IorD control bit
//2. our memory component
//3.IR, memout registers
//
//////////////////////////////////////////////////////////////////////////////////
module Mem_subsys(
    IorD,
    wea,
	 clk,
	 reset,
	 IRWrite,
    ALUoutWire,
	 PCWire,
	 bWire,
    IRw,
    Memoutw,
	 input_IO,
	 output_IO
    );
	 
	 input IRWrite;
	 input IorD;
	 input wea;
	 input clk;
	 input reset;
	 input [15:0] input_IO;
	 output [15:0] output_IO;
	 
	 //wires into mux
	 input [15:0] PCWire;
	 input [15:0] ALUoutWire;
	 
	 //goes into dina
	 input [15:0] bWire;
	 
	 output [15:0] IRw;
	 output [15:0] Memoutw;
	 
	 wire [15:0] mem_reg;
	 
	 //we are taking [9:0] from this wire
	 reg [15:0] mux_mem;
	 
//IorD mux
	 always @ (*) begin
		case(IorD)
			0: mux_mem <= PCWire;
			1: mux_mem <= ALUoutWire;
			default: mux_mem <= PCWire;
		endcase
	 end
	 
IO_memblock memory (
  .clk(clk), // input clka
  .wea(wea), // input [0 : 0] wea
  .address(mux_mem), // input [15:0] addra
  .data_in(bWire), // input [15 : 0] dina
  .data_out(mem_reg), // output [15 : 0] douta
  .fromInput(input_IO),
  .toOutput(output_IO)
);

// Instantiate the module
register IR (
    .regWrite(IRWrite), 
    .clk(clk), 
    .reset(reset), 
    .w_data(mem_reg), 
    .r_data(IRw)
    );
	 
// Instantiate the module
register memOut (
    .regWrite(1'b1), 
    .clk(clk), 
    .reset(reset), 
    .w_data(mem_reg), 
    .r_data(Memoutw)
    );


endmodule
