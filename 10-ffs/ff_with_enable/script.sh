setmentor
vlib work
#vlog -reportprogress 300 -work work  d_latch_nls.v
#vlog -reportprogress 300 -work work  d_latch_pls.v
#vlog -reportprogress 300 -work work  d_latch_tb.v

#vlog -reportprogress 300 -work work  d_ff_pet_asyn_al.v
#vlog -reportprogress 300 -work work  d_ff_pet_syn_al.v
#vlog -reportprogress 300 -work work  d_ff_al_tb.v

vlog -reportprogress 300 -work work d_ff_pet_asyn_al_load_en.v
vlog -reportprogress 300 -work work d_ff_pet_syn_al_load_en.v
vlog -reportprogress 300 -work work d_ff_al_load_en_tb.v
