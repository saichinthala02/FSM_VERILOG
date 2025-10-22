//--> Implementation of Mealy State Machhine
//--> Overlapping
//--> Sequence : BBCCC
module seq(clk,rst,din,pattern);
	parameter S_RESET = 5'b00001;
	parameter S_B     = 5'b00010;
	parameter S_BB    = 5'b00100;
	parameter S_BBC   = 5'b01000;
	parameter S_BBCC  = 5'b10000;

	parameter B = 1'b0;
	parameter C = 1'b0;

	input clk,rst,din;
	output reg pattern;
	reg [4:0] state,next_state;
	always@(posedge clk) begin
		if(rst) begin
			pattern <= 0;
			state <= S_RESET;
			next_state <= S_RESET;
		end
		else begin
			pattern = 0;
			case(state)
				S_RESET : begin
							if(din==B) next_state = S_B;
							else next_state = S_RESET;
				end
				S_B : begin
							if(din==B) next_state = S_BB;
							else next_state = S_RESET;
				end
				S_BB : begin
							if(din==B) next_state = S_BB;
							else next_state = S_BBC;
				end
				S_BBC : begin
							if(din==B) next_state = S_B;
							else next_state = S_BBCC;
				end
				S_BBCC : begin
							if(din==B) next_state = S_B;
							else begin
								next_state = S_RESET;
								pattern=1;
							end
				end
			endcase
		end
	end
	always@(next_state) state=next_state;
endmodule
