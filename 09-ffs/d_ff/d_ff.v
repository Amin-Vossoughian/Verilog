module d_ff(d_in,clk, q_out);

input d_in;
input clk;
output reg q_out;

always@(posedge clk)
	q_out <= d_in;

endmodule

/*

the if(clk) is not required due to the fact that we are just 
sensitive to posedge, clk will be one for sure. it is redundent.
module d_ff(d_in,clk, q_out);

input d_in;
input clk;
output reg q_out;

always@(posedge clk)
if (clk)
	q_out <= d_in;

endmodule
*/