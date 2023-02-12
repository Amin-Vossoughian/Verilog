module HA_df_1bit(s_out,c_out,a_in,b_in);
input a_in, b_in;
output s_out, c_out;

assign s_out = a_in ^ b_in;
assign c_out = a_in & b_in;

endmodule




module HA_bh_1bit(s_out,c_out,a_in,b_in);
input a_in, b_in;
output reg s_out, c_out;

always@(*)
begin
	s_out = a_in ^ b_in;
        c_out = a_in & b_in;
end
endmodule
