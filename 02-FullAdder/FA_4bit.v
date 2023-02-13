module FA_4bit (input [3:0] a_in, b_in, input carry_in,output [3:0] sum_out, output carry_out);

assign {carry_out, sum_out} = a_in + b_in + carry_in;

endmodule