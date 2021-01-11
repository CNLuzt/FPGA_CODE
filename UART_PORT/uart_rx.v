module uart_rx(
    clk     ,
    rst_n   ,
    rx_uart ,
    rx_data
);

parameter   DATA_R =    8;
parameter   DATA_0 =   13;
parameter   DATA_1 =    4;
input                               clk;
input                             rst_n;
input                           rx_uart;
output      [DATA_R-1:0]        rx_data;

reg         [DATA_R-1:0]        rx_data;

reg         [DATA_0-1:0]           cnt0;
wire                           add_cnt0;
wire                           end_cnt0;

reg         [DATA_1-1:0]       cnt1    ;
wire                           add_cnt1;
wire                           end_cnt1;

wire                              nedge;
reg								    flag_add;

//9600比特率计数
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        cnt0 <= 0;
    end
    else if(add_cnt0)begin
        if(end_cnt0)
            cnt0 <= 0;
        else
            cnt0 = cnt0 + 1'b1;
    end
end
assign add_cnt0 = flag_add;
assign end_cnt0 = add_cnt0 && cnt0 == 5208 - 1;

//9比特串口数据计数
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        cnt1 <= 0;
    end
    else if(add_cnt1)begin
        if(end_cnt1)
            cnt1 <= 0;
        else
            cnt1 <= cnt1 + 1'b1;
    end
end
assign add_cnt1 = end_cnt0;
assign end_cnt1 = add_cnt1 && cnt1 == 9 - 1;



//边沿检测，接D触发器
//异步信号同步化，防止亚稳态，打两拍
reg[2:0]        uart_sync;
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        uart_sync <= 3'b111;
    end
    else
        uart_sync <= {uart_sync[1:0],rx_uart};
end
assign nedge = uart_sync[2:1] == 2'b10;

//当接收到的串口由1变0时，flag_add置位
//当计数结束时，flag_add复位
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        flag_add <= 0;
    end
    else if(nedge)begin
        flag_add <= 1;
    end
    else if(end_cnt1)begin
        flag_add <= 0;
    end
end

//cnt1 == 0时，接收的是起始位0,1-8才是数据位
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        rx_data <= 8'h00;
    end
    else if (add_cnt0 && cnt0 == 5208/2 - 1 && cnt1 > 0) begin
        rx_data[cnt1 - 1] <= rx_uart;
    end
end

endmodule
