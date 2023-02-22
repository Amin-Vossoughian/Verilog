/*synthesis error, but the simulation works. the error is that the temp[3:1] is driven 
by more than one resource, which here means more than one always block*/

module counter_async_4bits_sync_reset(count_out, reset_al_in, clk);

input clk;
input reset_al_in;
output [3:0] count_out;

reg [3:0] temp_count;

always@(posedge clk)
	if (~reset_al_in)
		temp_count <= 0;
	else
		temp_count[0] <= ~temp_count[0];

always@(posedge temp_count[0])
		temp_count[1] <= ~temp_count[1];

always@(posedge temp_count[1])
		temp_count[2] <= ~temp_count[2];
		
always@(posedge temp_count[2])
		temp_count[3] <= ~temp_count[3];

assign count_out = (~reset_al_in) ? temp_count: ~temp_count;
endmodule
