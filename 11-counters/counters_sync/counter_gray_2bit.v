module counter_gray_2bit(d_in, count_out, reset_al_in, clk)

input [1:0] d_in;
input reset_al_in;
output reg [1:0] count_out;

reg [1:0] bianry_out;


always@(posedge clk, negedge reset_al_in)

begin 
	if (~reset_al_in)
		binary_out <= 2'b00;
	else 
		binary_out <= binary_out +1;
end 

assign count_out[1] = binary_out[1];
assign count_out[0] = ^binary_out[1];