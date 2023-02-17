module d_ff_reset_preset_tb;

parameter  sync_test= 0;

reg d_in;
reg reset_al_in;
reg clk;
reg preset_in;
wire q_out;

if ( sync_test ==1)
d_ff_pet_syn_reset_preset DUT(.d_in(d_in), .reset_al_in(reset_al_in), .clk(clk), .preset_in(preset_in),.q_out(q_out));

else
d_ff_pet_asyn_reset_preset DUT(.d_in(d_in), .reset_al_in(reset_al_in), .clk(clk), .preset_in(preset_in),.q_out(q_out));

always #173 preset_in = ~ preset_in;
always #100 reset_al_in = ~ reset_al_in;
always #10  clk  = ~clk;
always #7   d_in = ~d_in;


initial 
$monitor ("time =%d\treset_al_in=%b\tpreset_in=%b\tclk=%b\td_in=%b\tq_out=%b",
          $time, reset_al_in, preset_in, clk, d_in, q_out);

initial
begin

d_in=0; reset_al_in=0; clk=0; preset_in=1;


#5000 $stop;

end 
endmodule

//vsim work.d_ff_reset_preset_tb -t 10ps -voptargs=+acc
