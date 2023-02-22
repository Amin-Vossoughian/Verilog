/*in this case it is not possible to simply implement the invalid data block*/
module encoder_4_2_df(d_out, d_in);

input [3:0] d_in;
output [1:0] d_out;
 
assign d_out[1] = ~d_in[3] & d_in[2] & ~d_in[1] & ~d_in[0] | d_in[3] & ~d_in[2] & ~d_in[1] & ~d_in[0];
assign d_out[0] = ~d_in[3] & ~d_in[2] & d_in[1] & ~d_in[0] | d_in[3] & ~d_in[2] & ~d_in[1] & ~d_in[0];

endmodule
