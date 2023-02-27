/* this is exactly the book design, but it generate two latch at the output
which is not desireable at all. try it with modelsim. in case of latch presence,
try to optimize and findout why!!!
*/

module alu_not_optimized#(parameter data_size = 8, parameter op_code_size =4)
						(a_in, b_in, cin_in, op_code_in, result_out, co_out);

input [data_size-1:0] a_in;
input [data_size-1:0] b_in;
input cin_in;
input [op_code_size-1:0] op_code_in;

output reg [data_size-1:0] result_out;
output reg co_out;

always@(*) begin
	if (~op_code_in[3]) begin
		case (op_code_in[2:0])
			3'b000: {co_out,result_out} <= {1'b0,a_in};
			3'b001: {co_out,result_out} <= a_in + b_in; 
			3'b010: {co_out,result_out} <= a_in + b_in + cin_in;
			3'b011: {co_out,result_out} <= a_in - b_in;
			3'b100: {co_out,result_out} <= a_in - b_in - cin_in; 
			3'b101: {co_out,result_out} <= a_in +1'b1;
			3'b110: {co_out,result_out} <= a_in -1'b1;
			default: {co_out,result_out} <= 9'b0_0000_0000;
		endcase
	end
	else begin
		case (op_code_in[2:0])
			3'b000: {co_out,result_out} = {1'b0,(a_in | b_in)};
			3'b001: {co_out,result_out} = {1'b0,(a_in ^ b_in)};
			3'b010: {co_out,result_out} = {1'b0,(a_in & b_in)};
			3'b011: {co_out,result_out} = {1'b0,(~a_in)};
			default: {co_out,result_out} <= 9'b0_0000_0000;
		endcase
	end 
end
endmodule