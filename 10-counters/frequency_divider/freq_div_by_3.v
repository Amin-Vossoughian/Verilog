module freq_div_by_3(clk,reset_ah_in,clk_out);

input clk;
input reset_ah_in;
output clk_out;

reg [1:0] pos_cnt;
reg [1:0] neg_cnt;

always@(posedge clk)
	if(reset_ah_in)
		pos_cnt <= 0;
	else if(pos_cnt == 2)
		pos_cnt <= 0;
	else
		pos_cnt <= pos_cnt+1;

always@(negedge clk)
	if(reset_ah_in)
		neg_cnt<= 0;
	else if (neg_cnt == 2)
		neg_cnt <= 0;
	else neg_cnt <= neg_cnt+1;
	
assign clk_out = ((pos_cnt == 2) | (neg_cnt == 2));
endmodule