module counter_up_modulus_3bit(q_out, d_in, load_in, reset_al_in, clk);

input [7:0] d_in;
input clk;
input reset_al_in;
input load_in;
output reg [7:0] q_out;

always@(posedge clk, negedge reset_al_in)
begin
	if (~reset_al_in | count_temp >= 8'd46)
		q_out <= 8'b00000000;
	else if (load_in)
		q_out <= d_in;
	else
	q_out <= q_out + 1'b1;
end
endmodule

/*check with compiler to see if begin end is required*/

module counter_up_modulus_3bit(q_out, d_in, load_in, reset_al_in, clk);

input [7:0] d_in;
input clk;
input reset_al_in;
input load_in;
output reg [7:0] q_out;

reg [7:0]count_temp;

always@(posedge clk, negedge reset_al_in)
begin
	if (~reset_al_in | count_temp >= 8'd46)
		count_temp <= 3'b000;
	else if (load_in)
		count_temp <= d_in;
	else
	count_temp <= count_temp + 1'b1;
end

assign q_out = count_temp;

endmodule
		