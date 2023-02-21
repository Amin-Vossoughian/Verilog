module register_nbit;
parameter DUT_select = 0;
parameter N = 16;

reg clk;
reg reset_al_in;
reg [N-1:0] d_in;
wire [N-1:0] q_out;

/*instantiation of pipo*/
if ( DUT_select == 1) 
pipo_nbit  DUT(.clk(clk), .reset_al_in(reset_al_in), .d_in(d_in), .q_out(q_out));

initial 
$monotor ("time:%d reset_al_in=%b\t clk=%b\t d_in=%b\t  q_out=%b\t", reset_al_in, clk, d_in, q_out);

always #10 clk = ~clk;

initial begin

reset_al_in=1'b1;
clk= 1'b0;

#50 reset_al_in=1b'0;


#300 $stop;
end 
endmodule 