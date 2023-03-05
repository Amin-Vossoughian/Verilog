/*
The following desing is my own desing that is base on all the concept that 
learn so far from the books. the problem with this desing is 
that the output will back to input, which form a cyclic design. it is not
a problem in sequential design but compiler did not recognize this code as
the code that implent the FF with internal feedback. But the latter code is recognize by compiler 
and implement a ff with enable, eventhough it has more instruction and more difficult to understand
for design point of view and  implementation, but it has been common practice and more professional
to follow. 
the pdf in the folder shows both implementation. 
*/

/*
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
*/
module d_ff_pet_syn_reset_preset(d_in, q_out, reset_al_in, preset_in, clk);

input d_in;
input reset_al_in;
input clk;
input preset_in;
output reg q_out;

always@(posedge clk)
begin
	if(~reset_al_in)
		q_out <= 1'b0;
	else if( preset_in)
		q_out <= 1'b1;
	else 
		q_out <= d_in;
end
endmodule
