`timescale 1ns / 1ps
`define BIT 8

module BOOTH_controller (done, ldC, countdown, ldA, ldB, ldM, ldQ, ldQ0, selM, selQ, clr, start, count, cmp, clk);
	output reg done, ldC, countdown, ldA, ldB, ldM, ldQ, ldQ0, selQ, clr;
	output reg [1:0] selM;
	input start, clk;
	input [`BIT-1:0] count;
	input [1:0] cmp;
	reg [2:0] state;
	parameter s0=0, s1=1, s2=2, s3=3, s4=4, s5=5, s6=6, s7=7;
	
	always@(posedge clk) begin
		case(state)
			s0: #2 if(start) state<=s1;
			s1: #2 state<=s2;
			s2: #2 state<=s3;
			s3: begin 
					case(cmp)
						2'b00: #2 state<=s6;
						2'b01: #2 state<=s4;
						2'b10: #2 state<=s5;
						2'b11: #2 state<=s6;
					endcase
				end
			s4: #2 state<=s6;
			s5: #2 state<=s6;
			s6: #2 state<= (~|count) ? s7: s3;
			s7: #2 state<=s7;
			default: state<=s0;
		endcase
	end
	
	always@ (state) begin
		case(state)
			s0: begin done=0; clr=1; ldA=0; ldB=0; ldC=0; ldM=0; ldQ=0; ldQ0=0; selM=2'b00; selQ=1'bx; end
			s1: begin clr=0; ldA=1; ldC=1; selM=2'b00; end
			s2: begin ldA=0; ldC=0; selM=2'bx; ldM=0; ldB=1; selQ=0; ldQ=1; end
			s3: begin ldB=0; selQ=1'bx; ldQ=0; ldM=0; selM=2'bx; ldQ0=0; countdown=0; end
			s4: begin selM=2'b01; ldM=1; end
			s5: begin selM=2'b10; ldM=1; end
			s6: begin ldM=1; selM=2'b11; selQ=1; ldQ=1; ldQ0=1; countdown=1; end
			s7: begin ldM=0; selM=2'bxx; selQ=1'bx; ldQ=0; ldQ0=0; countdown=0; done=1; end
			default: begin clr=0; ldA=0; ldB=0; ldC=0; ldM=0; ldQ=0; ldQ0=0; selM=2'b0; selQ=1'bx; end
		endcase
	end

endmodule