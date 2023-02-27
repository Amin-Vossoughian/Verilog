/* mealy maching sequence detecotr - non overlapping 1010*/

module sequence_mealy_nv_1010(detect_out, data_in, clk, reset_ah_in);

input clk;
input reset_ah_in;
input data_in;
output reg detect_out;

parameter s=0, s=1, s=2, s=3;

reg [1:0] current_state, next_state;

always@(posedge clk)
	if(~reset_ah_in)
		current_state <= s0;
	else
		current_state <= next_state;

/*next_state logec*/

always@(data_in, current_state) begin
	case(current_state)
		s0:  data_in ? (next_state = s1) : (next_state = s0);
		s1: ~data_in ? (next_state = s2) : (next_state = s1);
		s2:  data_in ? (next_state = s3) : (next_state = s0);
		s3:  next_state = s0;
		default: next_state = s0;
	endcase
end

/*output logic*/
always@(data_in, current_state) begin
	case(current_state)
		s0:	detect_out = 0;
		s1:	detect_out = 0;
		s2:	detect_out = 0;
		s3:	~data_in ? (detect_out = 1) : (detect_out = 0);
		default: detect = 0;
	endcase
end
endmodule