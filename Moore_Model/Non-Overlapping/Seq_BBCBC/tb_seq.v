`include "seq.v"
module top;
	reg clk,rst,d;
	wire pd;
	integer count=0;
	pattern dut(clk,rst,d,pd);
	
	initial begin
		clk=0;
		forever #5 clk=~clk;
	end
	initial begin
		rst = 1;
		d=0;
		repeat(2)@(posedge clk);
		rst =0;
		repeat(200)begin
			@(posedge clk);
			d=$random;
		end
		#100;
		$display("Count=%0d",count);
		$finish;
	end
	always@(posedge pd) count=count+1;
endmodule
