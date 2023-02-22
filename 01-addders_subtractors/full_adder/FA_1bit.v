
/************** Behaviourial ************/
module FA_1bit (input a_in,b_in,c_in, output sum_out, carry_out);

assign {carry_out, sum_out} = a_in + b_in + c_in;

endmodule

/*************** Data flow **********/
module FA_1bit (input a_in,b_in,c_in, output sum_out, carry_out);

assign sum_out = a_in ^ b_in ^ c_in;
assign carry_out = a_in & b_in + (a_in ^ b_in) c_in;

endmodule


/********* Structural with primary gate *********/

module FA_1bit_st(s,c,a,b,cin);
input a,b,cin;
output s,c;
/* wire description:
N1: betweeb tow xor
N2 ...4: between and and or;
*/
wire N1,N2,N3,N4;

xor xor1(N1,a,b);
xor xor2(s,N1,cin);
and and1(N2,a,b);
and and2(N3,a,b);
and and3(N4,cin,a);
or  or1(c,N2,N3,N4);

endmodule;

/************ structural with Half-adder *******/
module FA_1bit_st_HA (s,c,a,b,cin);
input a,b,cin;
output s,c;

wire N1, N2,N3;

HA_df  HA_df_1(N1,N2,a,b);
HA_df  Ha_df_2(s,N3,N1,cin);
or or1(c,N2,N3);

endmodule

/************ Test Bench ************/
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
