/*the possible benefit of this design over the second one is that the condition check between
different if could be perform by shared resource. also consider that in else if we could 
remove the < or > and just use queal, since in the reset condition we already consider
both case. so the comparision become easier. while in other disign could be more 
complex. this have to be check after synthesis by considering area and power report. 
*/

module counter_10_to_40_up_down_bh1(count_out, reset_al_in, load_en_in, d_in, clk, ahup_aldown);

input [7:0] d_in;
input load_en_in;
input clk;
input reset_al_in;
output reg [7:0] count_out;

reg [7:0] temp_count;
always@(posedge clk) begin
	if (~reset_al_in | temp_count > 8'd40 | temp_count < 8'd10)
		temp_count <= 8'd10;
	else if (load_en_in)
		temp_count <= d_in;
	else if ( ahup_aldown)
		temp_count <= (temp_count >=40) ? 10 : temp_count+1;
	else
		temp_count <= (temp_count <=10) ? 40 : temp_count-1;
end
assign count_out = temp_count;
endmodule