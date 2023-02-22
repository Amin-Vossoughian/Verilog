/*
in this design we only have one address. the addr_in is registerd
in case we need to read the fresh data. 
in case we use the address before registering , the data will be the old data.
The timing procedure is as follow:
a delta cycle after positive edge of clock, the data will be written in ram, and 
the address is registerd. affter this point the data out data change to new address. therefore
we could say data out will be available after some time after positive clock and during 
this time data is not valid.
*/
module ram_single_port(data_out, data_in, addr_in, we, clk);

input [7:0] data_in;
input [5:0] addr_in;
input we_in;
input clk;
output reg [7:0] data_out;

reg [7:0] ram[63:0];
reg [5:0] reg_address;

always @(posedge clk) begin
	if (we)begin
		ram[addr_in] <= data;
	end
	reg_address <= addr_in;
end
assign data_out <= ram[reg_address];
endmodule