module HS_1bit (input a_in,b_in, output diff_out, borrow_out);

assign {borrow_out, differ_out} = a_in - b_in;

endmodule


module HS_1bit (input a_in,b_in, output diff_out, borrow_out);

assign diff_out = a_in ^ b_in;
assign carry_out = (~a_in) & b_in;

endmodule




module HS_1bit_tb;

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
