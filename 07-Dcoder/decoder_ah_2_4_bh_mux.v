module decoder_ah_2_4_bh_mux(y_out, sel_in, en_in);

input [1:0] sel_in;
input en_in;

output reg[3:0] y_out;

always@* begin

if (en_in) 
	case(sel_in) 
	2'b00 : y_out = 4'b0001;
	2'b01 : y_out = 4'b0010;
	2'b10 : y_out = 4'b0100;
	2'b11 : y_out = 4'b1000;
	endcase
else y_out = 4'b0000;

end
endmodule
