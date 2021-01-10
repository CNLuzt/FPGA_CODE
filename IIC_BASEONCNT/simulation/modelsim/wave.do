onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /iic_vlg_tst/clk
add wave -noupdate /iic_vlg_tst/rd
add wave -noupdate /iic_vlg_tst/rst_n
add wave -noupdate /iic_vlg_tst/word_addr
add wave -noupdate /iic_vlg_tst/wr
add wave -noupdate /iic_vlg_tst/wr_data
add wave -noupdate /iic_vlg_tst/done
add wave -noupdate /iic_vlg_tst/iic_scl
add wave -noupdate /iic_vlg_tst/iic_sda
add wave -noupdate /iic_vlg_tst/rd_data
add wave -noupdate /iic_vlg_tst/rd_data_valid
add wave -noupdate /iic_vlg_tst/wr_data_valid
add wave -noupdate /iic_vlg_tst/i1/iic_en
add wave -noupdate /iic_vlg_tst/i1/iic_out
add wave -noupdate /iic_vlg_tst/i1/iic_in
add wave -noupdate -radix hexadecimal -childformat {{{/iic_vlg_tst/M24LC64/WrDataByte[0]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[1]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[2]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[3]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[4]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[5]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[6]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[7]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[8]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[9]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[10]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[11]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[12]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[13]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[14]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[15]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[16]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[17]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[18]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[19]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[20]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[21]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[22]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[23]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[24]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[25]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[26]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[27]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[28]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[29]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[30]} -radix hexadecimal} {{/iic_vlg_tst/M24LC64/WrDataByte[31]} -radix hexadecimal}} -subitemconfig {{/iic_vlg_tst/M24LC64/WrDataByte[0]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[1]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[2]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[3]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[4]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[5]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[6]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[7]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[8]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[9]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[10]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[11]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[12]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[13]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[14]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[15]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[16]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[17]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[18]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[19]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[20]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[21]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[22]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[23]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[24]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[25]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[26]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[27]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[28]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[29]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[30]} {-height 15 -radix hexadecimal} {/iic_vlg_tst/M24LC64/WrDataByte[31]} {-height 15 -radix hexadecimal}} /iic_vlg_tst/M24LC64/WrDataByte
add wave -noupdate /iic_vlg_tst/M24LC64/RdDataByte
add wave -noupdate /iic_vlg_tst/i1/rd_flag
add wave -noupdate -radix unsigned /iic_vlg_tst/i1/cnt_sclk
add wave -noupdate -radix unsigned /iic_vlg_tst/i1/cnt_byte
add wave -noupdate /iic_vlg_tst/i1/add_cnt_sclk
add wave -noupdate /iic_vlg_tst/i1/add_cnt_byte
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 201
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {207214847 ps}
