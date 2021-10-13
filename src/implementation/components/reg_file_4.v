`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Christian Meinzen
// 
// Create Date:    10:30:35 10/22/2019 
// Design Name: 
// Module Name:    reg_file_4 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This file implements are reg_file component, which allows us to write to and read four different registers
//from their addresses
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module reg_file_4(
    input [15:0] w_data,
    output reg[15:0] r_data,
    input [1:0] address,
	 input reset,
	 input clk,
    input regWrite
    );
	 
	reg [15:0] V;
	reg [15:0] SP;
	reg [15:0] GP;

	always @(posedge clk) begin
		if(reset) begin
			V <= 0;
			SP <= 16'h7fcd;
			GP <= 0;
		end
		else begin
			if (regWrite) begin
            case (address)
					0: V <= w_data;
					1: SP <= w_data;
					2: GP <= w_data;
					3: ;// do nothing
					default: ;
				endcase
			end
			else begin
				case(address)
					0: r_data <= V;
					1: r_data <= SP;
					2: r_data <= GP;
					3: r_data <= 0;
					default: r_data <= 0;
				endcase
			end
		end
    end
endmodule
