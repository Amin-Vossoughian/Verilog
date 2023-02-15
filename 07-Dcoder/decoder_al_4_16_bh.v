module decoder_al_4_16_bh(y_out,sel_in, en_in);

input [4:0] sel_in;
input en_in;
output [15:0] y_out;

reg [3:0] temp_en_in;

always@*  
	if (~en_in)
		temp_en_in = ( 4'b0001 << sel_in[3:2]);
	else
		temp_en_in = 4'b0000;

assign y_out[3:0]   = (~temp_en_in[0]) ? (4'b0001 << sel_in[1:0])
assign y_out[7:4]   = (~temp_en_in[1]) ? (4'b0001 << sel_in[1:0])
assign y_out[11:8]  = (~temp_en_in[2]) ? (4'b0001 << sel_in[1:0])
assign y_out[15:12] = (~temp_en_in[3]) ? (4'b0001 << sel_in[1:0])

endmodule