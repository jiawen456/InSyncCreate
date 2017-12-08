<?xml version="1.0" encoding="UTF-8"?>
<project name="toggle_map_test" board="Mojo V3" language="Lucid">
  <files>
    <src>shift_cursor.luc</src>
    <src>shift.luc</src>
    <src>alu.luc</src>
    <src>processor.luc</src>
    <src>mojo_temp.luc</src>
    <src>mojo_temp2.luc</src>
    <src>compare.luc</src>
    <src top="true">mojo_top.luc</src>
    <src>toggle_map.luc</src>
    <src>get_position.luc</src>
    <src>get_neighbours.luc</src>
    <src>adder.luc</src>
    <src>boole.luc</src>
    <ucf lib="true">io_shield.ucf</ucf>
    <ucf lib="true">mojo.ucf</ucf>
    <ucf>custom.ucf</ucf>
    <component>pn_gen.luc</component>
    <component>decoder.luc</component>
    <component>reset_conditioner.luc</component>
    <component>pipeline.luc</component>
    <component>button_conditioner.luc</component>
    <component>counter.luc</component>
    <component>edge_detector.luc</component>
  </files>
</project>
