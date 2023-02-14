module decoder_ah_1_2_df(sel_in, en_in, y_out);

input sel_in;
input en_in;
output y_out;

assign y_out[0] = en_in & (~sel_in);
assign y_out[1] = en_in & (sel_in);

endmodule