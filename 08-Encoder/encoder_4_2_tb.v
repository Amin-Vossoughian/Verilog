module encoder_4_2_tb;

reg [3:0] d_in;
wire invalid_input;
wire [2:0] d_out;

always #5 d_in[0] = ~ d_in[0];
always #10 d_in[1] = ~ d_in[1];
always #15 d_in[2] = ~ d_in[2];

initial 
$monitor ("time=%d\t d_in=%b\t invalid_input=%b\t d_out=%b\t", $time, d_in, invalid_input, d_out);

initial begin

d_in = 4'd0;

/*
    d_in = 4'b0001;
#10 d_in = 4'b0010;
#10 d_in = 4'b0100;
#10 d_in = 4'b1000;
#10 d_in = 4'b1001;
*/

#100 $stop
end
endmodule