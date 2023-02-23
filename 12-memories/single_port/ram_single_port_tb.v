module ram_single_port_tb;

parameter ADDRESS_WIDTH= 63 ;
parameter DATA_WIDTH= 7 ;


reg [7:0] data_in;
reg [5:0] read_addr,write_addr;
reg we_in;
reg clk;
wire [7:0] data_out;

/*****TB-variables********/
parameter ram_under_test = 4;
integer i;
/**************************/

if (ram_under_test == 1)
ram_single_port_v1  UUT(.data_in(data_in),
						.read_addr(read_addr),
						.write_addr(write_addr),
						.we_in(we_in),
						.clk(clk),
						.data_out(data_out));
else if (ram_under_test == 2)
ram_single_port_v2	UUT(.data_in(data_in),
						.read_addr(read_addr),
						.write_addr(write_addr),
						.we_in(we_in),
						.clk(clk),
						.data_out(data_out));
else if (ram_under_test == 3)
ram_single_port_v3	UUT(.data_in(data_in),
						.read_addr(read_addr),
						.write_addr(write_addr),
						.we_in(we_in),
						.clk(clk),
						.data_out(data_out));
else if (ram_under_test == 4)
ram_single_port_v4	UUT(.data_in(data_in),
						.read_addr(read_addr),
						.write_addr(write_addr),
						.we_in(we_in),
						.clk(clk),
						.data_out(data_out));


always #5 clk = ~clk;
initial  begin
$monitor ("time=%d we_in=%b\t clk=%b\t read_addr=%b\t write_addr=%b\t data_in=%b\t data_out=%b\t",
		  $time, we_in,  clk, read_addr, write_addr, data_in, data_out);
		  
we_in=0;  clk=0; read_addr=0; write_addr=0; data_in=0;
#30;
we_in =1;
#30;  
	for (i = 0; i <= ADDRESS_WIDTH; i=i+1) begin
			write_addr = i;
			data_in=i;
			#40;
	end	
	
#50
we_in =0;
#50
	for (i=0; i<= ADDRESS_WIDTH; i=i+1) begin
		read_addr = i;
		#40;
	end

#50 $stop;

end
endmodule 
