`define BIT 8

module MUX4TO1 (out, in0, in1, in2, in3, select);
	output reg [`BIT-1:0] out;
	input [`BIT-1:0] in0, in1, in2, in3;
	input [1:0] select;
	
	always@(*) begin
		case(select)
			2'b00: out=in0;
			2'b01: out=in1;
			2'b10: out=in2;
			2'b11: out=in3;
		endcase
	end
endmodule

module MUX2TO1 (out, in0, in1, select);
	output reg [`BIT-1:0] out;
	input [`BIT-1:0] in0, in1;
	input select;
	always@(*) begin
		out<= select ? in1:in0;
	end
endmodule