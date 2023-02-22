/* becarefule about the order of execution in the non-blocking assignment too,
the one in between the stars will not work. the synthesis resutls is printed and
clearly shows the design is faulty. but I do not know why!!!, have to finish the book to read
about execution order in next chapter.*/

module siso_nbit_bh3 #(parameter N=4)(d_in, q_out, clk, reset_al_in);

input  clk;
input  reset_al_in;
input  d_in;
output q_out;

reg  [N-1:0] temp_regs;

always@(posedge clk, negedge reset_al_in) begin
	if (~reset_al_in) 
		temp_regs <= 0;
	else begin
	temp_regs <= (temp_regs >> 1);
	temp_regs[N-1] <= d_in;
        /*temp_regs <= (temp_regs >> 1);
	  temp_regs[N-1] <= d_in;*/
	end
end
assign q_out=temp_regs[0];
endmodule

