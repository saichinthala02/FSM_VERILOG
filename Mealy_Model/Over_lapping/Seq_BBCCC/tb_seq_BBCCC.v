`include "seq_BBCCC.v"
module top;
	reg clk,rst,din;
	wire pattern;
	integer count=0;
	seq dut(clk,rst,din,pattern);

	initial begin
		clk=0;
		forever #5 clk=~clk;
	end
	initial begin
		rst=1;
		din=0;
		repeat(2)@(posedge clk);
		rst=0;
		repeat(200)begin
			@(posedge clk);
			din = $random;
		end
		$display("No.of Patterns Detected = %0d",count);
		#100;
		$finish;
	end
	always@(posedge pattern) count=count+1;
endmodule
