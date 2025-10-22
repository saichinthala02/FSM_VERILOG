//--> Implementation of FSM Non-Over lapping Sequence Detetctor "1011".
module seq_det(clk_i,rst_i,d_i,sd_o);
	parameter S1 = 4'b0001;
	parameter S2 = 4'b0010;
	parameter S3 = 4'b0100;
	parameter S4 = 4'b1000;

	input clk_i,rst_i;
	input d_i;
	output reg sd_o;
    reg [3:0] present_state,next_state;
	always@(posedge clk_i)begin
		if(rst_i) begin
			sd_o =0;
			present_state=S1;
			next_state=S1;
		end
		else begin
			case(present_state)
				S1 : begin
						if(d_i) begin
							next_state=S2;
							sd_o=0;
						end
						else begin
							next_state=S1;
							sd_o=0;
						end
				end
				S2 : begin
						if(!d_i) begin
							next_state=S3;
							sd_o=0;
						end
						else begin
							next_state=S2;
							sd_o=0;
						end
				end
				S3 : begin
						if(d_i) begin
							next_state=S4;
							sd_o=0;
						end
						else begin
							next_state=S1;
							sd_o=0;
						end
				end
				S4 : begin
						if(d_i) begin
							next_state=S1;
							sd_o=1;
						end
						else begin
							next_state=S1;
							sd_o=0;
						end
				end
			endcase

		end
	end
	always@(next_state)begin
		present_state=next_state;
	end
endmodule
