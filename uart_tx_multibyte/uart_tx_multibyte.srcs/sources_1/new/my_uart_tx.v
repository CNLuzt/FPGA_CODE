module my_uart_tx(
   clk      ,  //时钟
   rst_n    ,  //复位
   data     ,  //发送数据
   send_en  ,  //发送使能
   baud_set ,  //波特率设置
   uart_tx  ,  //串口发送
   tx_done     //发送完成标志位
);
parameter   DATA_W   =  8;
parameter   SET_W    =  3;
parameter   BYTE_D   =  10;
parameter   BAUT_W   =  17;
parameter   BYTE_W   =  4;


input                   clk;
input                   rst_n;
input    [DATA_W-1:0]   data;
input                   send_en;
input    [SET_W-1:0]    baud_set;
output                  uart_tx;
output                  tx_done;

reg                     uart_tx;
reg                     tx_done;

reg      [BAUT_W-1:0]   cnt_baud;
reg      [BAUT_W-1:0]   baud;
wire                    add_cnt_baud;
wire                    end_cnt_baud;

reg      [BYTE_W-1:0]   cnt_byte;
wire                    add_cnt_byte;
wire                    end_cnt_byte;              

reg      [BYTE_D-1:0]   uart_data;
reg                     cnt_baud_flag;


always @(posedge clk or negedge rst_n)begin
   if(!rst_n)
      cnt_baud <= 0;
   else if(add_cnt_baud)begin
      if(end_cnt_baud)
         cnt_baud <= 0;
      else
         cnt_baud <= cnt_baud + 1'b1;
   end
end
assign add_cnt_baud = cnt_baud_flag;
assign end_cnt_baud = add_cnt_baud && cnt_baud == baud - 1;

always @(posedge clk or negedge rst_n)begin
   if(!rst_n)
      cnt_byte <= 0;
   else if(add_cnt_byte)begin
      if(end_cnt_byte)
         cnt_byte <= 0;
      else
         cnt_byte <= cnt_byte + 1'b1;
   end
end
assign add_cnt_byte = end_cnt_baud;
assign end_cnt_byte = add_cnt_byte && cnt_byte == BYTE_D - 1;

always @(posedge clk or negedge rst_n)begin
   if(!rst_n)
      uart_tx <= 1;
   else if(cnt_baud == 0 && add_cnt_baud)
      uart_tx <= uart_data[cnt_byte];
end

always @(posedge clk or negedge rst_n)begin
   if(!rst_n)
      uart_data <= 10'b0;
   else if(!cnt_baud_flag && send_en)
      uart_data <= {1'b1,data,1'b0};
end

always @(posedge clk or negedge rst_n)begin
   if(!rst_n)
      cnt_baud_flag <= 0;
   else if(send_en)
      cnt_baud_flag <= 1;
   else if(end_cnt_byte)
      cnt_baud_flag <= 0;
end

always @(*)begin
   case(baud_set)
      3'd0:baud = 17'd83333;//600bps
      3'd1:baud = 17'd41666;//1200bps 
      3'd2:baud = 17'd20833;//2400bps 
      3'd3:baud = 17'd10416;//4800bps
      3'd4:baud = 17'd5208 ;//9600bps 
      3'd5:baud = 17'd2604 ;//19200bps 
      3'd6:baud = 17'd1302 ;//38400bps 
      3'd7:baud = 17'd868  ;//57600bps
      default:
         baud = 0;
   endcase
end

always @(posedge clk or negedge rst_n)begin
   if(!rst_n)
      tx_done <= 0;
   else if(end_cnt_byte)
      tx_done <= 1;
   else
      tx_done <= 0;
end

endmodule
