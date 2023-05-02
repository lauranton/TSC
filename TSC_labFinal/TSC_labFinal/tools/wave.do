onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top/instrRegIf/clk
add wave -noupdate /top/instrRegIf/test_clk
add wave -noupdate /top/instrRegIf/reset_n
add wave -noupdate /top/instrRegIf/load_en
add wave -noupdate /top/instrRegIf/operand_a
add wave -noupdate /top/instrRegIf/operand_b
add wave -noupdate /top/instrRegIf/opcode
add wave -noupdate /top/instrRegIf/write_pointer
add wave -noupdate /top/instrRegIf/read_pointer
add wave -noupdate /top/instrRegIf/instruction_word
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {279 ns}
