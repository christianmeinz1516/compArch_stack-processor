`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: Christian Meinzen 
// 
// Create Date:    12:12:13 11/07/2019 
// Design Name: 
// Module Name:    register 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This file implements the register component for our datapath
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module register(
				input regWrite,
            input clk,
				input reset,
            input [15:0] w_data,
				output reg[15:0]r_data


    );
	 
	     always @(negedge clk)
    begin
		  if(reset == 1) r_data <= 0;
		  
        else if(regWrite == 1) r_data <= w_data;
		  
		  else r_data <= r_data;
    end


endmodule
