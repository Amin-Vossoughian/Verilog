setmentor
vlib work

vlog -reportprogress 300 -work work  d_latch_nls.v
vlog -reportprogress 300 -work work  d_latch_pls.v

vlog -reportprogress 300 -work work  d_latch_pls_df.v
vlog -reportprogress 300 -work work  d_latch_nls_df.v

vlog -reportprogress 300 -work work  d_latch_tb.v

vlog -reportprogress 300 -work work  d_latch_nls_syn_reset_al.v
vlog -reportprogress 300 -work work  d_latch_reset_tb.v
