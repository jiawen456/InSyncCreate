set projDir "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/planAhead"
set projName "InSyncCreate"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/mojo_top_0.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/reset_conditioner_1.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/processor_2.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/counter_3.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/edge_detector_4.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/button_conditioner_5.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/edge_detector_4.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/button_conditioner_5.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/edge_detector_4.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/button_conditioner_5.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/edge_detector_4.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/button_conditioner_5.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/edge_detector_4.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/button_conditioner_5.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/edge_detector_4.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/button_conditioner_5.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/edge_detector_4.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/button_conditioner_5.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/counter_18.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/toggle_map_19.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/shift_cursor_20.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/check_lighted_21.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/gen_map_temp_22.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/get_position_23.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/decimal2_24.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/decimal2_24.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/seven_seg_26.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/seven_seg_26.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/seven_seg_26.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/seven_seg_26.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/pipeline_30.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/pipeline_30.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/pipeline_30.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/pipeline_30.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/pipeline_30.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/pipeline_30.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/pipeline_30.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/alu_37.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/get_neighbours_38.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/get_neighbours_x_39.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/get_neighbours_38.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/alu_37.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/adder_42.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/shift_43.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/boole_44.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/compare_45.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/adder_42.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/shift_43.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/boole_44.v" "D:/50.002-Computation-Structure/Mojo/InSyncCreate/work/verilog/compare_45.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "D:/50.002-Computation-Structure/Mojo/InSyncCreate/constraint/custom.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
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
