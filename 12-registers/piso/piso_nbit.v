module piso_nbit#(parameter N=4)(q_out,d_in, clk, reset_al_in,en_in);

input clk;
input reset_al_in;
input en_in;
input [N-1:0] d_in;
output q_out;

reg [N-1:0] temp_reg;

always@(posedge clk, negedge reset_al_in)

	if (~reset_al_in) begin
	q_out <=0;
	temp_reg <=0;
	end

	else if (en_in) begin
	temp_reg <= d_in;
	end
	
	else begin
	{temp_reg,q_out} <= {1b'0,temp_reg[N-2:0]};
	end
	
assign q_out=temp_reg[0];

endmodule