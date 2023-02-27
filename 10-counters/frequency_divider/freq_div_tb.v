module freq_div_tb;

reg clk;
reg reset_ah_in;
wire clk_out;

freq_div_by_5 UUT(.clk(clk), .reset_ah_in(reset_ah_in), .clk_out(clk_out));

always #5 clk =~clk;

initial begin
$monitor ("time=%d reset_ah_in=%b\t clk=%b\t clk_out=%b\t", $time, reset_ah_in, clk, clk_out);
reset_ah_in = 1'b0;
clk = 1'b0;
#20 reset_ah_in = 1'b1;
#600 $stop;
end

endmodule