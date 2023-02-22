module d_latch_pls_df(d_in, en_in, q_out);

input d_in;
input en_in;
output q_out;

assign q_out= (en_in) ? d_in : q_out;

endmodule
