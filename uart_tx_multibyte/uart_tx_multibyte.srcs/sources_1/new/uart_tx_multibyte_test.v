module uart_tx_multibyte_test(
   clk      ,
   rst_n    ,
   uart_tx  
);
parameter   DATAN_W  =  40;
parameter   CNT_D    =  500000;
parameter   CNT_W    =  19;

input                   clk;
input                   rst_n;
output                  uart_tx;
reg                     trans_go;


reg      [DATAN_W-1:0]  data_n;
reg      [CNT_W-1:0]    cnt;
wire                    end_cnt;




uart_tx_multibyte uart_tx_multibyte(
   .clk        (clk),      //时钟
   .rst_n      (rst_n),    //复位
   .data_n     (data_n),   //要发送的多字节数据
   .trans_go   (trans_go), //发送使能
   .uart_tx    (uart_tx)   //串口发送数据
);

always @(posedge clk or negedge rst_n)begin
   if(!rst_n)
      cnt <= 0;
   else if(end_cnt)
      cnt <= 0;
   else
      cnt <= cnt + 1;
end
assign end_cnt = cnt == CNT_D - 1;

always @(posedge clk or negedge rst_n)begin
   if(!rst_n)
      data_n <= 40'hA987654321;
   else if(add_cnt_data)begin
      if(end_cnt_data)
         data_n <= 40'hA987654321;
      else
         data_n <= data_n +1'b1;
   end
end
assign add_cnt_data = end_cnt;
assign end_cnt_data = add_cnt_data && data_n == 40'hB987654321 - 1;

always @(posedge clk or negedge rst_n)begin
   if(!rst_n)
      trans_go <= 0;
   else if(end_cnt)
      trans_go <= 1;
   else
      trans_go <= 0;
end

endmodule
