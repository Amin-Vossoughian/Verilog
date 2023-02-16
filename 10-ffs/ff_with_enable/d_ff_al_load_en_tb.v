module d_ff_al_load_en_tb;

parameter  sync_test= 1;

reg d_in;
reg reset_al_in;
reg clk;
reg en_in;
wire q_out;

if ( sync_test ==1)
d_ff_pet_syn_al_load_en DUT(.d_in(d_in), .reset_al_in(reset_al_in), .clk(clk), .en_in(en_in),.q_out(q_out));

else
d_ff_pet_asyn_al_load_en DUT(.d_in(d_in), .reset_al_in(reset_al_in), .clk(clk), .en_in(en_in),.q_out(q_out));


always #10  clk  = ~clk;
always #7   d_in = ~d_in;


initial 
$monitor ("time =%d\treset_al_in=%b\ten_in=%b\tclk=%b\td_in=%b\tq_out=%b",
          $time, reset_al_in, en_in, clk, d_in, q_out);

initial
begin

d_in=0; reset_al_in=0; clk=0; en_in=1;

#30 reset_al_in = 1;

#50 en_in = 0;

#3000 $stop;

end 
endmodule
