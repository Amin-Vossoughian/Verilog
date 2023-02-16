module d_ff_pet_syn_al_load_en_tb;

parameter  sync_test= 0;

reg d_in;
reg reset_al_in;
reg clk;
reg en_in;
wire q_out;

if ( sync_test ==1)
d_ff_pet_syn_al_load_en DUT(.d_in(d_in), .reset_al_in(reset_al_in), .clk(clk), .en_in(en_in),.q_out(q_out));

else
d_ff_pet_asyn_al_load_en DUT(.d_in(d_in), .reset_al_in(reset_al_in), .clk(clk), .en_in(en_in),.q_out(q_out));


always #10  clk=clk;
always #15	reset_al_in = ~reset_al_in;
always #20  en_in = ~en_in;
always #8   d_in = ~d_in;

initial 
$monitor ("time =%d\t, reset_al_in=%b\t, en_in=%b\t, clk=%b\t, d_in=%b\t", $time, reset_al_in, en_in, clk, d_in);

initial
begin
d_in=0;
reset_al_in=0;
clk=0;
en_in=0;

#350 $stop

end 
endmodule