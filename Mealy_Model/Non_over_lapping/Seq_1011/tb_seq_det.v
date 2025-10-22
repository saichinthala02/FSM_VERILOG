//--> Implememtation of TB
`include "sequence_detector_1011.v"
module top;
	reg clk_i,rst_i;
	reg d_i;
	wire sd_o;
	integer count;
	integer seed=254585;
	seq_det dut(clk_i,rst_i,d_i,sd_o);

	initial begin
		clk_i=1;
		forever #5 clk_i=~clk_i;
	end
	initial begin
		rst_i=1;
		d_i=0;
		count=0;
		repeat(2)@(posedge clk_i);
		rst_i=0;
	end
	initial begin
		repeat(130)begin
			d_i=$random(seed);
			#10;
		end
	end
	always@(posedge sd_o) count=count+1;
	initial begin
		#500;
		$finish;
	end
	
endmodule
