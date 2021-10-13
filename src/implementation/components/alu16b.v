`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Rose-Hulman
// Engineer: William Dalby
// 
// Create Date:    19:46:30 10/27/2019 
// Design Name: 
// Module Name:    alu16b 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: This file implements are 16-bit alu component
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module alu16b(
    input [15:0] a,
    input [15:0] b,
    input [1:0] op,
    output [15:0] r,
	 output ovflw,
	 output zero
    );
	 
	 wire co0;
	 wire co1;
	 wire co2;
	 wire co3;
	 wire co4;
	 wire co5;
	 wire co6;
	 wire co7;
	 wire co8;
	 wire co9;
	 wire co10;
	 wire co11;
	 wire co12;
	 wire co13;
	 wire co14;
	 wire co15;
	 
	 wire isLess;

	alu1b A (
    .a(a[0]), 
    .b(b[0]), 
    .ci(op[1]), 
    .op(op), 
    .less(isLess),
	 .set(),
    .r(r[0]), 
    .co(co0)
    );
	 
	 alu1b B (
    .a(a[1]), 
    .b(b[1]), 
    .ci(co0), 
    .op(op), 
    .less(1'b0),
	 .set(),
    .r(r[1]), 
    .co(co1)
    );
	 
	 alu1b C (
    .a(a[2]), 
    .b(b[2]), 
    .ci(co1), 
    .op(op), 
    .less(1'b0),
	 .set(),
    .r(r[2]), 
    .co(co2)
    );
	 
	 alu1b D (
    .a(a[3]), 
    .b(b[3]), 
    .ci(co2), 
    .op(op), 
    .less(1'b0),
	 .set(),
    .r(r[3]), 
    .co(co3)
    );
	 
	 alu1b E (
    .a(a[4]), 
    .b(b[4]), 
    .ci(co3), 
    .op(op), 
    .less(1'b0),
	 .set(),
    .r(r[4]), 
    .co(co4)
    );
	 
	 alu1b F (
    .a(a[5]), 
    .b(b[5]), 
    .ci(co4), 
    .op(op), 
    .less(1'b0),
	 .set(),
    .r(r[5]), 
    .co(co5)
    );
	 
	 alu1b G (
    .a(a[6]), 
    .b(b[6]), 
    .ci(co5), 
    .op(op), 
    .less(1'b0),
	 .set(),
    .r(r[6]), 
    .co(co6)
    );
	 
	 alu1b H (
    .a(a[7]), 
    .b(b[7]), 
    .ci(co6), 
    .op(op), 
    .less(1'b0),
	 .set(),
    .r(r[7]), 
    .co(co7)
    );
	 
	 alu1b I (
    .a(a[8]), 
    .b(b[8]), 
    .ci(co7), 
    .op(op), 
    .less(1'b0),
	 .set(),
    .r(r[8]), 
    .co(co8)
    );
	 
	 alu1b J (
    .a(a[9]), 
    .b(b[9]), 
    .ci(co8), 
    .op(op), 
    .less(1'b0),
	 .set(),
    .r(r[9]), 
    .co(co9)
    );
	 
	 alu1b K (
    .a(a[10]), 
    .b(b[10]), 
    .ci(co9), 
    .op(op), 
    .less(1'b0),
	 .set(),
    .r(r[10]), 
    .co(co10)
    );
	 
	 alu1b L (
    .a(a[11]), 
    .b(b[11]), 
    .ci(co10), 
    .op(op), 
    .less(1'b0),
	 .set(),
    .r(r[11]), 
    .co(co11)
    );
	 
	 alu1b M (
    .a(a[12]), 
    .b(b[12]), 
    .ci(co11), 
    .op(op), 
    .less(1'b0),
	 .set(),
    .r(r[12]), 
    .co(co12)
    );
	 
	 alu1b N (
    .a(a[13]), 
    .b(b[13]), 
    .ci(co12), 
    .op(op), 
    .less(1'b0),
	 .set(),
    .r(r[13]), 
    .co(co13)
    );
	 
	 alu1b O (
    .a(a[14]), 
    .b(b[14]), 
    .ci(co13), 
    .op(op), 
    .less(1'b0),
	 .set(),
    .r(r[14]), 
    .co(co14)
    );
	 
	 alu1b P (
    .a(a[15]), 
    .b(b[15]), 
    .ci(co14), 
    .op(op), 
    .less(1'b0),
	 .set(isLess),
    .r(r[15]), 
    .co(co15)
    );
	 
	 assign ovflw = co15 ^ co14;
	 assign zero = (r == 0);




endmodule
