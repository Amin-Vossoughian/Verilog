/*
in this design we have two ports, one capable of writing and the other reading. 
Each port has independent clock. Therefore the behaviour of reading a fresh written 
data is unpredictable and depend that the read clocl arrive before write or before write
delta cycle or after write delta cycle. 
Moreover, similar to single port we could register the address in order to make the 
read data deterministic. but it always will have one clock delay. the program is shown 
in version 2
the solution to both this problem is to have two bidirectional port, capable of reading and
writing, that is explained in version 3.
*/
module ram_dual_port_v1(data_out, data_in, read_addr, write_addr, we, read_clk, write_clk);

input [7:0] data_in;
input [5:0] read_addr, write_addr;
input we;
input read_clk;
input write_clk;

reg [7:0] ram [63:0];

always@(posedge write_clk)
	if(we)
		ram[write_addr] <= data;

always@ (posedge read_clk) 
	data_out <= ram[read_addr];
	
endmodule