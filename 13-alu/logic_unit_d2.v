/* in this design the opcode, inputs and output are registerd, so the datapath is very clean 
and free of gliches and hazards given that all data will work with the positive edge of 
the clock. this lead to improvement in performance.
*/
 
module logic_unit_d1#(parameter data_size = 8, parameter op_code_size = 2)
					(clk,reset_al_in,result_out,a_in, b_in, op_code);

input clk;
input reset_al_in;
input [data_size-1:0] a_in;
input [data_size-1:0] b_in;
input [op_code_size-1:0] op_code;
output reg [data_size-1:0] result_out;

reg [data_size-1:0] reg_a_in;
reg [data_size-1:0] reg_b_in;
reg [op_code_size-1:0] reg_op_code;
reg [data_size-1:0] reg_result_out;

always@(posedge clk) begin
	if (~reset_al_in)
		{reg_a_in,reg_b_in,reg_op_code} <= 0;
	else begin
		reg_a_in <= a_in;
		reg_b_in <= b_in;
		reg_op_code <= op_code;
	end
end

always@(reg_a_in,reg_b_in,reg_op_code) begin
	
	case (reg_op_code)
		2'b00: reg_result_out = reg_a_in | reg_b_in;
		2'b01: reg_result_out = reg_a_in ^ reg_b_in;
		2'b10: reg_result_out = reg_a_in & reg_b_in;
		2'b11: reg_result_out = ~reg_a_in;
	endcase
end

always@(posedge clk)
	if (~reset_al_in)
		result_out <= 0;
	else 
		result_out <= reg_result_out;
endmodule