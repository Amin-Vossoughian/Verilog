gui_start
analyze -library WORK -format verilog {/home/ms22.29/amin/Verilog/06-Mux/mux_4_1_bh1.v}
elaborate mux_4_1_bh1 -architecture verilog -library WORK
change_selection -name __slctBus17 -type {cell design} _sel207
change_selection -name __slctBus22 -type {cell design} _sel366
compile -exact_map
change_selection -name __slctBus165 -type {cell design} _sel629
write -hierarchy -format ddc -output /home/ms22.29/amin/Verilog/06-Mux/syn/mux_4_1_bh1.ddc
write -hierarchy -format verilog -output /home/ms22.29/amin/Verilog/06-Mux/syn/mux_4_1_bh1.v
uplevel #0 { report_area -nosplit }
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group } >> Report_timing_mux_4_1_bh1.txt
uplevel #0 { report_power -analysis_effort low } >> Report_power_mux_4_1_bh1.txt
analyze -format verilog {/home/ms22.29/amin/Verilog/06-Mux/mux_4_1_bh2.v}
elaborate mux_4_1_bh2 -architecture verilog -library WORK
change_selection -name __slctBus173 -type {cell design} _sel1654
compile -exact_map
change_selection -name __slctBus181 -type {cell design} _sel1914