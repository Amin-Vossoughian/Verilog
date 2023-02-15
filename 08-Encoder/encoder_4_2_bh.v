module encoder_4_2_bh(d_out, d_in, invalid_data);

input [3:0] d_in;
output reg invalid_input;
output reg [2:0] d_out;


always@ *  begin

case (d_in) 
	4'b0001 : {invalid_data,d_out} = 3'b000;
	4'b0010 : {invalid_data,d_out} = 3'b001;
	4'b0100 : {invalid_data,d_out} = 3'b010;
	4'b1000 : {invalid_data,d_out} = 3'b011;
	default : {invalid_data,d_out} = 3'b100;
endcase
end
endmodule
