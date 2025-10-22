//--> Implementation of 1010 Sequence Detector Test_Bench
`include "sequence_detector_1010.v"
module top;
	reg clk,rst,din;
	wire pattern;

	seq_det dut(clk,rst,din,pattern);
	
	initial begin
		clk=1;
		forever #5 clk=~clk;
	end
	initial begin
		rst=1;
		din=0;
		repeat(2)@(posedge clk);
		rst=0;
		repeat(50)begin
			din=$random;
			#10;

		end
		#100;
		$finish;
	end
endmodule
