module d_ff_pet_asyn_al(d_in, clk, reset_al_in, q_out);

input d_in;
input clk;
input reset_al_in;
output reg q_out;

always@(posedge clk, negedge reset_al_in)
begin

if (~reset_al_in) q_out <= 1'b0;
else q_out <= d_in;

end
endmodule

/* Recall that in verilog when an input is in sensitivity list and not used in if 
or else condition, the verilog consider that it will holds its previous value, thus 
consider a latch for it. 
here we have first if that is for asynchronous reset. asfterwards we have else that here
means if reset is not negative, and  clock is positive d_in will be equal to q_out. the 
code is shown in the end of code.  
*/

/*
if (~reset_al_in) q_out <= 1'b0;
else begin
      if (clk) q_out <= d_in;
	end

the first if is consider as mux with two inputs. the second if is also will consider 
as mux that have latch after it due to the abscense of else condition. this is aysnchronous
due to the higher priority of the reset. 
These are just explanation to realize what is occuring in lower level, otherwise the 
compiler easily transform the code to latch design since the latch and flip flop in 
modern design is different from what we study in books as two consequtive latch.	
*/