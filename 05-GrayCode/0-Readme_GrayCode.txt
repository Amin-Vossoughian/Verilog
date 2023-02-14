/* couple of important notes
1- Gray codes are used in the gray counter implementation and in the error correcting mechanism.
2-In addition, Gray codes are used in the multiple clock domain designs to transfer the control information from one of the clock domains to another clock domain.
3- the binary to gray is simple xor of the input, while the gray to binary is the xor between each input and previous result. much more delay. 