/*look at the synchronous explanation and follow the book design.*/
/*

module d_ff_pet_asyn_al_load_en(d_in, q_out, reset_al_in, en_in, clk);

input d_in;
input reset_al_in;
input clk;
input en_in;
output reg q_out;

always@(posedge clk, negedge reset_al_in)
begin
	if(~reset_al_in)
		q_out <= 1'b0;
	else if( en_in)
		q_out <= d_in;
end
endmodule
*/

module d_ff_pet_asyn_reset_preset(q_out, reset_al_in, preset_in, clk, d_in);

input d_in;
input reset_al_in;
input clk;
input preset_in;
output reg q_out;

always@(posedge clk, negedge reset_al_in, posedge preset_in)
begin
	if(~reset_al_in)
		q_out <= 1'b0;
	else if( preset_in)
		q_out <= 1'b1;
	else 
		q_out <= d_in;
end
endmodule

