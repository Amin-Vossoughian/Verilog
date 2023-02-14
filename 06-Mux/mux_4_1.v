/*use case endcase to code parallel logic like muxes, if else is the priority instruction 
which will lead to cascade of muxes that the frst input (first if) has the highest priority and 
overwrite other in case its select is chosed. */


module mux_4_1(y_out, d_in, sel_in);

input  [3:0] d_in;
input  [1:0] sel_in;
output [3:0] y_out;

always@*
begin 
	case(sel_in)
	2'b00 : y_out=d_in[0];
	2'b01 : y_out=d_in[1];
	2'b10 : y_out=d_in[2];
	2'b11 : y_out=d_in[3];
	end case
end
endmodule


