module FA_1bit (input a_in,b_in,c_in, output sum_out, carry_out);

assign {carry_out, sum_out} = a_in + b_in + c_in;

endmodule


module FA_1bit_tb;

reg a_in, b_in, c_in;
wire sum_out, carry_out;

FA_1bit FA_1bit_1(.a_in(a_in), .b_in(b_in), .c_in(c_in), .sum_out(sum_out), .carry_out(carry_out));

initial
   begin 
   $monitor("time=%d\t a_in=%b\t b_in=%b\t c_in=%b\t sum=%b\t carry=%b",$time , a_in, b_in, c_in, sum_out, carry_out);
   a_in = 0; b_in = 0; c_in = 0;
   #10   a_in = 1;
   #10   b_in = 1;
   #10   b_in = 0;  c_in =1;
   #10   $stop;
   end

endmodule 
