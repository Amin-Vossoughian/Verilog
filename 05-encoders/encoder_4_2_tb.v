/* test bench will work for both type of encoder, in case of priority encoder only
one case invalid will be one (0000) otherwise will act as expected.*/

module encoder_4_2_tb;
parameter priority_test = 0;
reg [3:0] d_in;
wire invalid_input;
wire [1:0] d_out;

if (priority_test == 1)
	encoder_priority_4_2_bh DUT(.d_in(d_in), .invalid_input(invalid_input), .d_out(d_out));
else encoder_4_2_bh DUT(.d_in(d_in), .invalid_input(invalid_input), .d_out(d_out));


always #5 d_in[0] = ~ d_in[0];
always #10 d_in[1] = ~ d_in[1];
always #20 d_in[2] = ~ d_in[2];
always #40 d_in[3] = ~ d_in[3];

initial 
$monitor ("time=%d\t d_in=%b\t invalid_input=%b\t d_out=%b\t", $time, d_in, invalid_input, d_out[1:0]);

initial begin

d_in = 4'b0000;

#100 $stop;
end
endmodule
