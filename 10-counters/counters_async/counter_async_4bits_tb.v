module counter_async_4bits_tb;

reg clk;
reg reset_al_in;
wire [3:0] count_out;


counter_async_4bits_async_reset  DUT(.clk(clk), .reset_al_in(reset_al_in), .count_out(count_out));

always #5 clk = ~clk;

initial 
$monitor("time=%d\t reset_al_in=%b\t clk=%b\t  count_out=%d\t", $time, reset_al_in, clk, count_out);

initial begin
clk = 1'b0;
reset_al_in = 1'b0;

#20 reset_al_in= 1'b1; 


#600 $stop;

end

endmodule
