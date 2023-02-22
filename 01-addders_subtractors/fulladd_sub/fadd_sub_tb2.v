module fadd_sub_tb;

reg [3:0] a_out, b_out;
reg control_out;
wire [3:0] sum_in;
wire carry_in;

fadd_sub_bh   DUT(.a_in(a_out), .b_in(b_out), .control_in(control_out), .sum_out(sum_in), .carry_out(carry_in));

initial
$monitor ("time:%d \t, a_in=%d \t b_in=%d \t, control_in=%b \t, sum_out=%d \t, carry_out=%b", $time, a_out, b_out, control_out, sum_in, carry_in);


initial begin 
	a_out= 0;
	b_out = 0;
	control_out = 0;
	repeat (16) begin
		#10 a=a+1;
		repeat (16) begin
			#10 b= b+1;
			repeat (2)
				#10 control_in=~control_in;
			end
		end
	end
endmodule
		