/*the following implementation is exactly similar to implement the desing with if else. it is 
just written with different syntax that have the same fucntionality and description.
the difference is that the if else have to be written in procedural blocks , while this
one simply with concurrent assignment. 
*/

module mux_4_1_bh4(y_out, d_in, sel_in);

input  [3:0] d_in;
input  [1:0] sel_in;
output y_out;

assign y_out = (sel_in== 2'd0) ? d_in[0] : ( (sel_in==2'd1) ? d_in[1] : ((sel_in == 2'd2) ? d_in[2] : d_in[3]));

endmodule

