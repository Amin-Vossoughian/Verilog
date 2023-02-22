/* The following design is the 4 input mux build base on the 2 input muxex. this is the behavioural
description. it is possible to do it in structural.
*/

module mux_4_1_bh_2i_1o (y_out, d_in, sel_in);

input [3:0] d_in;
input [1:0] sel_in;
output y_out;

reg temp_1 , temp_2;

always@*
begin
	case (sel_in[0])
		1'b0 : begin
			temp_1=d_in[0];
			temp_2=d_in[2];
		end
		1'b1 : begin
			temp_1=d_in[1];
			temp_2=d_in[3];
		end
	endcase
end 

assign y_out = (sel_in[1]) ? temp_2 : temp_1;

endmodule 
