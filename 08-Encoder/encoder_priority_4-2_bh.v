module encoder_priority_4_2_bh(d_in, d_out, invalid_input);

input [3:0] d_in;
output reg invalid_input;
output reg [1:0] d_out;

always@* begin 
if (d_in[3] == 1)  {invalid_input,d_out} = 3'b011;
else if (d_in[2] == 1)  {invalid_input,d_out} = 3'b010;
else if (d_in[1] == 1)  {invalid_input,d_out} = 3'b001;
else if (d_in[0] == 1)  {invalid_input,d_out} = 3'b000;
else {invalid_input,d_out} = 3'b100; 

end

endmodule