module counter_gray_tb;

parameter N = 2;

reg clk;
reg reset_al_in;
wire count_out [N-1:0];

always #10 clk = ~clk;


initial 
$monitor ("time:%d reset_al_in=%b\t count_out=%d", $time, reset_al_in,count_out);

initial 
begin 

reset_al_in = 1'b0; 

#20 reset_al_in = 1'b1;  


#300 $stop;

end 
end module