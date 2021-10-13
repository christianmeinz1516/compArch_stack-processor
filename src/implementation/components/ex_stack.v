`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Christian Meinzen
// 
// Create Date:    14:10:29 10/22/2019 
// Design Name: 
// Module Name:    ex_stack 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This file implements our execution stack component
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ex_stack(
    input [15:0] pushVal,
    input popNum,
    input [1:0] dupNum,
    output reg[15:0] outA,
    output reg[15:0] outB,
    input [1:0] ESOp,
	 input ESAct,
	 input clk,
	 input reset
    );

	reg [15:0] stack[0:31];
	integer tos = 32;
	
	always @ (posedge clk) begin
		if(reset == 1)
			tos <= 32;
		else
			tos <= tos;
	
		if(ESAct) begin
			case (ESOp)
				// Push
				0: if(tos > 0) begin
						stack[tos - 1] <= pushVal; 
						tos <= tos - 1;
					end
					else ;
					
				// Pop
				1: case(popNum)
						0: if (tos < 32) begin
								tos <= tos + 1;
							end
							else ;
						1: if(tos < 31) begin
								tos <= tos + 2;
							end
							else ;
						default: if (tos < 32) begin
								tos <= tos + 1;
							end
							else ;
					endcase
				
				// Dup
				2: case(dupNum)
						0: if(tos > 0 && tos < 32) begin
								stack[tos - 1] <= stack[tos];
								tos <= tos - 1;
							end
							else ;
						1: if(tos > 1 && tos < 31) begin
								stack[tos - 2] <= stack[tos];
								stack[tos - 1] <= stack[tos + 1];
								tos <= tos - 2;
							end
							else ;
						2: if(tos > 2 && tos < 30) begin
								stack[tos - 3] <= stack[tos];
								stack[tos - 2] <= stack[tos + 1];
								stack[tos - 1] <= stack[tos + 2];
								tos <= tos - 3;
							end
							else ;
						3: if(tos > 3 && tos < 29) begin
								stack[tos - 4] <= stack[tos];
								stack[tos - 3] <= stack[tos + 1];
								stack[tos - 2] <= stack[tos + 2];
								stack[tos - 1] <= stack[tos + 3];
								tos <= tos - 4;		
							end
							else ;
						default: if(tos > 0 && tos < 32) begin
								stack[tos - 1] <= stack[tos];
								tos <= tos - 1;
							end
							else ;
					endcase
				
				3: if(tos > 0) begin
						stack[tos] <= stack[tos + 1];
						stack[tos + 1] <= stack[tos];
					end
					else ;
					
				default: if(tos > 0) begin
						stack[tos - 1] <= pushVal; 
						tos <= tos - 1;
					end
					else ;
					
			endcase
		end
	end
	
	always @ (tos, stack[tos], stack[tos + 1], clk) begin
			outA <= stack[tos];
			outB <= stack[tos + 1];
	end

endmodule
