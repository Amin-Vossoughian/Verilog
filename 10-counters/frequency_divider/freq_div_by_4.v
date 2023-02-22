module freq_div_by_4(clk, reset_ah_in, clk_out);

input clk, reset_ah_in;
output reg clk_out;

reg temp_clk_by_2;

always@(posedge clk) 
	if (reset_ah_in)
		temp_clk_by_2 <= 0;
	else 
		temp_clk_by_2 <= ~temp_clk_by_2;

always@(posedge temp_clk_by_2)
	if (reset_ah_in)
		clk_out <= 0;
	else 
		clk_out <= ~ clk_out

endmodule


