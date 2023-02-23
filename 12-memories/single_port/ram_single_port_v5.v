module ram_single_port_v5
		#(parameter DATA_WIDTH = 32,
		  parameter ADDR_WIDTH = 4,
		  parameter DEPTH = 16)(clk, addr, data, cs, we, oe);

input clk;
input [ADDR_WIDTH-1:0] addr;
input [DATA_WIDTH-1:0] data;
input cs;
input we;
input oe;

reg [DATA_WIDTH-1:0] temp_data;
reg [DATA_WIDTH-1:0] mem [DEPTH];

always@(posedge clk) begin
	if(cs & we)
		mem[addr] <= data;
end
always(posedge clk) begin
	if (cs & ~we)
		temp_data <= mem[addr];
end

assign data = cs & oe & ~wr ? temp_data: 'hz;

endmodule