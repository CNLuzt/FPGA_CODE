module UART_PORT(
	clk		,
	rst_n	,
	rx_uart	,
	tx_vld	,
	tx_data	,	
	rx_data	,
	uart_tx
);
input		  			clk;
input	  	  			rst_n;
input	  				rx_uart;
input					tx_vld;
input	[8-1:0]		tx_data;
output[8-1:0]		rx_data;
output			   uart_tx;

wire 	[8-1:0] 		rx_data;
wire 					uart_tx;

uart_rx UART_RX(
	.clk	(clk),
	.rst_n	(rst_n),
	.rx_uart(rx_uart),
	.rx_data(rx_data)
);

uart_tx UART_TX(
	.clk	(clk),
	.rst_n	(rst_n),
	.tx_vld	(tx_vld),
	.tx_data(tx_data),
	.uart_tx(uart_tx)
);

endmodule
