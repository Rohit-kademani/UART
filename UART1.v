`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:42:08 04/01/2023 
// Design Name: 
// Module Name:    UART1 
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

module UART1(
input PCLK1,
input PRESETN1,
input PSEL1,
input PENABLE1,
input [1:0]PADDR1,
input PWRITE1,
input [`BITWIDTH-1:0]PWDATA1,
output [`BITWIDTH-1:0]PRDATA1,
output wire PREADY1,
input RX1,
output wire TX1,

output wire TXRDY1,
output wire RXRDY1,
output wire[`BITWIDTH-1:0]DATAOUT1,
output wire s_tick1,

//input PCLK,
input PRESETN2,
input PSEL2,
input PENABLE2,
input [1:0]PADDR2,
input PWRITE2,
input [`BITWIDTH-1:0]PWDATA2,
output [`BITWIDTH-1:0]PRDATA2,
output wire PREADY2,
input RX2,
output wire TX2,

output wire TXRDY2,
output wire RXRDY2,
output wire[`BITWIDTH-1:0]DATAOUT2,
output wire s_tick2
    );
	 
	 
UAPBCORE U1(.PCLK(PCLK1),.PRESETN(PRESETN1),.PSEL(PSEL1),.PENABLE(PENABLE1),.PADDR(PADDR1),.PWRITE(PWRITE1),.PWDATA(PWDATA1),.PRDATA(PRDATA1),.PREADY(PREADY1),.RX(RX1),.TX(TX1),.TXRDY(TXRDY1),.RXRDY(RXRDY1),.DATAOUT(DATAOUT1),.s_tick(s_tick1));

UAPBCORE U2(.PCLK(PCLK1),.PRESETN(PRESETN2),.PSEL(PSEL2),.PENABLE(PENABLE2),.PADDR(PADDR2),.PWRITE(PWRITE2),.PWDATA(PWDATA2),.PRDATA(PRDATA2),.PREADY(PREADY2),.RX(RX2),.TX(TX2),.TXRDY(TXRDY2),.RXRDY(RXRDY2),.DATAOUT(DATAOUT2),.s_tick(s_tick2));


endmodule
