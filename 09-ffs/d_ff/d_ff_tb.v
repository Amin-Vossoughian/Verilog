module d_ff_tb;

reg d_in;
reg clk;
wire q_out;

d_ff   DUT(.d_in(d_in), .clk(clk), .q_out(q_out));

always #20 clk = ~clk;
always #11 d_in = ~ d_in;

initial
$monitor("time:%d\t clk=%b\t d_in=%b\t q_out=%b\t", $time, clk, d_in, q_out);

initial begin

d_in  = 1'b0;

clk = 1'b0;

#350 $stop;
end
endmodule

