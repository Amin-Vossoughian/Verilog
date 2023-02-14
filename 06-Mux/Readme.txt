The multiplexer is a universa logic (in register transfer level) that is capabale of implementing any logic

There are different approach to design mux:
1- by means of if else: This method is not suggested given that if else is proiority logic and 
lead to the cascase of mux with huge delay. 

2- case constructs:
it is more convenient approach to design parallel multiplexer. there is only one mux 
in front of it due to the if else that is used for enable. 

3- concurrent assignment: in case of two input mux we could simply use ternary assignment, which 
actually act if else construct. but this method could be use in mix with case to bulut mux logics 
composed of two input. 

4- combination of the case cosntruct and and concurrent assignment:
efficient method to implemet logic base on two input mux. 