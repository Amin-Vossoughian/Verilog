
/* data flow */
module Half_Adder(s,c,a,b);
input a,b;
output s,c;

assign s=a^b;  // assign statement are concurrent, thus the order does not matter
assign c=a&b;

endmodule

/* behavioural  */

module Half_adder(s,c,a,b);
input a,b;
output  reg s,c;  
/*it does not mean that s and c are registers, here it means they keep the value
that was computed by the statement. in verilog everything is wire until we define different 
data type for it. for instance a and b are wire. 
*/
/* with behavioral code we haev to use always key word. */
always @(a,b) //sensitivity list
   begin
   s=a^b;
   c=a^b;
   end
endmodule


/* structural */
//in real life we never use structural to write basic blocks but to put block together.
// we assume the basic blocks are available which are in reality.
// recall that verilog is case sensitive language
module HA_st(s,c,a,b);
input a,b;
output s,c;

/* while the input output order is not mandatory in module, on primitive block output is
always first*/
xor xor1(s,a,b);  
and and1(c,a,b);

endmodule;
