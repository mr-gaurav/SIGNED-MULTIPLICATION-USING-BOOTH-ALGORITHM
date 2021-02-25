`define BIT 8

module SHIFTER(out, in1, in2, in3);
	output reg signed [(2*`BIT):0] out;
	input [`BIT-1:0] in1, in2; 
	input in3;
	
	always@(*) begin
	    out[16] = in1[7];
		out[15:0] =  {in1, in2, in3} >> 1;
	end
endmodule
