module counter_tb;
parameter N=10;
parameter ring_counter_test = 1;
reg clk;
reg reset_al_in;
wire [N-1:0] count_out;

if (ring_counter_test == 1)
ring_counter DUT(.clk(clk), .count_out(count_out), .reset_al_in(reset_al_in));

else
johnson_counter DUT(.clk(clk), .count_out(count_out), .reset_al_in(reset_al_in));


always #10 clk = ~clk;

initial begin
$monitor( "time:%d reset_al_in=%b\t clk=%b\t count_out=%b\t", $time, reset_al_in, clk, count_out);
clk =0;
reset_al_in=1'b0;

#30 reset_al_in=1'b1;

#200 reset_al_in=1'b0;

#50 reset_al_in=1'b1;

#300 $stop;
end
endmodule
