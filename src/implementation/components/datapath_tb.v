`timescale 1ns / 1ps

//MEMORY_INITIALIZATION_RADIX=16;
//MEMORY_INITIALIZATION_VECTOR=
//2080,
//2110,
//7000,
//4000,
//c006,
//2070,
//22b0,
//2000,
//0000,
//1004,
//22a0,
//b000,
//900b,
//e00f,
//20f0,
//2120,
//f000,
//2050,
//4000,
//4000,
//3070,
//1004,
//0004,
//2130,
//2200,
//1000,
//2200,
//0000;

module datapath_tb;

	// Inputs
	reg popAmt;
	reg [1:0] ESOp;
	reg ESAct;
	reg IRwrite;
	reg ALUSrcB;
	reg [1:0] ALUop;
	reg [1:0] PCSrc;
	reg [2:0] PushSrc;
	reg ShiftSrc;
	reg ShamtSrc;
	reg regWrite;
	reg IorD;
	reg wea;
	reg PCwrite;
	reg BEQCond;
	reg BNECond;
	reg clk;
	reg reset;
	reg [15:0] input_IO;

	// Outputs
	wire [15:0] fromPushVal;
	wire overflow;
	wire [15:0] output_IO;

	// Instantiate the Unit Under Test (UUT)
	datapath uut (
		.popAmt(popAmt), 
		.ESOp(ESOp), 
		.ESAct(ESAct), 
		.IRwrite(IRwrite), 
		.ALUSrcB(ALUSrcB), 
		.ALUop(ALUop), 
		.PCSrc(PCSrc), 
		.PushSrc(PushSrc), 
		.ShiftSrc(ShiftSrc), 
		.ShamtSrc(ShamtSrc), 
		.regWrite(regWrite), 
		.IorD(IorD), 
		.wea(wea), 
		.PCwrite(PCwrite), 
		.BEQCond(BEQCond), 
		.BNECond(BNECond), 
		.clk(clk), 
		.reset(reset), 
		.fromPushVal(fromPushVal), 
		.overflow(overflow),
		.input_IO(input_IO),
		.output_IO(output_IO)
	);

	always #1 clk = ~clk;

	initial begin
		// Initialize Inputs
		popAmt = 0;
		ESOp = 0;
		ESAct = 0;
		IRwrite = 0;
		ALUSrcB = 0;
		ALUop = 0;
		PCSrc = 0;
		PushSrc = 0;
		ShiftSrc = 0;
		ShamtSrc = 0;
		regWrite = 0;
		IorD = 0;
		wea = 0;
		PCwrite = 0;
		BEQCond = 0;
		BNECond = 0;
		clk = 0;
		reset = 1;
		input_IO = 0;

		
		//pushLi 8
		#2;
		//stage 1
		reset = 0;
		ESAct = 0;
		PCSrc = 0;
		IorD = 0;
		IRwrite = 1;
		regWrite = 0;
		
		PCwrite = 1;
		BEQCond = 0;
		BNECond = 0;
		
		#2
		//stage 2
		IRwrite = 0;
		ShiftSrc = 0;
		ShamtSrc = 1'b1;
		ESAct = 0;
		PCwrite = 0;
		
		PushSrc = 0;
		
		#2
		//stage3 
		ESAct = 1'b1;
		ESOp = 2'b00;
		PushSrc = 3'b000;
		
		//pushLi 17
		#2;
		//stage 1
		reset = 0;
		ESAct = 0;
		PCSrc = 0;
		IorD = 0;
		IRwrite = 1;
		
		PCwrite = 1;
		BEQCond = 0;
		BNECond = 0;
		
		#2
		//stage 2
		IRwrite = 0;
		ShiftSrc = 0;
		ShamtSrc = 1'b1;
		ESAct = 0;
		PCwrite = 0;
		
		PushSrc = 0;
		
		#2
		//stage3 
		ESAct = 1'b1;
		ESOp = 2'b00;
		
		
		//add
		#2;
		//stage 1
		reset = 0;
		ESAct = 0;
		PCSrc = 0;
		IorD = 0;
		IRwrite = 1;
		regWrite = 0;
		
		PCwrite = 1;
		BEQCond = 0;
		BNECond = 0;
		
		#2
		//stage 2
		IRwrite = 0;
		ShiftSrc = 0;
		ShamtSrc = 1'b1;
		ESAct = 0;
		PCwrite = 0;
		
		
		PushSrc = 0;
		
		#2
		//stage 3
		ESAct = 1;
		ESOp = 2'b01;
		popAmt = 1;
		
		ALUSrcB = 0;
		ALUop = 2'b01;
		
		#2
		//stage 4
		PushSrc = 3'b101;
		
		#2
		//stage 5
		ESAct = 1;
		ESOp = 2'b00;

		#2;
		//stage 1 dup0
		reset = 0;
		ESAct = 0;
		PCSrc = 0;
		IorD = 0;
		IRwrite = 1;
		regWrite = 0;
		
		PCwrite = 1;
		BEQCond = 0;
		BNECond = 0;
		
		#2
		//stage 2 dup0
		IRwrite = 0;
		ShiftSrc = 0;
		ShamtSrc = 1'b1;
		ESAct = 0;
		PCwrite = 0;
		
		PushSrc = 0;
		
		#2
		//stage 3 dup0
		ESAct = 1;
		ESOp = 2'b10;

		
		#2;
		//stage 1 beq
		reset = 0;
		ESAct = 0;
		PCSrc = 0;
		IorD = 0;
		IRwrite = 1;
		regWrite = 0;
		
		PCwrite = 1;
		BEQCond = 0;
		BNECond = 0;
		
		#2
		//stage 2 beq
		IRwrite = 0;
		ShiftSrc = 0;
		ShamtSrc = 1'b1;
		ESAct = 0;
		PCwrite = 0;
		
		PushSrc = 0;
		
		#2
		//stage 3 beq
		ALUSrcB = 0;
		ALUop = 2'b10;
		BEQCond = 1;
		BNECond = 0;
		PCSrc = 2'b01;

		
		#2
		//stage 4 beq trial
		ESAct = 1;
		ESOp = 2'b01;
		popAmt = 1;
		BEQCond = 0;
		BNECond = 0;
		
		
		//pushLi 43
		#2;
		//stage 1
		reset = 0;
		ESAct = 0;
		PCSrc = 0;
		IorD = 0;
		IRwrite = 1;
		regWrite = 0;
		
		PCwrite = 1;
		BEQCond = 0;
		BNECond = 0;
		
		#2
		//stage 2
		IRwrite = 0;
		ShiftSrc = 0;
		ShamtSrc = 1'b1;
		ESAct = 0;
		PCwrite = 0;
	
		PushSrc = 0;
		
		#2
		//stage3 
		ESAct = 1'b1;
		ESOp = 2'b00;
		
		//pushLi 0
		#2;
		//stage 1
		reset = 0;
		ESAct = 0;
		PCSrc = 0;
		IorD = 0;
		IRwrite = 1;
		regWrite = 0;
		
		PCwrite = 1;
		BEQCond = 0;
		BNECond = 0;
		
		#2
		//stage 2
		IRwrite = 0;
		ShiftSrc = 0;
		ShamtSrc = 1'b1;
		ESAct = 0;
		PCwrite = 0;
		
		PushSrc = 0;
	
		
		#2
		//stage3
		ESAct = 1'b1;
		ESOp = 2'b00;
		
		
		//pushM 0
		#2;
		//stage 1
		reset = 0;
		ESAct = 0;
		PCSrc = 0;
		IorD = 0;
		IRwrite = 1;
		regWrite = 0;
		
		PCwrite = 1;
		BEQCond = 0;
		BNECond = 0;

		#2
		//stage 2
		IRwrite = 0;
		ShiftSrc = 0;
		ShamtSrc = 1'b1;
		ESAct = 0;
		PCwrite = 0;
		
		PushSrc = 0;

		#2
		//stage 3
		ESAct = 1;
		ESOp = 2'b01;
		popAmt = 0;
		
		ALUSrcB = 1;
		ALUop = 2'b01;
		
		
		PushSrc = 3'b011;

		#2
		//stage 4
		IorD = 1;
		ESAct = 0;

		
		#2
		//stage 5
		IorD = 0;
		
		#2
		//stage 6
		IorD = 0;
		ESAct = 1;
		ESOp = 2'b00;
		
		//popR
		#2;
		//stage 1
		reset = 0;
		ESAct = 0;
		PCSrc = 0;
		IorD = 0;
		IRwrite = 1;
		regWrite = 0;
		
		PCwrite = 1;
		BEQCond = 0;
		BNECond = 0;
		
		#2
		//stage 2
		IRwrite = 0;
		ShiftSrc = 0;
		ShamtSrc = 1'b1;
		ESAct = 0;
		PCwrite = 0;
		
		PushSrc = 0;
		
		#2
		//stage 3
		ESAct = 1;
		ESOp = 2'b01;
		popAmt = 0;
		regWrite = 1;
		
		
		#2;
		//pushLi 42
		//stage 1
		reset = 0;
		ESAct = 0;
		PCSrc = 0;
		IorD = 0;
		IRwrite = 1;
		regWrite = 0;
		
		PCwrite = 1;
		BEQCond = 0;
		BNECond = 0;
		
		#2
		//stage 2
		IRwrite = 0;
		ShiftSrc = 0;
		ShamtSrc = 1'b1;
		ESAct = 0;
		PCwrite = 0;
		
		PushSrc = 0;
			
		#2
		//stage3
		ESAct = 1'b1;
		ESOp = 2'b00;
		

		#2;
		//slt
		//stage 1
		reset = 0;
		ESAct = 0;
		PCSrc = 0;
		IorD = 0;
		IRwrite = 1;
		regWrite = 0;
		
		PCwrite = 1;
		BEQCond = 0;
		BNECond = 0;

		#2
		//stage 2
		IRwrite = 0;
		ShiftSrc = 0;
		ShamtSrc = 1'b1;
		ESAct = 0;
		PCwrite = 0;
		
		PushSrc = 0;

		#2
		//stage 3
		ALUSrcB = 0;
		ALUop = 2'b11;
		
		ESAct = 1;
		ESOp = 2'b01;
		popAmt = 1;
		
		#2
		//stage 4
		PushSrc = 3'b101;
		
		#2
		//stage 5
		ESAct = 1;
		ESOp = 2'b00;
		
		#2;
		//ls 3
		//stage 1
		reset = 0;
		ESAct = 0;
		PCSrc = 0;
		IorD = 0;
		IRwrite = 1;
		regWrite = 0;
		
		PCwrite = 1;
		BEQCond = 0;
		BNECond = 0;
		
		#2
		//stage 2
		IRwrite = 0;
		ShiftSrc = 0;
		ShamtSrc = 1'b1;
		ESAct = 0;
		PCwrite = 0;
		
		PushSrc = 0;
		
		#2;
		//stage 3
		ESAct = 1;
		ESOp = 2'b01;
		popAmt = 0;
		PushSrc = 3'b010;
		
		#2
		//stage 4
		ESAct = 1;
		ESOp = 2'b00;
		
		#2;
		//j
		//stage 1
		reset = 0;
		ESAct = 0;
		PCSrc = 0;
		IorD = 0;
		IRwrite = 1;
		regWrite = 0;
		
		PCwrite = 1;
		BEQCond = 0;
		BNECond = 0;
		
		#2
		//stage 2
		IRwrite = 0;
		ShiftSrc = 0;
		ShamtSrc = 1'b1;
		ESAct = 0;
		PCwrite = 0;
		
		PushSrc = 0;

		
		#2
		//stage 3
		PCwrite = 1;
		PCSrc = 2'b01;
		
		#2
		//stage 4
		PCwrite = 0;
			
		
		#2
		//pushLi 18
		//stage 1
		reset = 0;
		ESAct = 0;
		PCSrc = 0;
		IorD = 0;
		IRwrite = 1;
		regWrite = 0;
		
		PCwrite = 1;
		BEQCond = 0;
		BNECond = 0;
		
		#2
		//stage 2
		IRwrite = 0;
		ShiftSrc = 0;
		ShamtSrc = 1'b1;
		ESAct = 0;
		PCwrite = 0;
		
		PushSrc = 0;
		
		#2
		//stage3
		ESAct = 1;
		ESOp = 2'b00;
		
		#2
		//js
		//stage 1
		reset = 0;
		ESAct = 0;
		PCSrc = 0;
		IorD = 0;
		IRwrite = 1;
		regWrite = 0;
		
		PCwrite = 1;
		BEQCond = 0;
		BNECond = 0;
		
		#2
		//stage 2
		IRwrite = 0;
		ShiftSrc = 0;
		ShamtSrc = 1'b1;
		ESAct = 0;
		PCwrite = 0;
		
		PushSrc = 0;
		
		#2
		//stage 3
		PCSrc = 2'b10;
		PCwrite = 1;
		
		#2
		//stage 4
		PCwrite = 0;
		ESAct = 1;
		ESOp = 2'b01;
		popAmt = 0;
		
		#2;
		//stage 1 dup0
		reset = 0;
		ESAct = 0;
		PCSrc = 0;
		IorD = 0;
		IRwrite = 1;
		regWrite = 0;
		
		PCwrite = 1;
		BEQCond = 0;
		BNECond = 0;
		
		#2
		//stage 2 dup0
		IRwrite = 0;
		ShiftSrc = 0;
		ShamtSrc = 1'b1;
		ESAct = 0;
		PCwrite = 0;
		
		PushSrc = 0;
		
		#2
		//stage 3 dup0
		ESAct = 1;
		ESOp = 2'b10;
		
		#2;
		//2nd dup0 that is just a placeholder
		//stage 1 
		reset = 0;
		ESAct = 0;
		PCSrc = 0;
		IorD = 0;
		IRwrite = 1;
		regWrite = 0;
		
		PCwrite = 1;
		BEQCond = 0;
		BNECond = 0;
		
		#2
		//stage 2 dup0
		IRwrite = 0;
		ShiftSrc = 0;
		ShamtSrc = 1'b1;
		ESAct = 0;
		PCwrite = 0;
		
		PushSrc = 0;
		
		
		
		#2
		//stage 1 pushUi
		reset = 0;
		PCSrc = 0;
		IorD = 0;
		PCwrite = 1;
		IRwrite = 1;
		ESAct = 0;
		BEQCond = 0;
		BNECond = 0;
		regWrite = 0;
		
		#2
		//stage 2
		ShiftSrc = 0;
		ShamtSrc = 1;
		ESAct = 0;
		PCwrite = 0;
		IRwrite = 0;
		PushSrc = 0;
		
		#2
		//stage 3
		ShamtSrc = 0;
		ESAct = 0;
		ShiftSrc = 1;
		PushSrc = 3'b010;
		
		#2
		//stage 4
		ESAct = 1;
		ESOp = 0;
		
		
		#2
		//stage 1 popR
		reset = 0;
		PCSrc = 0;
		IorD = 0;
		PCwrite = 1;
		IRwrite = 1;
		ESAct = 0;
		BEQCond = 0;
		BNECond = 0;
		regWrite = 0;
		
		#2
		//stage 2
		ShiftSrc = 0;
		ShamtSrc = 1;
		ESAct = 0;
		PCwrite = 0;
		IRwrite = 0;
		PushSrc = 0;
		
		#2
		//stage 3 popR
		ESAct = 1;
		ESOp = 2'b01;
		popAmt = 0;
		regWrite = 1;
		
		
		#2
		//stage 1 pushR
		reset = 0;
		PCSrc = 0;
		IorD = 0;
		PCwrite = 1;
		IRwrite = 1;
		ESAct = 0;
		BEQCond = 0;
		BNECond = 0;
		regWrite = 0;
		
		#2
		//stage 2
		ShiftSrc = 0;
		ShamtSrc = 1;
		ESAct = 0;
		PCwrite = 0;
		IRwrite = 0;
		PushSrc = 0;
		
		#2
		//stage 3
		ESAct = 0;
		PushSrc = 3'b100;
		
		#2
		//stage 4
		ESAct = 1;
		ESOp = 0;

		#2
		//stage 1 pushLi 19
		reset = 0;
		PCSrc = 0;
		IorD = 0;
		PCwrite = 1;
		IRwrite = 1;
		ESAct = 0;
		BEQCond = 0;
		BNECond = 0;
		regWrite = 0;
		
		#2
		//stage 2
		ShiftSrc = 0;
		ShamtSrc = 1;
		ESAct = 0;
		PCwrite = 0;
		IRwrite = 0;
		PushSrc = 0;
		
		#2
		//stage 3
		ESAct = 1;
		ESOp = 0;
		
		#2
		//stage 1 2200 pushLi 32
		reset = 0;
		PCSrc = 0;
		IorD = 0;
		PCwrite = 1;
		IRwrite = 1;
		ESAct = 0;
		BEQCond = 0;
		BNECond = 0;
		regWrite = 0;
		
		#2
		//stage 2
		ShiftSrc = 0;
		ShamtSrc = 1;
		ESAct = 0;
		PCwrite = 0;
		IRwrite = 0;
		PushSrc = 0;
		
		#2
		//stage 3
		ESAct = 1;
		ESOp = 0;
		
		#2
		//stage 1 1000 popM 0
		reset = 0;
		PCSrc = 0;
		IorD = 0;
		PCwrite = 1;
		IRwrite = 1;
		ESAct = 0;
		BEQCond = 0;
		BNECond = 0;
		regWrite = 0;
		
		#2
		//stage 2
		ShiftSrc = 0;
		ShamtSrc = 1;
		ESAct = 0;
		PCwrite = 0;
		IRwrite = 0;
		PushSrc = 0;
		
		#2
		//stage 3
		ESOp = 01;
		popAmt = 1;
		ALUSrcB = 1;
		ALUop = 2'b01;
		
		
		#2
		//stage 4
		IorD = 1;
		wea = 1;
		ESAct = 1;
		
		#2
		//stage5
		ESAct = 0;
		IorD = 0;
		wea = 0;



		#2
		//stage 1 2200 pushLi 32
		wea = 0;
		reset = 0;
		PCSrc = 0;
		IorD = 0;
		PCwrite = 1;
		IRwrite = 1;
		ESAct = 0;
		BEQCond = 0;
		BNECond = 0;
		regWrite = 0;
		
		#2
		//stage 2
		ShiftSrc = 0;
		ShamtSrc = 1;
		ESAct = 0;
		PCwrite = 0;
		IRwrite = 0;
		PushSrc = 0;
		
		#2
		//stage 3
		ESAct = 1;
		ESOp = 0;
		
		#2
		//stage 1 0000 pushM 0
		reset = 0;
		PCSrc = 0;
		IorD = 0;
		PCwrite = 1;
		IRwrite = 1;
		ESAct = 0;
		BEQCond = 0;
		BNECond = 0;
		regWrite = 0;
		
		#2
		//stage 2
		ShiftSrc = 0;
		ShamtSrc = 1;
		ESAct = 0;
		PCwrite = 0;
		IRwrite = 0;
		PushSrc = 0;
		
		#2
		//stage 3
		ALUSrcB = 2'b01;
		ALUop = 2'b01;
		ESAct = 1;
		ESOp = 2'b01;
		popAmt = 0;
		PushSrc = 3'b011;
		
		#2
		//stage 4
		IorD = 1;
		ESAct = 0;
		
		#2
		//stage 5
		IorD = 0;
		
		#2
		//stage 6
		ESAct = 1;
		ESOp = 0;
		
		
		
		#2
		//stage 1 next instruction
		reset = 0;
		PCSrc = 0;
		IorD = 0;
		PCwrite = 1;
		IRwrite = 1;
		ESAct = 0;
		BEQCond = 0;
		BNECond = 0;
		regWrite = 0;
		
		
		

		
		

		$finish;

	end
      
endmodule

