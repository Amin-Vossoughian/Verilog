/* try to remove the asssign and see the diff in syn*/

module counter_10_to_40_up_down_bh2(count_out, reset_al_in, load_en_in, d_in, clk, ahup_aldown);

input [7:0] d_in;
input load_en_in;
input clk;
input reset_al_in;
output reg [7:0] count_out;

reg [7:0] temp_count;
always@(posedge clk) begin
	if (~reset_al_in) begin
		case (ahup_aldown) begin
			0'b0: temp_count <= 8'd40;
			default: temp_count <= 8'd10;
		end
	end
	else if (load_en_in)
		temp_count <= d_in;
	else if ( ahup_aldown)
		temp_count <= (temp_count >=40) ? 8'd10 : temp_count+1;
	else
		temp_count <= (temp_count <=10) ? 8'd40 : temp_count-1;
end
assign count_out = temp_count;
endmodule
