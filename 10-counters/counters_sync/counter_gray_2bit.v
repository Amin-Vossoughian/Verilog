module counter_gray_2bit(count_out, reset_al_in, clk);

input reset_al_in;
input clk;
output [1:0] count_out;

reg [1:0] binary_out;


always@(posedge clk, negedge reset_al_in)

begin 
	if (~reset_al_in)
		binary_out <= 2'b00;
	else 
		binary_out <= binary_out +1;
end 

assign count_out[1] = binary_out[1];
assign count_out[0] = ^binary_out;

endmodule
