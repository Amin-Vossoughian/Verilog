module encoder_4_2_bh(d_out, d_in, invalid_input);

input [3:0] d_in;
output reg invalid_input;
output reg [1:0] d_out;


always@ *  begin

case (d_in) 
	4'b0001 : {invalid_input,d_out} = 3'b000;
	4'b0010 : {invalid_input,d_out} = 3'b001;
	4'b0100 : {invalid_input,d_out} = 3'b010;
	4'b1000 : {invalid_input,d_out} = 3'b011;
	default : {invalid_input,d_out} = 3'b100;
endcase
end
endmodule
