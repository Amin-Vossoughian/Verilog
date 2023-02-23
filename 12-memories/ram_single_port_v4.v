/* this is the same as the first version, the only difference is we are geistering
read address instead of directly writing it. this lead to reading fresh data while 
in first version we are reading old data. the same as version two.
*/

module ram_single_port_v4(data_out, data_in, read_addr, write_addr, we, clk);

input [7:0] data_in;
input [5:0] read_addr,write_addr;
input we_in;
input clk;
output reg [7:0] data_out;

reg [5:0] reg_address;
reg [7:0] ram[63:0];

always @(posedge clk) begin
	if (we)begin
		ram[write_addr] <= data;
	end
	reg_address <= read_addr;
end
assign data_out <= ram[reg_address];
endmodule