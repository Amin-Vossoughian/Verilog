module counter_tb;

//defining the size of counter =>N
parameter N=3;

reg [N-1:0] d_in;
reg clk;
reg reset_al_in;
reg load_in;
wire [N-1:0] count_out;


/*the integer select the module under test
MUT == 1 => up counter
MUT == 2 => down counter_tb
MUT == 3 => up_down counter_tb
*/
integer MUT = 1;

if (MUT == 1){
counter_up_3bit  DUT(.(d_in)d_in, .count_out(count_out), .load_in(load_in), .clk(clk), .reset_al_inl(reset_al_in));

else if (MUT == 2)
counter_up_3bit  DUT(.(d_in)d_in, .count_out(count_out), .load_in(load_in), .clk(clk), .reset_al_inl(reset_al_in));

always #10 clk = ~clk;

initial 
$monitor ("time:%d reset_al_in=%b\t load_in=%b\t d_in=%d\t count_out=%d", $time, reset_al_in,load_in,d_in,count_out);

begin 

reset_al_in=0; 

#10 reset_al_in=1'b1; load_in=1'b1; d_in= 0;

#20 load_in=1'b0;


if (MUT == 1)
#120 reset_al_in=1'b1; load_in=1'b1; d_in= 2;

else
#120 reset_al_in=1'b1; load_in=1'b1; d_in= 6;

#100 $stop;

end 

endmodule
