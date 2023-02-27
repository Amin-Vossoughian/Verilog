module arithmetic_unit_resource_sharign#(parameter data_size =8, parameter op_code_size =3)
						(carry_out, result_out, a_in, b_in, carry_in, op_code);

input [data_size-1:0] a_in,b_in;
input [op_code_size-1:0] op_code;
input carry_in;

output reg[data_size-1: 0] result_out;
output reg carry_out;

reg [data_size-1: 0] temp_b_in;
reg temp_carry_in;

always@* begin
	{carry_out,result_out} = a_in + temp_b_in + temp_carry_in;
end

always@(*) begin

	case (op_code)
		3'b000: {temp_carry_in, temp_b_in} <= {9'b0_0000_0000};
		3'b001: {temp_carry_in, temp_b_in} <= {1'b0,b_in}; 
		3'b010: {temp_carry_in, temp_b_in} <= {carry_in,b_in};
		3'b011: {temp_carry_in, temp_b_in} <= {1'b1,~b_in};
		3'b100: {temp_carry_in, temp_b_in} <= {1'b1,~b_in}; 
		3'b101: {temp_carry_in, temp_b_in} <= {9'b1_0000_0000};
		3'b110: {temp_carry_in, temp_b_in} <= {1'b0,8'b1111_1111}; //b'0000_0001 =1 two complement
		default: {temp_carry_in, temp_b_in} <= 9'b0_0000_0000;
	endcase
end
endmodule