# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {Common-41} -limit 4294967295
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z010clg400-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/cours_alp/td/slotmachine/slotmachine.cache/wt [current_project]
set_property parent.project_path C:/cours_alp/td/slotmachine/slotmachine.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:zybo:part0:2.0 [current_project]
read_vhdl -library xil_defaultlib C:/cours_alp/td/slotmachine/slotmachine.srcs/sources_1/new/slotmachine.vhd
synth_design -top slotmachine -part xc7z010clg400-1
write_checkpoint -noxdef slotmachine.dcp
catch { report_utilization -file slotmachine_utilization_synth.rpt -pb slotmachine_utilization_synth.pb }