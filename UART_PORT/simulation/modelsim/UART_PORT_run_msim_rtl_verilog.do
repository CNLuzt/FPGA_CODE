transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FpgaProgram/UART_PORT {D:/FpgaProgram/UART_PORT/uart_tx.v}
vlog -vlog01compat -work work +incdir+D:/FpgaProgram/UART_PORT {D:/FpgaProgram/UART_PORT/uart_rx.v}
vlog -vlog01compat -work work +incdir+D:/FpgaProgram/UART_PORT {D:/FpgaProgram/UART_PORT/UART_PORT.v}

vlog -vlog01compat -work work +incdir+D:/FpgaProgram/UART_PORT/simulation/modelsim {D:/FpgaProgram/UART_PORT/simulation/modelsim/UART_PORT.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  UART_PORT_vlg_tst

add wave *
view structure
view signals
run 1 sec
