module HA_df_1bit(output s_out,output c_out,input a_in,input b_in);
//input a_in, b_in;
//output s_out, c_out;

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



module HA_bh2_1bit(s_out,c_out,a_in,b_in);
input a_in, b_in;
output reg s_out, c_out;

always@(*)
begin
    if ((a_in == 1 && b_in == 1) || (a_in ==0 && b_in == 0))
       s_out=0;
    else s_out =1;
end 

always@(*)
begin 
     
    if ((a_in == 1) && (b_in == 1))
        c_out = 1;
    else c_out = 0;
end 
endmodule
