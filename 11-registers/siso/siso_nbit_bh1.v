module  siso_nbit_bh1 #(parameter N=4)(clk, reset_al_in, d_in, q_out);
input clk;
input reset_al_in;
input d_in;
output reg q_out;

integer i;
reg [N-2:0] temp_out;

always@(posedge clk) begin

	if(~ reset_al_in)
			{temp_out,q_out} <= 0;
	else begin
		q_out <= temp_out[0];
		temp_out <= {d_in,temp_out[N-2:1]};		
	end
end 
endmodule
