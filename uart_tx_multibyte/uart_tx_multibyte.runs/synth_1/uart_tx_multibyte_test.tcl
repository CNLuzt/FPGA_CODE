# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param simulator.modelsimInstallPath D:/ProgrammingTool/modeltech64_10.4/win64
create_project -in_memory -part xc7a35tfgg484-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/MyCode/MyFpga/MyXilinxVivado/uart_tx_multibyte/uart_tx_multibyte.cache/wt [current_project]
set_property parent.project_path D:/MyCode/MyFpga/MyXilinxVivado/uart_tx_multibyte/uart_tx_multibyte.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/MyCode/MyFpga/MyXilinxVivado/uart_tx_multibyte/uart_tx_multibyte.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  D:/MyCode/MyFpga/MyXilinxVivado/uart_tx_multibyte/uart_tx_multibyte.srcs/sources_1/new/my_uart_tx.v
  D:/MyCode/MyFpga/MyXilinxVivado/uart_tx_multibyte/uart_tx_multibyte.srcs/sources_1/new/uart_tx_multibyte.v
  D:/MyCode/MyFpga/MyXilinxVivado/uart_tx_multibyte/uart_tx_multibyte.srcs/sources_1/new/uart_tx_multibyte_test.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/MyCode/MyFpga/MyXilinxVivado/uart_tx_multibyte/uart_tx_multibyte.srcs/constrs_1/new/uart_tx_multibyte_test.xdc
set_property used_in_implementation false [get_files D:/MyCode/MyFpga/MyXilinxVivado/uart_tx_multibyte/uart_tx_multibyte.srcs/constrs_1/new/uart_tx_multibyte_test.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top uart_tx_multibyte_test -part xc7a35tfgg484-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef uart_tx_multibyte_test.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file uart_tx_multibyte_test_utilization_synth.rpt -pb uart_tx_multibyte_test_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]