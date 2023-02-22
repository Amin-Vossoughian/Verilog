module counter_async_4bits_tb;

reg clk;
reg reset_al_in;
wire [3:0] count_out;


counter_async_4bits  DUT(.clk(clk), .reset_al_in(reset_al_in), .(count_out));

always #10 clk = ~clk;

initial 
$monitor("time=%d\t reset_al_in=%b\t clk=%b\t  count_out=%d\t", $time, reset_al_in, clk, count_out);

initial
reset_al_in = 0'b1'

#20 reset_al_in= 0'b0; 
#1000 $stop;


