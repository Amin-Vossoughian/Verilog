module decoder_al_4_16_tb;

reg [3:0] sel_in;
reg en_in;
wire [15:0] y_out;

decoder_al_4_16_bh  DUT(.sel_in(sel_in), .en_in(en_in), .y_out(y_out));

always #5   sel_in[0]=~sel_in[0];
always #10  sel_in[1]=~sel_in[1];
always #15  sel_in[2]=~sel_in[2];
always #20  sel_in[3]=~sel_in[3];

initial 
$monitor ("time=%d\t sel_in=%b\t en_in=%b\t y_out=%b\t", $time, sel_in, en_in, y_out);

initial begin

sel_in = 0;
en_in = 1;

#100 en_in = 0;

#250  en_in =1; 

end
endmodule
