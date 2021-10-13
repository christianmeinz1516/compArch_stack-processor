`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:18:45 11/12/2019 
// Design Name: 
// Module Name:    datapathCONTROL_eggo 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////
module datapathCONTROL_eggo(
    input reset,
	 input clk,
	 input [15:0] input_IO,
	 output [15:0] output_IO,
	 output [15:0] fromPushVal,
	 output overflow,
	 output [4:0] current_state,
	 output [4:0] next_state,
	 output [15:0] IRtoControlwire
    );
	 
	 wire popAmtwire;
	 wire [1:0] ESOpwire;
	 wire ESActwire;
	 wire IRWritewire;
	 wire ALUSrcBwire;
	 wire [1:0] ALUOpwire;
	 wire [1:0] PCSrcwire;
	 wire [2:0] PushSrcwire;
	 wire ShiftSrcwire;
	 wire RegWritewire;
	 wire IorDwire;
	 wire weawire;
	 wire PCWritewire;
	 wire BEQCondwire;
	 wire BNECondwire;
	 wire RegDstwire;
	 
	 
	 
// Instantiate the module
controlUnit control (
    .popAmt(popAmtwire), 
    .ESOp(ESOpwire), 
    .ESAct(ESActwire), 
    .IRWrite(IRWritewire), 
    .ALUSrcB(ALUSrcBwire), 
    .ALUOp(ALUOpwire), 
    .PCSrc(PCSrcwire), 
    .PushSrc(PushSrcwire), 
    .ShiftSrc(ShiftSrcwire), 
    .ShamtSrc(ShamtSrcwire), 
    .RegWrite(RegWritewire), 
    .IorD(IorDwire), 
    .wea(weawire), 
    .PCWrite(PCWritewire), 
    .BEQCond(BEQCondwire), 
    .BNECond(BNECondwire), 
    .RegDst(RegDstwire), 
    .Opcode(IRtoControlwire[15:12]), 
    .funct(IRtoControlwire[3:2]), 
    .current_state(current_state), 
    .next_state(next_state), 
    .CLK(clk),
    .Reset(reset)
    );
	 
// Instantiate the module
datapath eggo (
    .popAmt(popAmtwire), 
    .ESOp(ESOpwire), 
    .ESAct(ESActwire), 
    .IRwrite(IRWritewire), 
    .ALUSrcB(ALUSrcBwire), 
    .ALUop(ALUOpwire), 
    .PCSrc(PCSrcwire), 
    .PushSrc(PushSrcwire), 
    .ShiftSrc(ShiftSrcwire), 
    .ShamtSrc(ShamtSrcwire), 
    .regWrite(RegWritewire), 
    .IorD(IorDwire), 
    .wea(weawire), 
    .PCwrite(PCWritewire), 
    .BEQCond(BEQCondwire), 
    .BNECond(BNECondwire), 
    .clk(clk), 
    .reset(reset), 
    .fromPushVal(fromPushVal), 
    .overflow(overflow), 
    .ir_stack_push_pc(IRtoControlwire),
	 .input_IO(input_IO),
	 .output_IO(output_IO)
    );


endmodule
