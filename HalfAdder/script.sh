vlog -reportprogress 300 -work work filename.v
vsim work.filemame.v -t 10ps 
run #time ns;
check the output.
