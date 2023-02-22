module decoder_ah_1_2_bh_shift(sel_in, en_in, y_out);

input sel_in;
input en_in;
output reg [1:0] y_out;

always@* begin
if (en_in) y_out=(2'b01 << sel_in);
else       y_out = 2'b00;
end
endmodule
