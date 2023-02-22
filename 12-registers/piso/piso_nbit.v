/* In some books and online material it is designed with extra if condition, I s
synthsize both design, they are the same.*/

module piso_nbit#(parameter N=4)(q_out,d_in, clk, reset_al_in,en_in);

input clk;
input reset_al_in;
input en_in;
input [N-1:0] d_in;
output reg q_out;

reg [N-1:0] temp_reg;

always@(posedge clk, negedge reset_al_in)

	if (~reset_al_in) begin
	{temp_reg,q_out} <=0;
	end

	else if (en_in) begin
		{temp_reg,q_out} <= {d_in,1'b0};
	end
	
	else begin
		{temp_reg,q_out} <= {1'b0,temp_reg[N-1:0]};
	end

endmodule

/*
module piso_nbit#(parameter N=4)(q_out,d_in, clk, reset_al_in,en_in);

input clk;
input reset_al_in;
input en_in;
input [N-1:0] d_in;
output reg q_out;

reg [N-1:0] temp_reg;

always@(posedge clk, negedge reset_al_in)

	if (~reset_al_in) begin
	{temp_reg,q_out} <=0;
	end
	
	else begin
		if (en_in) begin
			{temp_reg,q_out} <= {d_in,1'b0};
		end
	
		else begin
		{temp_reg,q_out} <= {1'b0,temp_reg[N-1:0]};
		end
	end

endmodule
*/
