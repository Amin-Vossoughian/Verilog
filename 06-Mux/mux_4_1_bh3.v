/*the following implemetation is similar to else if with the difference that the first mux in priority
tree, the organization is differnet. the d_in[0] , d_in[3] and then the two other that have the same
priority
*/

module mux_4_1_bh2(y_out, d_in, sel_in);

input  [3:0] d_in;
input  [1:0] sel_in;
output y_out;

assign y_out = ~|sel_in ? d_in[0] : (&sel_in ? d_in[3] : (sel_in[0] ? d_in[1] : d_in[2])));

endmodule

