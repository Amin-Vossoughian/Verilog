module FAdd_sub(input [3:0] a_in, b_in, input control_in, output [3:0] sum_out ,output  carry_out);

reg [4:0] temp_result;

assign {carry_out, sum_out} = a_in + temp_result;

always@ * 
 
  if (~control_in)  temp_result = b_in + control_in; 
  else  temp_result = (~b_in) + control_in;

endmodule
