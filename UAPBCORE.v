`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:03:30 03/30/2023 
// Design Name: 
// Module Name:    UAPBCORE 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps
`define BITWIDTH 8

module UAPBCORE(
input PCLK,
input PRESETN,
input PSEL,
input PENABLE,
input [1:0]PADDR,
input PWRITE,
input [`BITWIDTH-1:0]PWDATA,
output [`BITWIDTH-1:0]PRDATA,
output wire PREADY,
input RX,
output wire TX,

output wire TXRDY,
output wire RXRDY,
output wire[`BITWIDTH-1:0]DATAOUT,
output wire s_tick
);


wire [`BITWIDTH-1:0]data_intodatain;
wire [`BITWIDTH-1:0]o_baud_valuetodatain;

wire clk1;
wire rxtorx;
wire RR; //rxrdy to rxempty
wire TT; //txfull to txrdy

uart uart(.clk(clk1),.reset_n(PRESETN),.paddr(PADDR),.r_data(DATAOUT),.rd_uart(PENABLE),.wr_uart(PWRITE),.rx_empty(RR),.w_data(data_intodatain),.t_x(TX),.rx(rxtorx),.TIMER_FINAL_VALUE(o_baud_valuetodatain),.tx_full(TT),.tick(s_tick));

finalvalue finalvalue(.clock(PCLK),.clk(clk1));

apbslave apbslave(.pclk(clk1),.presetn(PRESETN),.psel(PSEL),.penable(PENABLE),.P_ADDR(PADDR),.pwrite(PWRITE),.PW_DATA(PWDATA),.rx(RX),.datain(DATAOUT),.Pr_data(PRDATA),.P_READY(PREADY),.o_baud_val(o_baud_valuetodatain),.data_in(data_intodatain),.RXOUT(rxtorx),.TX_RDY(TXRDY),.RX_RDY(RXRDY),.tf_TXRDY(TT),.rbuff_RXRDY(RR));


endmodule
