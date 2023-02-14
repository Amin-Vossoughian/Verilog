module mux_2_1_bh(s_in, y_out);

input s_in;
input [1:0] d_in;
output y_out;

assign y_out= s_in ? y_out[1] : y_out[0];

endmodule 