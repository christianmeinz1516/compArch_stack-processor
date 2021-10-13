`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Christian Meinzen
// 
// Create Date:    11:24:46 11/13/2019 
// Design Name: 
// Module Name:    IO_memblock 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This file implements our IO_memblock component, which serves as wrapper for our memory component and implements
//our memory-mapped IO
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module IO_memblock(
    input [15:0] fromInput,
    input [15:0] address,
    input [15:0] data_in,
    output [15:0] toOutput,
    output [15:0] data_out,
    input wea,
	 input clk
    );
	 
reg [15:0] in_reg;
reg isIO;
reg out_Ctrl;
wire [15:0] from_MemOut;

blockMemory16 Mem (
	 .clka(clk),
	 .wea(wea),
	 .addra(address[9:0]),
	 .dina(data_in),
	 .douta(from_MemOut)
);

assign data_out = isIO ? in_reg : from_MemOut;
assign toOutput = out_Ctrl ? data_in : toOutput;

always @ (*) begin
	if (address < 16'h7fff && address > 16'h7fcd && wea == 1)
		out_Ctrl = 1;
	else
		out_Ctrl = 0;
end

always @ (posedge clk) begin
	if (address < 16'h7fff && address > 16'h7fcd)
		isIO = 1;
	else
		isIO = 0;

	in_reg = fromInput;
end

endmodule
