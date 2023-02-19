module counter_up_para#(parameter N=8)(count_out, d_in, load_in, reset_al_in, clk);

input [N-1:0] d_in;
input clk;
input reset_al_in;
input load_in;
output reg [N-1:0] count_out;

always@(posedge clk, negedge reset_al_in)
begin
	if (~reset_al_in)
		count_out <= 0;
	else if (load_in)
		count_out <= d_in;
	else
	count_out <= count_out + 1'b1;
end
endmodule

		