
/*instead of using assign 4 times, we could simply use concatonation*/
module decoder_ah_2_4_df(y_out, sel_in, en_in);

input [1:0] sel_in;
input en_in;

output [3:0] y_out;

assign y_out[0] = en_in & (~sel_in[1] & ~sel_in[0]);
assign y_out[1] = en_in & (~sel_in[1] & sel_in[0]);
assign y_out[2] = en_in & (sel_in[1] & ~sel_in[0]);
assign y_out[3] = en_in & (sel_in[1] & sel_in[0]);
/*
assign y_out = {en_in & (~sel_in[1] & ~sel_in[0]),en_in & (~sel_in[1] & sel_in[0]), en_in & (sel_in[1] & ~sel_in[0]),en_in & (sel_in[1] & sel_in[0])}
*/
endmodule
