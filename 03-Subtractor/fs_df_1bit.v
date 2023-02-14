module fs_df_1bit (input a_in,b_in,borrow_in, output diff_out, borrow_out);

assign diff_out = a_in ^ b_in ^ borrow_in;
assign carry_out = ~a_in & b_in | (~a_in | b_in) & borrow_in;

endmodule