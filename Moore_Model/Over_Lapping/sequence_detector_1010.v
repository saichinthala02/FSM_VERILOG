//--> Implementation of 1010 Sequence Detector Moore model .
//--> Over_Lapping
module seq_det(clk,rst,din,pattern);
	parameter S1 = 5'b00001;
	parameter S2 = 5'b00010;
	parameter S3 = 5'b00100;
	parameter S4 = 5'b01000;
	parameter S5 = 5'b10000;

	input clk,rst,din;
	output reg pattern;
	
	reg [4:0] present_state,next_state;

	always@(posedge clk) begin
		if(rst) begin
			pattern <= 0;
			present_state <= S1;
			next_state <= S1;
		end
		else begin
			case(present_state)
				S1 : begin
						if(din==1) begin
							next_state = S2;
							pattern=0;
						end
						else begin
							next_state = S1;
							pattern=0;
						end
				end
				S2 : begin
						if(din==0) begin
							next_state = S3;
							pattern=0;
						end
						else begin
							next_state = S2;
							pattern=0;
						end
				end				
				S3 : begin
						if(din==1) begin
							next_state = S4;
							pattern=0;
						end
						else begin
							next_state = S1;
							pattern=0;
						end
				end				
				S4 : begin
						if(din==0) begin
							next_state = S5;
							pattern=0;
						end
						else begin
							next_state = S2;
							pattern=0;
						end
				end				
				S5 : begin
						if(din==1) begin
							next_state = S4;
							pattern = 1;
						end
						else begin
							next_state = S1;
							pattern = 1;
						end
				end				
			endcase
		end
	end
	always@(next_state) present_state = next_state;
endmodule
