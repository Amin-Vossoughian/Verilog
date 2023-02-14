module mux_4_1_bh2(y_out, d_in, sel_in);

input  [3:0] d_in;
input  [1:0] sel_in;
output reg y_out;

assign y_out=d_in[sel_in];

endmodule

