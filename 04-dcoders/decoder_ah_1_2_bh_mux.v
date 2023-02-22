module decoder_ah_1_2_bh_mux(sel_in, en_in, y_out);

input sel_in;
input en_in;
output reg [1:0] y_out;

always@* begin
if (en_in) 
	case(sel_in)
	1'b0: y_out=2'b01;
	1'b1: y_out=2'b10;
	endcase
else y_out = 2'b00;
end
endmodule
