module pipo_nbit #(parameter N=16)(d_in, q_out, clk, reset_al_in);

input clk;
input reset_al_in;
input  [N-1:0] d_in;
output reg [N-1:0] q_out;

always@(posedge clk) begin
	
	if (~reset_al_in)
		q_out <= 0;
	else
		q_out <= d_in;
	
	
	end
endmodule

/*test: it check if it the same as the one without clk else if in synthesis not simulation*/

module pipo_nbit_test #(parameter N=16)(d_in, q_out, clk, reset_al_in);

input clk;
input reset_al_in;
input  [N-1:0] d_in;
output reg [N-1:0] q_out;

always@(posedge clk) begin
	
	if (~reset_al_in)
		q_out <= 0;
	else if(clk)
		q_out <= d_in;
	
	
	end
endmodule