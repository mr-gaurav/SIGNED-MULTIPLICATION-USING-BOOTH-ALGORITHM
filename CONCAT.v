module CONCAT (out, in1, in2);
	output reg [1:0] out;
	input in1,in2;
	
	always@(*) begin
		out= {in1, in2};
	end
endmodule