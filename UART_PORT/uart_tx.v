module uart_tx(
    clk     ,
    rst_n   ,
    tx_vld  ,
    tx_data ,
    uart_tx
// tx_rdy  
);

parameter   DATA_T =            8;
parameter   DATA_0 =           13;
parameter   DATA_1 =            4;

input                         clk;
input                       rst_n;
input                      tx_vld;
input       [DATA_T-1:0]  tx_data;
output                    uart_tx;
// output                     tx_rdy;

reg					      uart_tx;
// reg                        tx_rdy;

reg         [DATA_0-1:0]     cnt0;
wire                     add_cnt0;
wire                     end_cnt0;

reg         [DATA_1-1:0]     cnt1;
wire                     add_cnt1;
wire                     end_cnt1;

reg                      add_flag;

reg         [9:0]    tx_data_temp;
wire                    load_data;

wire                      en_send;

//9600波特率计数器
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        cnt0 <= 0;
    end
    else if(add_cnt0)begin
        if(end_cnt0)
            cnt0 <= 0;
        else
            cnt0 <= cnt0 + 1'b1;
    end
end
assign add_cnt0 = add_flag;
assign end_cnt0 = add_cnt0 && cnt0 == 5208 - 1;

//10比特数据发送计数器
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
assign end_cnt1 = add_cnt1 && cnt1 == 10 - 1;

//add_flag
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        add_flag <= 0;
    end
    else if(tx_vld)begin
        add_flag <= 1;
    end
    else if(end_cnt1)begin
        add_flag <= 0;
    end
end

//装载数据
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        tx_data_temp <= 0;
    end
    else if(load_data)begin
        tx_data_temp <= {1'b1,tx_data,1'b0};
    end
end
assign load_data = tx_vld && !add_flag;

//发送数据
always @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        uart_tx <= 1;//1空闲位
    end
    else if(en_send)begin
        uart_tx <= tx_data_temp[cnt1];
    end
end
assign en_send = add_cnt0 && cnt0 == 0;


// always @(*)begin
//     if(add_flag || tx_vld)
//         tx_rdy = 0;
//     else
//         tx_rdy = 1;
// end

endmodule
