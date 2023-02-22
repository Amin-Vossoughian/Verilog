module counter_up_down_3bit(d_in, load_in, up_down_in, clk, reset_in, count_out);

input [3:0] d_in;
input load_in;
input up_down_in;
input clk;
input reset_in;
output reg [2:0] count_out;

always@posedge clk, negedge reset_in)
begin
	if (~reset_in)
		count_out <= 3'b000;
		
		else if(load_in)
		count_out<=d_in;
		else begin
		if (up_down_in) 
			count_out <= count_out + 1'b1;
		else
			count_out <= count_out - 1'b1;
		end
end 
endmodule 