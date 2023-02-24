module logic_unit_tb;

parameter data_size = 8; 
parameter op_code_size = 2;

reg [data_size-1:0] a_in;
reg [data_size-1:0] b_in;
reg [op_code_size-1:0] op_code;

wire [data_size-1:0] result_out;

logic_unit_d1 UUT(.a_in(a_in), .b_in(b_in), .op_code(op_code), .result_out(result_out));

initial 
$monitor("time=%d op_code=%b\t a_in=%b\t b_in=%b\t  result_out=%b\t", $time,op_code, a_in, b_in, result_out);


initial begin

	{a_in,b_in,op_code} =0;
	#20;

	repeat (4) begin
		repeat (255) begin
			a_in = a_in+1;
			repeat (255) begin
				b_in = b_in+1;
				#25;
			end
		end
		op_code= op_code +1;
	end
end

endmodule
			

