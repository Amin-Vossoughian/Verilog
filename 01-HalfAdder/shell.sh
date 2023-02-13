vlog -work work HA_1bit.v 
vlog -work work HA_1bit_tb.v
vsim  work.HA_df_1bit_tb -t 10ps -debugDB
