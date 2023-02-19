module ring_counter #(parameter N=10)(clk, count_out, reset_al_in);

input clk;
input reset_al_in;
output reg [N-1:0] count_out;

always@(posedge clk, negedge reset_al_in)
 
	if (~reset_al_in)begin
	
		count_out[N-1] <= 1'b1;
		count_out[N-2:0] <= 0;
		end	
	else
		count_out <={count_out[0], count_out[N-1:1]};

endmodule
