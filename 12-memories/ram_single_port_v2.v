/*
The only difference with previous one is use of blocking statement. it this case if 
both address are the same , we will fetch the fresh written data. This is due to the fact
that in blocking statement the next statement will not execute unless previous one 
already executed. Therefore, new data will be written and then read again.
*/

module ram_single_port(data_out, data_in, read_addr, write_addr, we, clk);

input [7:0] data_in;
input [5:0] read_addr,write_addr;
input we_in;
input clk;
output reg [7:0] data_out;

reg [7:0] ram[63:0];

always @(posedge clk) begin
	if (we)begin
		ram[write_addr] = data;
	end
	data_out = ram[read_addr];
end
endmodule