`timescale 1ns / 1ps
`define BIT 8

module BOOTH_datapath(count, cmp, data, ldC, countdown, ldA, ldB, ldM, ldQ, ldQ0, selM, selQ, clr, clk);
	output [`BIT-1:0] count;
	output [1:0] cmp;
	input [`BIT-1:0] data;
	input ldC, countdown, ldA, ldB, ldM, ldQ, ldQ0, selQ, clr, clk;
	input [1:0] selM;
	wire signed [`BIT-1:0] A, B, M, adder_out, sub_out, mux4out, mux2out;
	wire [`BIT-1:0] Q;
	wire signed [(2*`BIT):0] shifter_out;
	wire Q0;
	
	LOAD_AB		I1 (A, data, ldA, clr, clk);
	LOAD_AB		I2 (B, data, ldB, clr, clk);
	LOAD_M 		I3 (M, mux4out, ldM, clr, clk);
	LOAD_Q		I4 (Q, mux2out, ldQ, clr, clk);
	LOAD_Q0		I5 (Q0, shifter_out[0], ldQ0, clr, clk);
	ADDER		I6 (adder_out, M, A);
	SUBTRACTOR	I7 (sub_out, M, A);
	SHIFTER		I8 (shifter_out, M, Q, Q0);
	COUNTER		I9 (count, ldC, countdown, clr);
	CONCAT		I10(cmp, Q[0], Q0);
	MUX4TO1		I11(mux4out, data, adder_out, sub_out, shifter_out[(2*`BIT)-:`BIT], selM);
	MUX2TO1		I12(mux2out, data, shifter_out[1+:`BIT], selQ);
//	assign cmp = {Q[0], Q0};
	
endmodule