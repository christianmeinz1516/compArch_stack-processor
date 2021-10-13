`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Tori Szalay
// 
// Create Date:    08:49:47 11/05/2019 
// Design Name: 
// Module Name:    ALU_ALUOut_and_Memory_sub1_e 
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
module ALU_ALUOut_and_Memory_sub1_e(
    input [1:0] ALUOp,
    input [15:0] Avalue,
    input [15:0] Bvalue,
	 input [15:0] signImm,
    input wea,
    input reset,
	 input CLK,
    output [15:0] MemOutVal,
	 output zero_out,
	 output ovflw_out
    );
	 
	wire [15:0] alu_aluout;
	wire [15:0] aluout_addra;
	wire [15:0] mem_memout;
	


	 
	 alu16b ALU (
	 .a(Avalue),
    .b(signImm),
    .op(ALUOp),
    .r(alu_aluout),
	 .ovflw(ovflw_out),
	 .zero(zero_out)
	 );
	 
	 register ALUOut (
    .regWrite(1'b1), 
    .clk(CLK), 
	 .reset(reset),
    .w_data(alu_aluout), 
    .r_data(aluout_addra)
    );
	 
	blockMemory16 memory (
  .clka(CLK), // input clka
  .wea(wea), // input [0 : 0] wea
  .addra(aluout_addra), // input [9 : 0] addra
  .dina(Bvalue), // input [15 : 0] dina
  .douta(mem_memout) // output [15 : 0] douta
);

	 register memOut (
    .regWrite(1'b1), 
    .clk(CLK), 
	 .reset(reset),
    .w_data(mem_memout), 
    .r_data(MemOutVal)
    );


endmodule
