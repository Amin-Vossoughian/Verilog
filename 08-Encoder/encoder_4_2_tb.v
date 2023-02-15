module encoder_4_2_tb;

reg [3:0] d_in;
wire invalid_input;
wire [2:0] d_out;

encoder_4_2_bh  DUT(.d_in(d_in), .invalid_data(invalid_input), .d_out(d_out));

always #5 d_in[0] = ~ d_in[0];
always #10 d_in[1] = ~ d_in[1];
always #15 d_in[2] = ~ d_in[2];
always #15 d_in[3] = ~ d_in[2];

initial 
$monitor ("time=%d\t d_in=%b\t invalid_input=%b\t d_out=%b\t", $time, d_in, d_out[2], d_out[1:0]);

initial begin

d_in = 4'd0;

#100 $stop;
end
endmodule
