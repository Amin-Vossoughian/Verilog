module siso_nbit #(parameter N=4) (d_in, q_out, clk, reset_al_in);

input  clk;
input  reset_al_in;
input  d_in;
output q_out;
reg  [N-1:0] temp_regs;
integer i;


always@(posedge clk) begin
	if (~reset_al_in) 
		temp_regs <= 0;
	else begin
		/*for (i=1; i < N; i=i+1) begin
			q_out[1] <= q_out[2];

		//end*/
	temp_regs <= temp_regs >> 1;
	temp_regs[3] <= d_in;
	end
end
assign q_out=temp_regs[0];
endmodule
/*
module siso_nbit #(parameter N=4)(clk,clear,si,so);

input clk,si,clear;

output so;

reg so;

reg [3:0] tmp;

always @(posedge clk )

begin

if (clear)

tmp <= 4’b0000;

else

tmp <= tmp << 1;

tmp[0] <= si;

so = tmp[3];

end

endmodule
*/
