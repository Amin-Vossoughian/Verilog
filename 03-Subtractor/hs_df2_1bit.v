module hs_df2_1bit (input a_in,b_in, output diff_out, borrow_out);

assign diff_out = a_in ^ b_in;
assign carry_out = (~a_in) & b_in;

endmodule