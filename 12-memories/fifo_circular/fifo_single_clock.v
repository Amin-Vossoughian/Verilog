module fifo_single_clock(clk,rst, buf_in, buf_out, wr_en, rd_en, buf_empyt, buf_full, fifo_counter);

input rst, wr_en, rd_en,clk;
input [7:0] buf_in;
input [7:0] buf_out;
output buf_empyt, buf_full;
output [7:0] fifo_counter; // could be just internal.


reg[7:0] buf_out;
reg buf_empyt, buf_full;//flags
reg [6:0] fifo_counter; //probably wrong, have to be 7 to.
reg [3:0] rd_ptr, wr_ptr;
reg [7:0] buf_mem[63:0];

/*notice fifo counter is just updated by non-blocking assignment and 
by clk. buff empty and full are just part of this block and not any
other blocking assignment, so there si no miss match due to the incomplete
sensitivity list between the simulation and synthesis
*/
always @(fifo_counter) begin
	buf_empty = (fifo_counter ==0);
	buf_full = (fifo_counter == 64);
end

/*In this design both reader and writer have the same clk. Therefore it is easy 
to consider the situation when both read and write occure at the same time
*/
 
always@(posedge clk, posedge rst) begin
	if (rst)
		fifo_counter <= 0;
	else if( (~buf_full && wr_en) && (~buf_empty && rd_en))
		fifo_counter <= fifo_counter;
	else if (~buf_full && wr_en)
		fifo_counter <= fifo_counter +1;
	else if ( !buf_empty && rd_en) 
		fifo_counter <= fifo_counter -1;
	else 
		fifo_counter <= fifo_counter;
end


always @(posedge clk , posedge rst) begin
	if (rst)
		buf_out <= 0;
	else begin
		if (rd_en && ~buf_empty)
			buf_out <= buf_mem[rd_ptr];
		else
			buf_out <= buf_out;
	end
end

always @(posedge clk) begin
	if(wr_en && ~buf_full)
		buf_mem[wr_ptr] <= buf_in;
	else
		buf_mem[wr_ptr] <= buf_mem[wr_ptr];
end


/*the two if inside procedural block means two mux, in other words 
they will be executed simultaniously.*/
always @(posedge clk, posedge rst) begin
	if(rst) begin
		wr_ptr <= 0;
		rd_ptr <= 0;
	end
	else begin
		if(!buf_full && wr_en)
			wr_ptr <= wr_ptr +1;
		else
			wr_ptr <= wr_ptr;
			
		if (~buf_empty && rd_en)
			rd_ptr <= rd_ptr + 1;
		else
			rd_ptr <= rd_ptr;
	end
end

endmodule
		
	
