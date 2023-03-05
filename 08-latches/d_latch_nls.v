module d_latch_nls(q_out,en_in,d_in);

input d_in;
input en_in;
output reg q_out;

always@* begin

if (~en_in)  q_out <= d_in;

end
endmodule