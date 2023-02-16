/* given that we do not have else, the synthsizer will consider a latch. 
thus in the period that the latch is not transparent , previous data is provided
*/

module d_latch_pls(q_out,en_in,d_in);

input d_in;
input en_in;
output reg q_out;

always@* begin

if (en_in)  q_out <= d_in;

end
endmodule