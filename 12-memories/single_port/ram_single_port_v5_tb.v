module ram_single_port_v5_tb;
/********** ram parameters******/
parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 4;
parameter DEPTH = 16;

/*******************************/
reg clk;
reg [ADDR_WIDTH-1:0] addr;
reg [DATA_WIDTH-1:0] data;
reg cs;
reg we;
reg oe;

ram_single_port_v5  #(DATA_WIDTH.(DATA_WIDTH)) 
uut0(.clk(clk), .addr(addr), .data(data), .cs(cs), .we(we), .oe(oe));

always clk =~clk;
assign data= !oe ? tb_data : 'hz;

initial begin
	{clk,cs,we,addr,tb_data,oe} <= 0;

	repeat (2) @(posedge clk);
		for (integer i=0; i < 2**ADDR_WIDTH; i= i+1) begin
		repeat (1) @(posedge clk) addr <= i; we <=1; cs <= 1;oe <= 0; tb_data <=$random;
		end
	
		for (integer i=0; i < 2**ADDR_WIDTH; i= i+1) begin
		repeat (1) @(posedge clk) addr <= i; we <=0; cs <= 1; oe <= 1;
		end

	#20 $finish
end 
endmodule
