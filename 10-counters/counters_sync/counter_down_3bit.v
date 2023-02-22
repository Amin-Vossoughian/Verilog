/*module counter_down_3bit(count_out, d_in, load_in, reset_al_in, clk);

input [2:0] d_in;
input clk;
input reset_al_in;
input load_in;
output reg [2:0] count_out;

always@(posedge clk, negedge reset_al_in)
begin
	if (~reset_al_in)
		count_out <= 3'b000;
	else if (load_in)
		count_out <= d_in;
	else
	count_out <= count_out - 1'b1;
end
endmodule
*/

module counter_down_3bit(count_out, d_in, load_in, reset_al_in, clk);

input [2:0] d_in;
input clk;
input reset_al_in;
input load_in;
output [2:0] count_out;

reg [2:0] count_temp;

always@(posedge clk, negedge reset_al_in)
begin
	if (~reset_al_in)
		count_temp <= 3'b000;
	else if (load_in)
		count_temp <= d_in;
	else
	count_temp <= count_temp - 1'b1;
end

assign count_out = count_temp;

endmodule
