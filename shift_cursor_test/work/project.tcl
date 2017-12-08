set projDir "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/planAhead"
set projName "shift_cursor_test"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/mojo_top_0.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/reset_conditioner_1.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/counter_2.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/processor_3.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/edge_detector_4.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/button_conditioner_5.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/edge_detector_4.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/button_conditioner_5.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/edge_detector_4.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/button_conditioner_5.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/edge_detector_4.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/button_conditioner_5.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/edge_detector_4.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/button_conditioner_5.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/shift_cursor_14.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/get_position_15.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/pipeline_16.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/pipeline_16.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/pipeline_16.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/pipeline_16.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/pipeline_16.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/get_neighbours_21.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/alu_22.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/adder_23.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/shift_24.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/boole_25.v" "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/work/verilog/compare_26.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "D:/50.002-Computation-Structure/InSyncGit/shift_cursor_test/constraint/custom.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
