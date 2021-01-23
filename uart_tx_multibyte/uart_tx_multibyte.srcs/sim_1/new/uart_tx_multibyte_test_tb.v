`timescale 1ns / 1ns


module uart_tx_multibyte_test_tb();

reg   clk;
reg   rst_n;
wire  uart_tx;

uart_tx_multibyte_test uart_tx_multibyte_test(
   clk      ,
   rst_n    ,
   uart_tx  
);

parameter CYCLE      =  20;
parameter RST_TIME   =  3;

initial begin
   clk = 1;
   forever begin
      #(CYCLE/2)
      clk = ~clk;
   end
end

initial begin
   rst_n = 1;
   #3;
   rst_n = 0;
   #(RST_TIME * CYCLE);
   rst_n = 1;
end

initial begin
   #15203500
   $stop;
end

endmodule
