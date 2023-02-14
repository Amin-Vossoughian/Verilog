module hs_1bit_tb;

reg a_in, b_in, borrow_in;
wire diff_out, borrow_out;

FA_1bit FA_1bit_1(.a_in(a_in), .b_in(b_in), .diff_out(diff_out), .borrow_out(borrwo_out));

initial
   begin 
   $monitor("time=%d\t a_in=%b\t b_in=%b\t borrow_in=%b\t differece=%b\t borrow=%b",$time , a_in, b_in, differ_out, borrow_out);
   a_in = 0; b_in = 0;
   #10   a_in = 1;
   #10   b_in = 1;
   #10   b_in = 0;
   #10   $stop;
   end

endmodule 
