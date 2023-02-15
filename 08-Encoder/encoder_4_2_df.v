/*in this case we use exor to detec the invalid data*/
module encoder_4_2_df(d_out, d_in);

input [3:0] d_in;
output [2:0] d_out;

assign d_out[2] = ^d_in; 
assign d_out[1] = ~d_out[3] & d_out[2] & ~d_out[1] & ~d_out[0] + d_out[3] & ~d_out[2] & ~d_out[1] & ~d_out[0];
assign d_out[0] = invalid_data, ~d_out[3] & ~d_out[2] & d_out[1] & ~d_out[0] + d_out[3] & ~d_out[2] & ~d_out[1] & ~d_out[0];

endmodule
