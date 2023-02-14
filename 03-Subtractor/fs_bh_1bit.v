module fs_bh_1bit (input a_in,b_in,borrow_in, output diff_out, borrow_out);

assign {borrow_out, diff_out} = a_in - b_in - borrow_in;

endmodule


