module decoder_ah_2_4_bh_shift(y_out, sel_in, en_in);

input [1:0] sel_in;
input en_in;

output reg y_out[3:0];

always@* begin

if (en_in)  y_out = (4'b0001 << sel_in);
else        y_out = 4'b0000;

end
endmodule