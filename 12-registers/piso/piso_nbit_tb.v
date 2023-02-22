module piso_nbit_tb;

parameter N=4;

reg clk;
reg reset_al_in;
reg en_in;
reg [N-1:0] d_in;
wire q_out;

piso_nbit  UUT(.clk(clk), .reset_al_in(reset_al_in), .en_in(en_in), .d_in(d_in), .q_out(q_out));

always #10 clk = ~clk;

initial
$monitor ("time:%d  reset_al_in=%b\t en_in=%b\t clk=%b\t d_in=%b\t q_out=%b", $time, reset_al_in, en_in,clk,d_in, q_out);

initial #500 $stop;

initial begin
	clk = 1'b0;
	reset_al_in = 1'b0;
	en_in= 1'b0;
	d_in = 0;
	
	#25
	reset_al_in = 1'b1;
	
	#25
	en_in= 1'b1;
	d_in=11;
	
	#30 
	en_in= 1'b0;
	
	#200
	
	en_in= 1'b1;
	d_in=13;
	
	#30 
	en_in= 1'b0;
	
end
endmodule
