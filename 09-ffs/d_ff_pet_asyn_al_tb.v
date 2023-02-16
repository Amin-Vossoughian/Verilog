module  d_ff_pet_asyn_al_tb;

reg d_in;
reg clk;
reg reset_al_in;
wire q_out;

always #10 clk=~clk;
always #50 reset_al_in = reset_al_in 
always #15 d_in = ~ d_in;
initial
$monitor("time:%d\t reset_al_in=%b\t clk=%b\t d_in=%b\t q_out=%b\t", $time, reset_al_in, clk, d_in, q_out);

initial begin

d_in  = 1'b0;
reset_al_in = 1'b0;
clk = 1'b0;

#350 $stop;

endmodule

