module d_ff_pet_asyn(d_in, clk, reset_al_in, q_out);

input d_in;
input clk;
input reset_al_in;
output reg q_out;

always@(posedge clk, negedge reset_al_in)
begin

if (~reset_al_in) q_out <= 1'b0;
else q_out <= d_in;

end
endmodule