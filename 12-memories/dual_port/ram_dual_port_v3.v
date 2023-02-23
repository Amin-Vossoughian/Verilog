module ram_dual_port_v3
	(data_a_out, data_b_out, data_a_in, data_b_in; addr_a_in, addr_b_in,we_in_a,we_in_b, clk)

input [7:0] data_a_in;
input [7:0] data_b_in;
input [5:0] addr_a_in;
input [5:0] addr_b_in;
input we_in_a;
input we_in_b;
input clk;
output reg [7:0] data_a_out;
output reg [7:0] data_b_out;

reg [7:0] ram[63:0];

//port a
always@(posedge clk)
	if(we_in_a) begin
		ram[addr_a_in] <= data_a_in;
		data_a_out <= data_a_in; //bypass newdata to output
	end
	else
		data_a_out <= ram[addr_a_in]

//port b
always@(posedge clk)
	if(we_in_b) begin
	ram[addr_a_in] <= data_a_in;
	data_a_out <= data_a_in; //bypass newdata to output
	end
	else
		data_a_out <= ram[addr_a_in];
		
endmodule