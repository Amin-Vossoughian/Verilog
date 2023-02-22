module reg_set(q1_out,q2_out,clk,reset_ah_in, d1_in,d2_in);

input clk, reset_ah_in;
input [7:0] d1_in,d2_in;
output reg [7:0] q1_out,q2_out;

always@(posedge clk)
	if (reset_ah_in) begin
		q1_out <= 0;
		q2_out <= 0;
	end
	else begin
		q1_out <= d1_in;
		q2_out <= d2_in;
	end
endmodule