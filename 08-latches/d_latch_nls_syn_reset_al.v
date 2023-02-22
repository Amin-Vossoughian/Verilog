module d_latch_nls_syn_reset_al(q_out,reset_al_in,en_in,d_in);

input d_in;
input en_in;
input reset_al_in;
output reg q_out;

always@* begin

if (~reset_al_in)  q_out= 1'b0;
else if  (en_in)  q_out = d_in;

end
endmodule
