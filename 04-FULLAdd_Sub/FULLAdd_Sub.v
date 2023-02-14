module FAdd_sub(input [3:0] a_in, b_in, input control_in, output [3:0] sum_out ,output  carry_out);

reg [4:0] temp_result;

assign {carry_out, sum_out} = a_in + temp_result;

always@ * 
 
  if (~control_in)  temp_result = b_in + control_in; 
  else  temp_result = (~b_in) + control_in;

endmodule

/* In the following desing we even go further and put the else just to select between not b and b. thus 
the mux inplementation is moved in earlier stage given that in previous design it was afert addition. 
This could be better solutino from some design perspective but not that much different form previous one.
*/

module FAdd_sub2(input [3:0] a_in, b_in, input control_in, output [3:0] sum_out ,output  carry_out);

reg [4:0] temp_result;

assign {carry_out, sum_out} = a_in + temp_result + control_in;

always@ * 
 
  if (~control_in)  temp_result = b_in;
  else              temp_result = ~b_in ;

endmodule

