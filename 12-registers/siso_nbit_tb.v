module siso_nbit_tb;

parameter N = 4;

reg clk;
reg reset_al_in;
reg d_in;
wire q_out;

siso_nbit_test  DUT(.clk(clk), .reset_al_in(reset_al_in), .d_in(d_in), .q_out(q_out));

initial 
$monitor ("time:%d reset_al_in=%b\t clk=%b\t d_in=%b\t  q_out=%b\t", $time, reset_al_in, clk, d_in, q_out);

always #10 clk = ~clk;
always #80 d_in = ~d_in;
initial begin

reset_al_in=1'b0;
clk= 1'b0;
d_in = 0;

#50 reset_al_in=1'b1;

#600 $stop;
end 
endmodule
