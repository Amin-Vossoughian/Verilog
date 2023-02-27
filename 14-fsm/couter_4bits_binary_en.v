module couter_4bits_binary_en(count_out,clk, reset_al_in)

input clk, reset_al_in;
output [1:0] count_out;

reg [1:0] current_state, next_state;
parameter s0 = 0, s1 = 1, s2 = 2, s3= 3;


always@(posedge clk) begin
	if(reset_al_in)
		current_state <= s0;
	else
		current_state <= next_state;
end

/*next state logic*/
always@(current_state) begin
	case (current_state)
		s0: next_state <= s1;
		s1: next_state <= s2;
		s2: next_state <= s3; 
		s3: next_state <= s0;
		default: next_state <= s0;
	endcase
end

/*output logeic*/

always@(current_state) begin
	case (current_state)
		s0: count_out <= 2'b00;
		s1: count_out <= 2'b01;
		s2: count_out <= 2'b10;
		s3: count_out <= 2'b11;
		default: count_out <= 00;
	endcase	
end

endmodule