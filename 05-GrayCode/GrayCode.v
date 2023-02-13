module Binary_to_Gray(input [3:0] a_in , output [3:0] b_in);

assign b_in[3] = a_in[3];
assign b_in[2] = a_in[3] ^ a_in[2];
assign b_in[1] = a_in[2] ^ a_in[1];
assign b_in[0] = a_in[1] ^ a_in[0];

endmodule


module Gray_to_Binary(input [3:0] a_in , output [3:0] b_in);

assign b_in[3] = a_in[3];
assign b_in[2] = a_in[3] ^ a_in[2];
assign b_in[1] = (a_in[3] ^ a_in[2]) ^ a_in[1];
assign b_in[0] = ((a_in[3] ^ a_in[2]) ^ a_in[1]) ^ a_in[0];

endmodule

/* couple of important notes
1- Gray codes are used in the gray counter implementation and in the error correcting mechanism.
2-Gray codes are used in the multiple clock domain designs to transfer the control information from one of the clock domains to another clock domain.
3- the binary to gray is simple xor of the input, while the gray to binary is the xor between each input and previous result. much more delay. 