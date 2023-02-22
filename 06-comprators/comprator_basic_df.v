module comprator_basic_df#(parameter N=64)(eq_out,gt_out,sm_out,a_in,b_in);

input [N-1:0] a_in,b_in;
output eq_out,gt_out,sm_out;

assign eq_out = (a_in == b_in);
assign gt_out = (a_in > b_in);
assign sm_out = ~(a_in | b_in);
//assign sm_out (a_in < b_in);

endmodule
