module FS_bh_1bit (input a_in,b_in,borrow_in, output diff_out, borrow_out);

assign {borrow_out, diff_out} = a_in - b_in - borrow_in;

endmodule


module FS_df_1bit (input a_in,b_in,borrow_in, output diff_out, borrow_out);

assign diff_out = a_in ^ b_in ^ borrow_in;
assign carry_out = ~a_in & b_in | (~a_in | b_in) & borrow_in;

endmodule




module FS_1bit_tb;

reg a_in, b_in, borrow_in;
wire diff_out, borrow_out;

FS_bh_1bit FS_1bit_1(.a_in(a_in), .b_in(b_in), .borrow_in(borrow_in), .diff_out(diff_out), .borrow_out(borrow_out));

initial
   begin 
   $monitor("time=%d\t a_in=%b\t b_in=%b\t borrow_in=%b\t differece=%b\t borrow=%b",$time , a_in, b_in, borrow_in, diff_out, borrow_out);
   a_in = 0; b_in = 0; borrow_in = 0;
   #10   a_in = 1;
   #10   b_in = 1;
   #10   b_in = 0;  borrow_in =1;
   #10   $stop;
   end

endmodule 
