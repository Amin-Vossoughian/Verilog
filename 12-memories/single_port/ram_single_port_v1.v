/*
	it is possible to read and write simultaniously in the case of similar
	read & write the process will go on without any problem given that we
	have used non blocking assignment. The data_out is practically a 
	register that buffer it befor send it to the bus.
*/
module ram_single_port_v1(data_out,data_in, read_addr, write_addr, we_in, clk);

input [7:0] data_in;
input [5:0] read_addr,write_addr;
input we_in;
input clk;

output reg [7:0] data_out;

reg [7:0] ram[63:0];

always @(posedge clk) begin
	if (we_in) begin
		ram[write_addr] <= data_in;
	end
	
	data_out <= ram[read_addr];
end
endmodule
