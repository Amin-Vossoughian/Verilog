module universal_shift_reg(po,pi,sel,clk,rst,si,so);

input [1:0] sel;
input [4:0] pi;
input clk, rst, si;

output so;
output reg [4:0] po;

always@(posedge clk)
	if (~rst)
		po <=0;
	else begin
		case (sel)
			2'b00  : po <= po;
			2'b01  : po <= {po[3:0],si};
			2'b10  : po <= {si,po[4:1]};
			2'b11  : po <= pi;
			default: po <= 0;
		endcase
	end

assign so= (sel == 2'b01) ? po[4] : po[0];

endmodule