/* Notice it the process of the active low design with shift, we have to consider that shift means the zero
will be replace, thus the logic disign is different with when we simply design it with case constructs. 
it is very interesting process and enjoy designing it.
*/

module decoder_al_4_16_bh(y_out,sel_in, en_in);

input [3:0] sel_in;
input en_in;
output [15:0] y_out;

reg [3:0] temp_en_in;


assign y_out[3:0]   = (~temp_en_in[0]) ? 4'b0000 : (4'b0001 << sel_in[1:0]);
assign y_out[7:4]   = (~temp_en_in[1]) ? 4'b0000 : (4'b0001 << sel_in[1:0]);
assign y_out[11:8]  = (~temp_en_in[2]) ? 4'b0000 : (4'b0001 << sel_in[1:0]);
assign y_out[15:12] = (~temp_en_in[3]) ? 4'b0000 : (4'b0001 << sel_in[1:0]);

always@*  
	if (~en_in)
		temp_en_in = ( 4'b0001 << sel_in[3:2]);
	else
                temp_en_in = 4'b0000;

endmodule
