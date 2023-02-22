#vsim -c work.siso_nbit_tb -t 10ps -voptargs="+acc" -debugDB -do "add wave *;run -all;exit" >> siso_nbit_sim_result.txt
vsim -c work.siso_nbit_tb -t 10ps -voptargs="+acc" -debugDB -do "add wave *;run -all;exit"
