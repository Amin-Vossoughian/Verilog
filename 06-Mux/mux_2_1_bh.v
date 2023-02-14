module mux_2_1_bh(s_in,d_in, y_out);

input s_in;
input [1:0] d_in;
output y_out;

assign y_out= s_in ? d_in[1] : d_in[0];

endmodule 
