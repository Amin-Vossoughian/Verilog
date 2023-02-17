module d_ff(d_in,clk, q_out);

input d_in;
input clk;
output reg q_out;

always@(posedge clk)
	q_out <= d_in;

endmodule
