`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Tori Szalay
// 
// Create Date:    19:16:47 11/07/2019 
// Design Name: 
// Module Name:    PC_subsys 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This file implements our PC_subsys, which is included in our implemenation plan and our final datapath
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: This system includes 
//1. PC register
//2. PCadder
//3. the necessary control logic and muxes shown on our datapath for our pc_subsystem
//
//////////////////////////////////////////////////////////////////////////////////
module PC_subsys(
    BEQCond,
    zero,
    BNECond,
    PCWrite,
    IRw,
	 aWire,
    PCSource,
    PCw,
	 clk,
	 reset
    );
	 
	 //control signals
	 input BEQCond;
	 input BNECond;
	 input PCWrite;
	 input [1:0] PCSource;
	 
	 input zero;
	 
	 //other inputs
	 input [15:0] IRw;
	 input [15:0] aWire;
	 
	 input reset;
	 input clk;
	 
	 //confusing
	 wire [15:0] newPC;
	 
	 output [15:0] PCw;
	 
	 
	 //mux wires
	 reg [15:0] mux_PC;
	 reg [15:0] Branchw;
	 
	 reg calculateWrite;
	 
	 //calculate Branchw
	 always @ (*)begin
		Branchw[15:0] <= {PCw[15:12],IRw[11:0]};
	 end
	
	 
	 
	 //calculate regWrite for PC register using control signals
	 always @ (*) begin
		calculateWrite <= ((BEQCond & zero) | (BNECond & ~zero) | PCWrite);
	 end
	 
	 //mux
	 always @ (*) begin
		case(PCSource)
			0: mux_PC <= newPC;
			1: mux_PC <= Branchw;
			2: mux_PC <= aWire;
			default: mux_PC <= newPC;
		endcase
	 end
	 
	 
	 PCadder A (
    .PCin(PCw), 
    .PCout(newPC)
    );
	 
	 
register PC (
    .regWrite(calculateWrite), 
    .clk(clk), 
	 .reset(reset),
    .w_data(mux_PC), 
    .r_data(PCw)
    );
	 

	 
	 


endmodule
