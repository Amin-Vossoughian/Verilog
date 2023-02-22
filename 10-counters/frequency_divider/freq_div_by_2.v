module freq_div_by_2(clk, reset_ah_in, clk_out);

input clk, reset_ah_in;
output reg clk_out;

always@(posedge clk) 
	if (reset_ah_in)
		clk_out <= 0;
	else 
		clk_out <= ~clk_out;
endmodule