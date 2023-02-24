/*test the synthesis result in case of default
*/

module logic_unit_d1#(parameter data_size = 8, parameter op_code_size = 2)(result_out,a_in, b_in, op_code);

input [data_size-1:0] a_in;
input [data_size-1:0] b_in;
input [op_code_size-1:0] op_code;

output reg [data_size-1:0] result_out;

always@(a_in,b_in,op_code) begin
	
	case (op_code)
		2'b00: result_out = a_in | b_in;
		2'b01: result_out = a_in ^ b_in;
		2'b10: result_out = a_in & b_in;
		2'b11: result_out = ~a_in;
	endcase

end
endmodule