//--> Implementation of Sequence of BBCBC.
//seq --> 00101.
module pattern(clk,rst,d,pd);
	parameter S_R     = 6'b000001;
	parameter S_B     = 6'b000010;
	parameter S_BB    = 6'b000100;
	parameter S_BBC   = 6'b001000;
	parameter S_BBCB  = 6'b010000;
	parameter S_BBCBC = 6'b100000;

	parameter B=1'b0;
	parameter C=1'b1;

	input clk,rst,d;
	output reg pd;

	reg [5:0] state,nxt_state;

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
					else nxt_state=S_BBCBC;
				end
				S_BBCBC : begin
					pd=1;
					if(d==B) nxt_state=S_B;
					else nxt_state=S_R;
				end

			endcase
		end
	end
	always@(nxt_state) state=nxt_state;
endmodule
