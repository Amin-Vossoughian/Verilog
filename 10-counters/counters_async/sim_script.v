vsim -c work.counter_async_4bits_tb  -t 10ps -voptargs="+acc" -debugDB  -do "add wave *;run -all;exit" > sim_results_4bits.txt
