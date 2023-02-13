module FAdd_sub(input [3:0] a_in, b_in, input control_in, output [3:0] sum_out , carry_out);

reg [4:0] temp_result;

assign {carry_out, sum_out} = a_in + temp_result;

always@ * 
  begin 
  if (~control_in){
  temp_result = b_in + control_in; 
  } else {
  temp_result = ~b_in + control_in;
  }
  end
endmodule

module FAdd_sub_tb;

reg [3:0] a_in, b_in;
reg control_in;
wire [3:0] sum_out, carry_out;

FAdd_sub   DUT(.a_in(a_in), .b_in(b_in), .control_in(control_in), .sum_out(sum_out), .carry_out(carry_out));

always@ *
initial

$monitor ("time:%d , a_in=%b\tb_in=%b\tcontrol_in=%b\t,sum_out=%b\t,carry_out=%b\t", a_in, b_in, control_in, sum_out, carry_out);
control_in=1b0; b_in=4b0000; a_in=4b0000;
#10 control_in=1b0; b_in=4b0001; a_in=4b0001;
#10 control_in=1b0; b_in=4b0010; a_in=4b0001;
#10 control_in=1b0; b_in=4b0100; a_in=4b0001;
#10 control_in=1b0; b_in=4b1000; a_in=4b0001;
#10 control_in=1b0; b_in=4b1100; a_in=4b0011;
#10 control_in=1b0; b_in=4b1110; a_in=4b0111;
#10 control_in=1b1; b_in=4b1111; a_in=4b1111;
#10 control_in=1b1; b_in=4b0001; a_in=4b0001;
#10 control_in=1b1; b_in=4b0010; a_in=4b0001;
#10 control_in=1b1; b_in=4b0100; a_in=4b0001;
#10 control_in=1b1; b_in=4b1000; a_in=4b0001;
#10 control_in=1b1; b_in=4b1100; a_in=4b0011;
#10 control_in=1b1; b_in=4b1110; a_in=4b0111;
#10 control_in=1b1; b_in=4b1111; a_in=4b1111;
# $stop;

end
endmodule