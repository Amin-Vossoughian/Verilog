/* in case we define a variable for conditional execution outside always block, it have to be constant(parameter)
for instance in case of MUT, it cannot be of type integer otherwise it will get us error in line 23. but it 
is fine in line 43 since it is inside the procedural block, in this case the initial.
*/

module counter_binary_tb;

//defining the size of counter =>N
parameter N=8;

reg [N-1:0] d_in;
reg clk;
reg reset_al_in;
reg load_in;
wire [N-1:0] count_out;


/*the integer select the module under test
MUT == 1 => up counter
MUT == 2 => down counter
MUT == 3 => parameterize up counter
MUT == 4 => modulus up conter
else => down counte
*/

parameter MUT = 4;

if (MUT == 1)
counter_up_3bit DUT(.d_in(d_in), .count_out(count_out), .load_in(load_in), .clk(clk), .reset_al_in(reset_al_in));

else if ( MUT == 2)
counter_down_3bit  DUT(.d_in(d_in), .count_out(count_out), .load_in(load_in), .clk(clk), .reset_al_in(reset_al_in));

else if (MUT ==3)
counter_up_para DUT(.d_in(d_in), .count_out(count_out), .load_in(load_in), .clk(clk), .reset_al_in(reset_al_in));
 
else if (MUT == 4)
counter_up_modulus_3bit DUT(.d_in(d_in), .count_out(count_out), .load_in(load_in), .clk(clk), .reset_al_in(reset_al_in));

always #10 clk = ~clk;

initial begin 
$monitor ("time:%d reset_al_in=%b\t load_in=%b\t d_in=%d\t count_out=%d", $time, reset_al_in, load_in, d_in, count_out);

clk = 1'b0;
reset_al_in = 1'b0; 

#10 reset_al_in=1'b1; load_in=1'b1; d_in= 0;

#20 load_in=1'b0;


if (MUT == 1 | MUT ==3 | MUT == 4)begin  
#120 reset_al_in=1'b1; load_in=1'b1; d_in = 2;
end
 
else begin
 #120 reset_al_in=1'b1; load_in=1'b1; d_in= 6;
end

#20 load_in=1'b0;

if (MUT == 1 | MUT ==3)begin  
#120 reset_al_in=1'b1; load_in=1'b1; d_in = 15;
end
#20 load_in=1'b0;

#1000 $stop;

end 

endmodule
