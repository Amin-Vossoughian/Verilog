module ram_dual_port_v1(data_out, data_in, read_addr, write_addr, we, read_clk, write_clk);

input [7:0] data_in;
input [5:0] read_addr, write_addr;
input we;
input read_clk;
input write_clk;

reg [7:0] ram [63:0];
reg [5:0] reg_read_addr;

always@(posedge write_clk)
	if(we)
		ram[write_addr] <= data;

always@ (posedge read_clk) begin
	data_out <= ram[reg_read_addr];
	reg_read_addr <= read_addr;
end 
endmodule