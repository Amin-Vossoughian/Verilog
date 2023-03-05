module tb();
reg clk;
reg [7:0] a,b,c,d;
reg [7:0] e,f,g,h;
reg [7:0] i,j,k,l;
reg [7:0] m,n,o,p;
always #10 clk =~clk;
/* it delays both evaluation and update of the assignments*/
always@(posedge clk) begin
    b <= a+a;
   #3  c <= b+a;
   #1  d<= c+a;
end 
/* it delays the update but not the evaluation.*/
always@(posedge clk) begin
    f <= e+e;
     g <= #3 f+e;
     h <= #1 g+e; 
end
/* it delays both evaluation and update of the assignments*/
always@(posedge clk) begin
    j = i+i;
   #3  k = i+j;
   #1  l = k+i;
end 
/*it delays the evaluation but not the update*/
always@(posedge clk) begin
    n = m+m;
    o =#3 m+n;
    p =#1 m+o;
end 
initial begin
    clk =0;
    a = 4; e = 4; i= 4; m = 4;
    b = 3; f = 3; j= 3; n = 3;
    c = 2; g = 2; k= 2; o = 2;
    d = 5; h = 5; l= 5; p = 5;
    #25
    clk =0;
    a = 4; e = 4; i= 4; m = 4;
    b = 3; f = 3; j= 3; n = 3;
    c = 2; g = 2; k= 2; o = 2;
    d = 5; h = 5; l= 5; p = 5;
end
endmodule
