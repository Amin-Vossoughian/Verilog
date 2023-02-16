gui_start
analyze -library WORK -format verilog {/home/ms22.29/amin/Verilog/09-ffs/d_ff_pet_asyn_al.v}
elaborate d_ff_pet_asyn_al -architecture verilog -library DEFAULT
compile -exact_map
