setmentor
vlib work

vlog -reportprogress 300 -work work  d_latch_nls.v
vlog -reportprogress 300 -work work  d_latch_pls.v

vlog -reportprogress 300 -work work  d_latch_pls_df.v
vlog -reportprogress 300 -work work  d_latch_nls_df.v

vlog -reportprogress 300 -work work  d_latch_tb.v
