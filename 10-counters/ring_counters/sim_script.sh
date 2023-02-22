vsim -c work.counter_tb -t 10ps -voptargs="+acc" -debugDB -do "run -all"  >> ring_result.txt
