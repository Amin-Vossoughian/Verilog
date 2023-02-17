module d_latch_tb;
parameter UUT_d_latch_nls =1;

reg d_in;
reg en_in;
wire q_out;

if ( UUT_d_latch_nls == 1)
	  d_latch_nls  DUT(.q_out(q_out), .d_in(d_in), .en_in(en_in));
else  d_latch_pls  DUT(.q_out(q_out), .d_in(d_in), .en_in(en_in));

always #6  d_in = ~d_in;
always #10 en_in = ~ en_in;

initial 
$monitor("time:%d\t en_in=%b\t d_in=%b\t q_out=%b\t", $time, en_in, d_in, q_out);

initial begin

d_in  = 1'b0;
en_in = 1'b0;

#300 $stop;

end
endmodule
