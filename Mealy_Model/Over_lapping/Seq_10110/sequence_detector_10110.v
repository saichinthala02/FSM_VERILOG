//--> Implementation of FSM Over lapping Sequence Detetctor "10110".
module seq_det(clk_i,rst_i,d_i,sd_o);
	parameter S1 =5'b00001;
	parameter S2 =5'b00010;
	parameter S3 =5'b00100;
	parameter S4 =5'b01000;
	parameter S5 =5'b10000;

	input clk_i,rst_i;
	input d_i;
	output reg sd_o;
    reg [4:0] present_state,next_state;
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
							next_state=S5;
							sd_o=0;
						end
						else begin
							next_state=S3;
							sd_o=0;
						end
				end
				S5 : begin
						if(!d_i) begin
							next_state=S3;
							sd_o=1;
						end
						else begin
							next_state=S2;
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
