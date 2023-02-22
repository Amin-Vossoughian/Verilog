module sr_ls_nbit #(parameter N=4) (d_in, q_out, clk, reset_al_in);

input  clk;
input  reset_al_in;
input  d_in;
output q_out;

reg [N-1:0] sr;

always@(posedge clk or negedge reset_al_in) begin
	if (~reset_al_in) 
		sr <= 0;
	else 
		sr <= {sr[3:0], SI};
end

assign q_out=sr[N];
endmodule