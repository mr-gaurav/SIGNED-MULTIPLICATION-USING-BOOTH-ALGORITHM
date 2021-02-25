`define BIT 8

module SUBTRACTOR (out, in1, in2);
	output reg [`BIT-1:0] out;
	input [`BIT-1:0] in1, in2;
	
	always@(*) begin
		out = in1-in2;
	end
endmodule