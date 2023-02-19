/*
check for the number of bit  in case of reset
*/

module counter_para_gray#(parameter N=4)(clk, reset_al_in, count_out);

input clk;
input reset_al_in;
output reg count_out [N-1:0];

reg [N-1:0] binary_out;
integer i;

assign count_out[N-1] = binary_out[N-1];

always@(posedge clk, negedge reset_al_in)
begin
if (~reset_al_in)
	binary_out <= 4'b0000;
else 
	binary_out <= binary_out +1;
	
for (i =0 ; i < N-1; i++) 
	begin
	count_out[N-(i+2)] = binary_out[N-(1+i)] ^ binary_out[N-(i+2)];


	end 
end


