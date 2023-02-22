In order to obtain the subtaction boolean equation, simply ignore all internet explanation.
They are stupid. the reality is that borrow in is added to a_in in the table, then b is subtract
from it. in case we do not have borow in and a is grater that b, we need borrow so borrow out 
become one. in case we already have borrow in equal to one, if the addtion with a_in lead to carry
and b_in is also smaller that a, it means we did not need it and the carry cancel borrow in. therfore
set the borrow out zero. 


borrow_in   a_in   b_in   |  diff    borrwo_out
.................................................
    0         0      0    |    0          0
	0         0      1    |    1          1
    0         1      0    |    1          0
    0         1      1    |    0          0
    1         0      0    |    1          1
    1         0      1    |    0          1
    1         1      0    |    0          0
    1         1      1    |    1          1


diff = a xor b xor borrow_in

borrwo_out= ~a.b + borrow_in(a+b)	