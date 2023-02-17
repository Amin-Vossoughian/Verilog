/* given that we do not have else, the synthsizer will consider a latch. 
thus in the period that the latch is not transparent , previous data is provided
On the other hand, it is possible to write the else as provided below, and the synthesiser
accept and get the exact result as previous.
Just becareful it is not possible to have a lhv that is set for both blocking and non-blocking assignment. 
it does not matter we use non-blocking or blocking one in this case, synthesizer interpret the
code as latch and implement it.
*/

module d_latch_pls(q_out,en_in,d_in);

input d_in;
input en_in;
output reg q_out;

always@*

if (en_in)  q_out <= d_in;
//else q_out <= q_out;

endmodule
