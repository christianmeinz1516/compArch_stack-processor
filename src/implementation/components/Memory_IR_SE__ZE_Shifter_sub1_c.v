`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Tori Szalay
// 
// Create Date:    17:20:37 11/05/2019 
// Design Name: 
// Module Name:    Memory_IR_SE__ZE_Shifter_sub1_c 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This file implements our original implementation plan subsystem. It is NOT used in the final implmentation of
//our datapath, though we did find valuable fixes while conducting tests
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Memory_IR_SE__ZE_Shifter_sub1_c(
	input [9:0] addra,
	input wea,
	input CLK,
	input reset,
	input [15:0] dina,
	output [15:0] SEout,
	output [15:0] ZEout,
	output [15:0] ShifterOut
    );
	 wire [15:0] mem_ir;
	 wire [15:0] ir_comp;
	 wire [15:0] se_shifter;
 
 register IR (
    .regWrite(1'b1), 
    .clk(CLK), 
	 .reset(reset),
    .w_data(mem_ir), 
    .r_data(ir_comp)
    );
	 
	 
// Instantiate the module
sign_extend signextender1 (
    .in(ir_comp[11:4]), 
    .extended(SEout)
    );
	 
// Instantiate the module
sign_extend signextender2 (
    .in(ir_comp[11:4]), 
    .extended(se_shifter)
    );
	 
// Instantiate the module
zero_extend zeroextender (
    .in(ir_comp[11:4]), 
    .extended(ZEout)
    );
// Instantiate the module
shifter shifter (
    .in(se_shifter), 
    .shamt(ir_comp[5:2]), 
    .out(ShifterOut)
    );
	 
blockMemory16 memory (
  .clka(CLK), // input clka
  .wea(wea), // input [0 : 0] wea
  .addra(addra), // input [9 : 0] addra
  .dina(dina), // input [15 : 0] dina
  .douta(mem_ir) // output [15 : 0] douta
);


endmodule
