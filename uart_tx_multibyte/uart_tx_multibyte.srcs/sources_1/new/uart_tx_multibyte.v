`timescale 1ns / 1ns

module uart_tx_multibyte(
   clk      ,  //时钟
   rst_n    ,  //复位
   data_n   ,  //要发送的多字节数据
   trans_go ,  //发送使能
   uart_tx     //串口发送数据
);
parameter   IDLE     =  3'b001;  //空闲状态
parameter   S1       =  3'b010;  //准备发送数据状态，使能，装载数据
parameter   S2       =  3'b100;  //发送数据状态

//CNTBY_N字节数，CNTBY_W字节数计数器的位宽（更改这两个参数，即可实现串口任意字节发送）
parameter   DATAN_W  =  40;   //发送数据个数
parameter   CNTBY_N  =  5;    //发送数据字节个数
parameter   CNTBY_W  =  3;    //发送数据字节计数器位宽，5=3'b101
parameter   DATA_W   =  8;    //一次串行发送的数据个数
parameter   STATE_W  =  3;    //状态机位宽


input                   clk;
input                   rst_n;
input    [DATAN_W-1:0]  data_n;
input                   trans_go;
output                  uart_tx;

wire                    uart_tx;
reg      [CNTBY_W-1:0]  cnt_bytes;
wire                    add_cnt_bytes;
wire                    end_cnt_bytes;
reg                     cnt_bytes_flag;
wire                    tx_done;
reg      [DATA_W-1:0]   data;
reg                     send_en;

reg      [STATE_W-1:0]  state_c;
reg      [STATE_W-1:0]  state_n;
wire                    IDLE2S1_start;
wire                    S12S2_start;   
wire                    S22S1_start ;  
wire                    S22IDLE_start ;

reg      [DATAN_W-1:0]  data_tmp;


my_uart_tx my_uart_tx(
   .clk        (clk),      //时钟
   .rst_n      (rst_n),    //复位
   .data       (data),     //发送数据
   .send_en    (send_en),  //发送使能
   .baud_set   (4'd4),     //波特率设置，默认9600bps
   .uart_tx    (uart_tx),  //串口发送
   .tx_done    (tx_done)   //发送完成标志位
);



always @(posedge clk or negedge rst_n)begin
   if(!rst_n)
      cnt_bytes <= 0;
   else if(add_cnt_bytes)begin
      if(end_cnt_bytes)
         cnt_bytes <= 0;
      else
         cnt_bytes <= cnt_bytes + 1'b1;
   end
end
assign add_cnt_bytes = cnt_bytes_flag;
assign end_cnt_bytes = add_cnt_bytes && cnt_bytes == CNTBY_N - 1;

always @(*)begin
   if(tx_done)
      cnt_bytes_flag = 1;
   else
      cnt_bytes_flag = 0;
end

//状态机
//状态转移描述
always @(posedge clk or negedge rst_n)begin
   if(!rst_n)
      state_c <= IDLE;
   else
      state_c <= state_n;
end
//状态转移条件判断描述
always @(*)begin
   case(state_c)
      IDLE:begin
         if(IDLE2S1_start)
            state_n = S1;
         else
            state_n = state_c;
      end
      S1:begin
         if(S12S2_start)
            state_n = S2;
         else
            state_n = state_c;
      end
      S2:begin
         if(S22S1_start)
            state_n = S1;
         else if(S22IDLE_start)
            state_n = IDLE;
         else
            state_n = state_c;
      end
      default:
         state_n = IDLE;
   endcase
end
//状态转移条件描述
assign IDLE2S1_start =  state_c==IDLE  && trans_go;
assign S12S2_start   =  state_c==S1    && send_en;
assign S22S1_start   =  state_c==S2    && tx_done && !end_cnt_bytes;
assign S22IDLE_start =  state_c==S2    && end_cnt_bytes;
//状态输出
always @(posedge clk or negedge rst_n)begin
   if(!rst_n)
      send_en <= 0;
   else if(state_c == S1)
      send_en <= 1;
   else
      send_en <= 0;
end

always @(posedge clk or negedge rst_n)begin
   if(!rst_n)begin
      data <= 0;
      data_tmp <= 0;      
   end
	else if(state_c == IDLE)begin
		data <= 0;
		data_tmp <= data_n;
	end
   else if(state_c == S1 && !send_en)begin
      data <= data_tmp[7:0];
      data_tmp <= {data_tmp[7:0],data_tmp[DATAN_W-1:8]};
   end
end


endmodule
