`timescale 1ns / 1ps

module BOOTH_TEST;
	reg start, clk;
	reg signed [7:0]  data;
	wire done;
	wire [1:0] selM, cmp;
	wire [7:0] count;
	
	BOOTH_datapath dut1(count, cmp, data, ldC, countdown, ldA, ldB, ldM, ldQ, ldQ0, selM, selQ, clr, clk);
	BOOTH_controller dut2(done, ldC, countdown, ldA, ldB, ldM, ldQ, ldQ0, selM, selQ, clr, start, count, cmp, clk);
	initial clk=0;
	always #5 clk=~clk;
	
	initial begin
		$dumpfile ("booth_test.vcd");
		$dumpvars (0, BOOTH_TEST);
		$monitor ("time=%g, A=%d, B=%d, Result=[%d], done=%b", $time, $signed(dut1.A), $signed(dut1.B), $signed({dut1.M, dut1.Q}), done);
		#1 start=1;
		#3 data=-125;
		#25 data=90;
		#1000 $finish;
	end
endmodule