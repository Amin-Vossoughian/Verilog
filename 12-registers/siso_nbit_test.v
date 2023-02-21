module  siso_nbit_test #(parameter N=4)(clk, reset_al_in, d_in, q_out);
input clk;
input reset_al_in;
input d_in;
output reg q_out;

reg [N-2:0] temp_out;

always@(posedge clk, negedge  reset_al_in) begin

	if(~ reset_al_in)
			{q_out,temp_out} <= 0;
	else 
		begin
		temp_out[0] <= d_in;
		temp_out[1] <= temp_out[0];
		temp_out[2] <= temp_out[1];
		q_out       <= temp_out[2];
		end
end 
endmodule