module decoder_ah_2_4_bh_mux;

reg [1:0] sel_in;
reg en_in;

wire [3:0] y_out;

decoder_ah_2_4_bh_mux   uut_decoder_mux(.sel_in(sel_in), .en_in(en_in), .y_out(y_out));

always #10 sel_in[0] = ~sel_in[0];
always #10 sel_in[1] = ~sel_in[1];
initial begin
$monitor ("time=%d\t  sel_in=%b\t  en_in=%b\t  y_out=%b\t", $time, sel_in, en_in, y_out);
//initial inputs
sel_in=0;
en_in=0;
#100
en_in=1;
#250
en_in=0;
end 
endmodule