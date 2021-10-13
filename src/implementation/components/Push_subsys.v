`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:32:43 11/07/2019 
// Design Name: 
// Module Name:    Push_subsys 
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
module Push_subsys(
    ShiftSrc,
    ShamtSrc,
    RegWrite,
    PushSrc,
    PushValw,
    ALUOutWire,
    bWire,
    aWire,
	 Memoutw,
    IRw,
	 SEw,
	 clk,
	 reset
    );
	 
	 //control signals
	 input ShiftSrc;
	 input ShamtSrc;
	 input RegWrite;
	 //not sure about size of this one
	 input [2:0] PushSrc;
	 
	 input [15:0] ALUOutWire;
	 input [15:0] bWire;
	 input [15:0] aWire;
	 
	 input [15:0] IRw;
	 input [15:0] SEw;
	 input [15:0] Memoutw;
	 
	 input clk;
	 input reset;
	 
	 output [15:0] PushValw;
	 
	 //wires to mux
	 wire [15:0] ZE_push;
	 wire [15:0] shifter_push;
	 wire [15:0] arithmeticShifter_push;
	 wire [15:0] reg_push;
	 //wire to register
	 reg [15:0] toPushVal;
	 
	 reg [15:0] toShifterInput;
	 reg [4:0] toShifterShamt;
	 
//mux
	 always @ (*) begin
		case(PushSrc)
			0: toPushVal <= ZE_push;
			1: toPushVal <= aWire;
			2: toPushVal <= shifter_push;
			3: toPushVal <= Memoutw;
			4: toPushVal <= reg_push;
			5: toPushVal <= ALUOutWire;
			6: toPushVal <= bWire;
			7: toPushVal <= arithmeticShifter_push;
			default: toPushVal <= ZE_push;
		endcase
	 end
	 
	 //mux
	 always @ (*) begin
		case(ShiftSrc)
			0: toShifterInput<= aWire;
			1: toShifterInput <= SEw;
			default: toShifterInput <= SEw;
		endcase
	 end
	 
	 //mux
	 always @ (*) begin
		case(ShamtSrc)
			0: toShifterShamt<= 4'b0111;
			1: toShifterShamt <= IRw[6:2];
			default: toShifterShamt <= IRw[6:2];
		endcase
	 end
	 
// Instantiate the module
zero_extend zeroExtend (
    .in(IRw[11:4]), 
    .extended(ZE_push)
    );
	 
// Instantiate the module
shifter shifter (
    .in(toShifterInput), 
    .shamt(toShifterShamt), 
    .out(shifter_push)
    );
	 
arithmeticShifter arithmeticShifter (
    .in(toShifterInput), 
    .shamt(toShifterShamt), 
    .out(arithmeticShifter_push)
    );
	 
// Instantiate the module
reg_file_4 regFile (
    .w_data(aWire), 
    .r_data(reg_push), 
    .address(IRw[1:0]), 
    .clk(clk), 
	 .reset(reset),
    .regWrite(RegWrite)
    );
	 
// Instantiate the module
register pushVal (
    .regWrite(1'b1), 
    .clk(clk), 
    .reset(reset), 
    .w_data(toPushVal), 
    .r_data(PushValw)
    );






endmodule
