#vsim -c work.pipo_nbit_tb -t 10ps -voptargs="+acc" -debugDB -do "run -all;exit" > pipo_sim_result.txt
vsim  -c work.siso_nbit_tb -t 10ps -voptargs="+acc" -debugDB -do "add wave *;run -all;exit"
