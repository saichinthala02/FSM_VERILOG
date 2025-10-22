//--> Implementation of Sequence of BBCBC.
//seq --> 00101.
module pattern(clk,rst,d,pd);
	parameter S_R = 5'b00001;
	parameter S_B = 5'b00010;
	parameter S_BB = 5'b00100;
	parameter S_BBC = 5'b01000;
	parameter S_BBCB = 5'b10000;

	parameter B=1'b0;
	parameter C=1'b1;

	input clk,rst,d;
	output reg pd;

	reg [4:0] state,nxt_state;

	always@(posedge clk) begin
		if(rst) begin
			pd=0;
			state=S_R;
			nxt_state=S_R;
		end
		else begin
			pd=0;
			case(state)
				S_R : begin
					if(d==B) nxt_state=S_B;
					else nxt_state=S_R;
				end

				S_B : begin
					if(d==B) nxt_state=S_BB;
					else nxt_state=S_R;
				end
				S_BB : begin
					if(d==B) nxt_state=S_BB;
					else nxt_state=S_BBC;
				end
				S_BBC : begin
					if(d==B) nxt_state=S_BBCB;
					else nxt_state=S_R;
				end
				S_BBCB : begin
					
					if(d==B) nxt_state=S_BB;
					else begin
						nxt_state=S_R;
						pd=1;
					end
				end
			endcase
		end
	end
	always@(nxt_state) state=nxt_state;
endmodule
