module freq_div_by_5(clk_out, reset_ah_in, clk);

input clk;
input reset_ah_in;
output clk_out;

reg [2:0] temp_counter;
reg odd_gen;
always@(posedge clk) begin

	if (~reset_ah_in)
		temp_counter <= 0;
	else begin
		if ( temp_counter == 5)
			temp_counter <= 0;
		else
			temp_counter <= temp_counter +1;
	end
end

always@(negedge clk)begin
    if (~reset_ah_in)
        odd_gen <=0;
    else
        odd_gen <= temp_counter[1];
end

assign clk_out = odd_gen | temp_counter[1];

endmodule