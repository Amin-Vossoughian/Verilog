module Binary_to_Gray(input [3:0] a_in , output [3:0] b_in);

assign b_in[3] = a_in[3];
assign b_in[2] = a_in[3] ^ a_in[2];
assign b_in[1] = a_in[2] ^ a_in[1];
assign b_in[0] = a_in[1] ^ a_in[0];

endmodule