module siso_nbit_ #(parameter N=16) (d_in, q_out, clk, reset_al_in);

input  clk;
input  reset_al_in;
input  d_in;
output reg  [N-1:0] q_out;
integer i;


always@(posedge clk or negedge reset_al_in) begin
	if (~reset_al_in) 
		q_out = 0;
	else begin
		for (i=1; i < N; i++) begin
			q_out[N-1+i] <= q_out[N+i-2];
		end
	q_out[0] <= d_in;
	end
end

endmodule