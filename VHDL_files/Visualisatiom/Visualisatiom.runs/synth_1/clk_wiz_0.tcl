# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.cache/wt [current_project]
set_property parent.project_path C:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property ip_repo_paths {{c:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/ip files/Basys3-master/Library}} [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_vhdl -library xil_defaultlib {
  C:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.srcs/sources_1/new/clk_wiz_0_clk_wiz.vhd
  C:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Visualisatiom.srcs/sources_1/new/clk_wiz_0.vhd
}
read_xdc C:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Basys3_Master.xdc
set_property used_in_implementation false [get_files C:/Users/Ben/Documents/GitHub/Psoc_robot/VHDL_files/Visualisatiom/Basys3_Master.xdc]

synth_design -top clk_wiz_0 -part xc7a35tcpg236-1
write_checkpoint -noxdef clk_wiz_0.dcp
catch { report_utilization -file clk_wiz_0_utilization_synth.rpt -pb clk_wiz_0_utilization_synth.pb }
