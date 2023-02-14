module decoder_ah_1_2_tb;

reg sel_in, en_in;
wire  [1:0] y_out;

decoder_ah_1_2_bh_mux  uut_decoder_mux(.set_in(sel_in), .en_in(en_in), .y_out(y_out);

initial 
begin 
$monitor ("time=%d\t  sel_in=%b\t  en_in=%b\t  y_out=%b\t", $time, sel_in, en_in, y_out);

en_in = 1'b0; 
#10  en_in = 1'b1;  sel_in=1'b0;
#10  en_in = 1'b1;  sel_in=1'b1;
#10  $stop;

end 
endmodule

