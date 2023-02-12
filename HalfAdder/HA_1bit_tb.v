//'timescale 1ns/100ps'
module HA_df_1bit_tb;

wire s_out, c_out;
reg a_in,b_in;

HA_df_1bit  instance_1(.s_out(s_out), .c_out(c_out), .a_in(a_in), .b_in(b_in));

initial 
	begin
	$monitor ("time=%d; a=%b,\t b=%b,\t c_out=%b,\t s_out=%b", $time, a_in,b_in,c_out,s_out);
	a_in = 0; b_in =0;
	#10 a_in =1;
	#10 b_in =1;
	#10 a_in =0;
	#10 $stop;
	end
endmodule  

