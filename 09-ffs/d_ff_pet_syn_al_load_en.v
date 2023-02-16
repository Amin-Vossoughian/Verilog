module d_ff_pet_syn_al_load_en(d_in, q_out, reset_al_in, en_in, clk);

input d_in;
input reset_al_in;
input clk;
input en_in;
output reg q_out;

always@(posedge clk)
begin
	if(~reset_al_in)
		q_out <= 1'b0;
	else if( ~en_in)
		q_out <= d_in;
end
endmodule

/*module d_ff_pet_syn_al_load_en(d_in, q_out, reset_al_in, en_in, clk);

input d_in;
input reset_al_in;
input clk;
input en_in;
output reg q_out;

always@(posedge clk)
begin
	if(~reset_al_in)
		q_out <= 1'b0;
	else if( en_in)
		q_out <= 1'b1;
	else 
		q_out <= d_in;
end
endmodule
*/
