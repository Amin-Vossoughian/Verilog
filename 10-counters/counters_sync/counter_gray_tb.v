module counter_gray_tb;

parameter N = 8;

reg clk;
reg reset_al_in;
wire [N-1:0] count_out ;

counter_para_gray DUT(.clk(clk), .reset_al_in(reset_al_in), .count_out(count_out));

always #10 clk = ~clk;


initial 
$monitor ("time:%d reset_al_in=%b\t count_out=%b", $time, reset_al_in, count_out);

initial 
begin 
clk = 1'b0;
reset_al_in = 1'b0; 

#20 reset_al_in = 1'b1;  

#930 reset_al_in = 1'b0;

#30 reset_al_in = 1'b1; 

#1000 $stop;

end 
endmodule
