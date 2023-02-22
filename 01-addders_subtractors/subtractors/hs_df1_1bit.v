module hs_df1_1bit (input a_in,b_in, output diff_out, borrow_out);

assign {borrow_out, differ_out} = a_in - b_in;

endmodule