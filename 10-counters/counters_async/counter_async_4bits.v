module counter_async_4bits(count_out, reset_al_in, clk);

input clk;
input reset_al_in;
output reg [3:0] count_out;

reg [3:0] temp_count;

always@(posedge clk)
	if (~reset_al_in)
		temp_count[0] <= 0;
	else
		temp_count[0] <= ~temp_count[0];

always@(posedge temp_count[0])
	if (~reset_al_in)
		temp_count[1] <= 0;
	else
		temp_count[1] <= ~temp_count[1];

always@(posedge temp_count[1])
	if (~reset_al_in)
		temp_count[2] <= 0;
	else
		temp_count[2] <= ~temp_count[2];
		
always@(posedge temp_count[2])
	if (~reset_al_in)
		temp_count[3] <= 0;
	else
		temp_count[3] <= ~temp_count[3];

assign cout_out = temp_count;
endmodule