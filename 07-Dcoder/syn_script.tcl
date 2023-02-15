analyze -library WORK -format verilog {/home/ms22.29/amin/Verilog/07-Decoder/decoder_al_4_16_bh.v}
elaborate decoder_al_4_16_bh -architecture verilog -library WORK

compile -exact_map

write -hierarchy -format ddc -output /home/ms22.29/amin/Verilog/07-Decoder/syn/mux_4_1_bh1.ddc
write -hierarchy -format verilog -output /home/ms22.29/amin/Verilog/07-Decoder/syn/mux_4_1_bh1.v

uplevel #0 { report_area -nosplit }
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group } >> Report_timing_mux_4_1_bh1.txt
uplevel #0 { report_power -analysis_effort low } >> Report_power_mux_4_1_bh1.txt