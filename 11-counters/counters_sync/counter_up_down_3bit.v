module counter_up_down_3bit(d_in, load_in, up_down_in, clk, reset_in, q_out);

input [3:0] d_in;
input load_in;
input up_down_in;
input clk;
input reset_in;
output reg [2:0] q_out;

always@posedge clk, negedge reset_in)
begin
	if (~reset_in)
		q_out <= 3'b000;
		
		else if(load_in)
		q_out<=d_in;
		else begin
		if (up_down_in) 
			q_out <= q_out + 1'b1;
		else
			q_out <= q_out - 1'b1;
		end
end 
endmodule 