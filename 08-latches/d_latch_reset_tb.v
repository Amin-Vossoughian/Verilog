module d_latch_reset_tb;

reg d_in;
reg en_in;
reg reset_al_in;
wire q_out;

d_latch_nls_syn_reset_al DUT(.q_out(q_out), .d_in(d_in), .en_in(en_in),.reset_al_in(reset_al_in));

always #7  d_in = ~d_in;
always #10 en_in = ~ en_in;

initial 
$monitor("time:%d\t reset=%b\ten_in=%b\t d_in=%b\t q_out=%b\t", $time, reset_al_in, en_in, d_in, q_out);

initial begin

reset_al_in = 1'b0;
d_in  = 1'b0;
en_in = 1'b0;

#50 reset_al_in= 1'b1;

#300 $stop;

end
endmodule
