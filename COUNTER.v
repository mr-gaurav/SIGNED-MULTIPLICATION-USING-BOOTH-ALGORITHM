`define BIT 8

module COUNTER (count, load, downcount, clr);
	output reg [`BIT-1:0] count;
	input load, downcount, clr;
	
	always@ (*) begin
		if(clr)
			count=8'b0;
		else if (load)
			count=8;
		else if (downcount)
			count= count-1;
	end
endmodule