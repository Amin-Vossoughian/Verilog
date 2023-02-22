gui_start
analyze -library WORK -format verilog {/home/ms22.29/amin/Verilog/11-counters/ring_counters/ring_counter.v}
elaborate ring_counter -architecture verilog -library DEFAULT -update
compile -exact_map