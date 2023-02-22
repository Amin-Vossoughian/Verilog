module barrel_shifter(d_out, d_in, left_right, shift_num_bits);

input [N-1:0] d_in;
input [2:0];  // have to be computed by log, better implementation in systemverilo
input left_right;
output reg [7:0] d_out;

always@(*)
	if (left_right)
		d_out = d_in << shift_num_bits;
	else 
		d_out = d_in >> shift_num_bits;	
endmodule