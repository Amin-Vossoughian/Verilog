#vsim -c work.piso_nbit_tb -t 10ps -voptargs="+acc" -debugDB -do "add wave *;run -all;exit" >> piso_sim_result.txt
vsim -c work.piso_nbit_tb -t 10ps -voptargs="+acc" -debugDB -do "add wave *;run -all;exit"
