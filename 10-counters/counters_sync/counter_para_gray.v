/*
check for the number of bit  in case of reset
there was no error in execution and reset set all bits to zero not just 4!!!
*/

module counter_para_gray #(parameter N=8)(clk, reset_al_in, count_out);

input clk;
input reset_al_in;
output reg [N-1:0] count_out ;

reg [N-1:0] binary_out;
integer i;


always@(posedge clk, negedge reset_al_in) begin
	if (~reset_al_in)
		binary_out <= 8'b0000_0000;
	else begin
		binary_out <= binary_out +1;
		count_out[N-1] <= binary_out[N-1];
		for (i =0 ; i < N-1; i=i+1) 
			count_out[N-(i+2)] <= binary_out[N-(1+i)] ^ binary_out[N-(i+2)];
	end
end

endmodule
