module arithmatic_uint#(parameter data_size =8, parameter op_code_size =3)
						(carry_out, result_out, a_in, b_in, carry_in, op_code);

input [data_size-1:0] a_in,b_in;
input [op_code_size-1:0] op_code;
input carry_in;

output reg[data_size-1: 0] result_out;
output reg carry_out;

always@(*) begin

	case (op_code)
		3'b000: {carry_out,result_out} <= {1'b0,a_in};
		3'b001: {carry_out,result_out} <= a_in + b_in; 
		3'b010: {carry_out,result_out} <= a_in + b_in + carry_in;
		3'b011: {carry_out,result_out} <= a_in - b_in;
		3'b100: {carry_out,result_out} <= a_in - b_in - carry_in; 
		3'b101: {carry_out,result_out} <= a_in +1'b1;
		3'b110: {carry_out,result_out} <= a_in -1'b1;
		default: {carry_out,result_out} <= 9'b0_0000_0000;
	endcase
end
endmodule

/* this is not optimization, the number of resource remain the same. even if we trun it to 
the tree of muxex, which is the next design. in order to improve desing, we have to consider 
and adder, the feed it with differnt input. the idea concieved from the third
desing in which we could seperate operation in two group, addition and subtraction. 
*/
/*
module arithmatic_uint#(parameter data_size =8, parameter op_code_size =3)
						(carry_out, result_out, a_in, b_in, carry_in, op_code);

input [data_size-1:0] a_in,b_in;
input [op_code_size-1:0] op_code;
input carry_in;

output reg[data_size-1: 0] result_out;
output reg carry_out;
reg temp_increment;
reg temp_sub;
reg temp_sum;

always@* begin
	temp_increment = a_in +1;
	temp_sub = temp_increment + ~b_in;
	temp_sum = a_in + b_in;
end


always@(*) begin
	
	case (op_code)
		3'b000: {carry_out,result_out} = {1'b0,a_in};
		3'b001: {carry_out,result_out} = temp_sum; 
		3'b010: {carry_out,result_out} = temp_sum + carry_in;
		3'b011: {carry_out,result_out} = temp_sub;
		3'b100: {carry_out,result_out} = temp_sub - carry_in; 
		3'b101: {carry_out,result_out} = temp_increment;
		3'b110: {carry_out,result_out} = a_in -1'b1;
		default: {carry_out,result_out} = 9'b0_0000_0000;
	endcase
end
endmodule


module arithmatic_uint#(parameter data_size =8, parameter op_code_size =3)
						(carry_out, result_out, a_in, b_in, carry_in, op_code);

input [data_size-1:0] a_in,b_in;
input [op_code_size-1:0] op_code;
input carry_in;

output reg[data_size-1: 0] result_out;
output reg carry_out;
reg [data_size-1: 0] temp_increment;
reg [data_size-1: 0] temp_sub;
reg [data_size-1: 0] temp_sum;

always@* begin
	temp_increment = a_in +1;
	temp_sub = temp_increment + ~b_in;
	temp_sum = a_in + b_in;
end


always@(*) begin
    if (~op_code[2])
	   case (op_code[1:0])
		  2'b000: {carry_out,result_out} = {1'b0,a_in};
		  2'b001: {carry_out,result_out} = temp_sum; 
		  2'b010: {carry_out,result_out} = temp_sum + carry_in;
		  2'b011: {carry_out,result_out} = temp_sub;
		  default: {carry_out,result_out} = 9'b0_0000_0000;
	   endcase
	else
	   case (op_code[1:0])
	       2'b00: {carry_out,result_out} = temp_sub - carry_in; 
	       2'b01: {carry_out,result_out} = temp_increment;
	       2'b10: {carry_out,result_out} = a_in -1'b1;
	       default: {carry_out,result_out} = 9'b0_0000_0000;
	       endcase
end
endmodule

*/