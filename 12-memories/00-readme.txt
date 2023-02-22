Taking into account that all type of memory except srams are analog memory,
it is just possible to implement D-ff based srams with verilog. There different way to descripe memories.

reg [word_size] ram_name [row_size][column_size]  
word and row_size are strart from higer to lower value.
the column_size start from zero to higher value

1- reg [7:0] ram_name => 1 byte memory. we could access singel bit. practically 8 bit register. 
                         it is not normally used as ram in practial design.

2- reg ram_name [7:0] => seven column of single bit memory. single bit memory are also not used 
                         given that is row, it is obvious we could not call it as vector.
						 have to call each one specifically. 
						 
3- reg ram_name [7:0][0:7] seven row and seven singel bit independent column;each word is of 
							size one. for instance we could access ram_name [5][2] which 
							is single bit in row 5 and colomn 2.

4- reg [7:0] ram_name [0:3]  4 array of 1 byte. bit access is not possible, just word read
							for instance ram[2] will read all teh data in array 2.
							reg [7:0] ram_name [0:1023] it very common.

 reg [7:0] ram_name [0:3][4:0]  3D momory, 3 * 4 matrix that each one is 1 word of 8 bits.