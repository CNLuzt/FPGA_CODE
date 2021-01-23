`timescale 1ns / 1ps

module uart_tx_multibyte_tb();

parameter   DATAN_W  =  40;   //发送数据个数
parameter   CYCLE    =  20;
parameter   RST_TIME =  3;

reg                  clk;
reg                  rst_n;
reg   [DATAN_W-1:0]  data_n;
reg                  trans_go;
wire                 uart_tx;

uart_tx_multibyte uart_tx_multibyte(
   clk      ,  //时钟
   rst_n    ,  //复位
   data_n   ,  //要发送的多字节数据
   trans_go ,  //发送使能
   uart_tx     //串口发送数据
);

initial begin
   clk = 1;
   forever begin
      #(CYCLE/2);
      clk = ~clk;
   end
end

initial begin
   rst_n = 1;
   #3;
   rst_n = 0;
   #(RST_TIME*CYCLE);
   rst_n = 1;
end

initial begin
   #1;
   data_n = 0;
   #(10*CYCLE);
   data_n = 40'hA987654321;
   #5400000;
   data_n = 40'h123456789A;
end

initial begin
   #1;
   trans_go = 0;
   #(10*CYCLE);
   trans_go = 1;
   #(CYCLE);
   trans_go = 0;
   #5400000;
   trans_go = 1;
   #(CYCLE);
   trans_go = 0;
end

initial begin
   #12000000;
   $stop;
end
endmodule
