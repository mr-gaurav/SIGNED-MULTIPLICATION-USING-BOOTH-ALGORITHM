`define BIT 8

module LOAD_AB (out, in, load, clr, clk);
	output reg [`BIT-1:0] out;
	input [`BIT-1:0] in;
	input load, clr, clk;
	
	always@(posedge clk or posedge clr) begin
		if (clr)
			out<=0;
		else if(load)
			out<= in;
	end
endmodule

module LOAD_M (out, in, load, clr, clk);
	output reg [`BIT-1:0] out;
	input [`BIT-1:0] in;
	input load, clr, clk;
	
	always@(posedge clk or posedge clr) begin
		if (clr)
			out<=0;
		else if(load)
			out<=in;
	end
endmodule

module LOAD_Q (out, data , load, clr, clk);
	output reg [`BIT-1:0] out;
	input [`BIT-1:0] data;
	input load, clr, clk;
	
	always@(posedge clk or posedge clr) begin
		if(clr)
			out<=0;
		else if(load)
			out<=data;
	end
endmodule

module LOAD_Q0 (out, in, load, clr, clk);
	output reg out;
	input in, load, clr, clk;
	
	always@(posedge clk or posedge clr) begin
		if(clr)
			out<=0;
		else if(load)
			out<= in;
	end
endmodule