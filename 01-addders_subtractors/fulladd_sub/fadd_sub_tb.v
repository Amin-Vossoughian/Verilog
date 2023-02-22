module fadd_sub_tb;

reg [3:0] a_out, b_out;
reg control_out;
wire [3:0] sum_in;
wire carry_in;

fadd_sub_bh   DUT(.a_in(a_out), .b_in(b_out), .control_in(control_out), .sum_out(sum_in), .carry_out(carry_in));

initial
begin

$monitor ("time:%d \t, a_in=%d \t b_in=%d \t, control_in=%b \t, sum_out=%d \t, carry_out=%b", $time, a_out, b_out, control_out, sum_in, carry_in);

control_out=1'b0; b_out=4'b0000; a_out=4'b0000;
#10 control_out=1'b0; b_out=4'b0001; a_out=4'b0001;
#10 control_out=1'b0; b_out=4'b0010; a_out=4'b0001;
#10 control_out=1'b0; b_out=4'b0100; a_out=4'b0001;
#10 control_out=1'b0; b_out=4'b1000; a_out=4'b0001;
#10 control_out=1'b0; b_out=4'b1100; a_out=4'b0011;
#10 control_out=1'b0; b_out=4'b1110; a_out=4'b0111;
#10 control_out=1'b1; b_out=4'b1111; a_out=4'b1111;
#10 control_out=1'b1; b_out=4'b0001; a_out=4'b0001;
#10 control_out=1'b1; b_out=4'b0010; a_out=4'b0001;
#10 control_out=1'b1; b_out=4'b0100; a_out=4'b0001;
#10 control_out=1'b1; b_out=4'b1000; a_out=4'b0001;
#10 control_out=1'b1; b_out=4'b1100; a_out=4'b0011;
#10 control_out=1'b1; b_out=4'b1110; a_out=4'b0111;
#10 control_out=1'b1; b_out=4'b1111; a_out=4'b1111;
#10 $stop;

end
endmodule
