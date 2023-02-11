/*structural */

module FA_st(s,c,a,b,cin);
input a,b,cin;
output s,c;
/* wire description:
N1: betweeb tow xor
N2 ...4: between and and or;
*/

wire N1,N2,N3,N4;
xor xor1(N1,a,b);
xor xor2(s,N1,cin);

and and1(N2,a,b);
and and2(N3,a,b);
and and3(N4,cin,a);

or  or1(c,N2,N3,N4);

endmodule;

/*second approach*/
/*we assume we already have the half adder*/

module(s,c,a,b,cin);
input a,b,cin;
output s,c;

wire N1, N2,N3;

HA_df  HA_df_1(N1,N2,a,b);
HA_df  Ha_df_2(s,N3,N1,cin);
or or1(c,N2,N3);

endmodule


/* Full adder - third apporch structura 3*/

module FA_st(ss,cc,aa,bb,cin);
input aa,bb,cin;
output ss,cc;

wire N1,N2,N3;
/*connection is not positional in this case so any order is acceptable*/
HA_df HA_df_1(.s(N1), .a(aa), .b(bb, .c(N2));
HA_df Ha_df_2(.c(N3), .s(ss), .b(cin), .a(N1));
/*next block is primitive one, we do not know name so go positional again*/
/* we could get the name from library, but not necessary*/
or or_1(cc, N2, N3);

/* Full adder - data flow approach*/

module FA_df (a,b,cin,s,cout);

input a,b,cin;
output s, cout;

/*recall that they are concurrent */
assign s=a^b^cin;
assign cout=a&b | b&cin | cin&a;

endmodule

/* Full adder - behavioral */

module FA_bh(s,cout,a, b, cin);

input a, b, cin;
output s, cout;

always@ (a,b,cin)
/*always @(*) ==> in case we are sensitive to all inputs*/

 begin
   s=a^b^cin;
   cout=a&b | b&cin | cin&a;
 end
   
endmodule

/*test bech base on our baviurial design */

'timescale 1ns/100ps' //time unit and its resolution
module  FA_bh_tb;
wire s, cout;
reg a, b, cin;

FA_bh  FA_1(s,c,a,b,cin) // here we could also use any in out name for our instance.

/* initial block is similar to always block the only difference is that
/ it only only once and initial block will no be synthesize. Therefore it is not for
hardware design, just for testbench and simulation purposes.
*/
initial 
  begin
    $monitor ("time= %d \t a=%b \t b=%b \t cin=%b \t s=%b cout=%b", $time, a, b, cin,s,cout);
    a=0; b=0; c=0;
    #10  a=1;
    #10  b=1;
    #10  c=0;
	#10  $stop;  
  end
	/* we could use $stop to suspend or $finish to execute simulation. in both 
	case we could observe the waves*/
	
  
/*
The following is the structure of the testbench in verilog. as we could observe,
the inputs are provided in some memory form thus define as reg, while the outputs
are just wires. the monitor will shows the changes that are commamded to change.
notice we immediately initalized the monitor afeter begin before any time instance,
it means monitor will start to monitor changes at tiem 0.

in addition, most verilog compiler automatically connect the testbench file to design
file if the following convention is following
file name = file_name.v
testbench=  file_name_tb.v

otherwise file have to be included.

 
                                TEST_BENCH
             ==============================================================
             =     ========          ====================                 =
			 =     =      =          =                  =                 =
			 =	   =   a  =--------> =                  =                 =
			 = 	   =      =          =      DUT         =--------> S      =
			 =	   =   b  =-=------> =                  =                 = 
			 =	   =      =          =                  =--------> Cout   =
			 =	   =  cin =--------> =                  =                 =
			 =	   =      =          =                  =                 =
			 = 	   ========          ====================                 =
			 ==============================================================	   
*/