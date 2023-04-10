`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:04:19 03/30/2023 
// Design Name: 
// Module Name:    uart 
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
`define SB_TICK  16
module uart (
        input clk, reset_n,
	output [`BITWIDTH-1:0] r_data,
        input rd_uart,
	input [1:0]paddr,
        output rx_empty,
        input rx,
	input [`BITWIDTH-1: 0] w_data,
        input wr_uart,
        output tx_full,
        output t_x,
	input [`BITWIDTH-1:0] TIMER_FINAL_VALUE,
		  output wire tick
    );
    
   
    //wire tick;
    BGEN baud_rate_generator (
        .clk(clk),
        .reset_n(~reset_n),
        .enable(1'b1),
        .FINAL_VALUE(TIMER_FINAL_VALUE),
        .done(tick)
    );
    
    // Receiver
    wire rx_done_tick;
    wire [`BITWIDTH-1:0] rx_dout;
    uart_rx receiver(
        .clk(clk),
        .reset_n(~reset_n),
        .rx(rx),
        .s_tick(tick),
        .rx_done_tick(rx_done_tick),
        .rx_dout(rx_dout)
    );
    
    buffer_r Rx (
        .Clk(clk),          
        .Rst(reset_n), 
        .rpaddr(paddr),		 
        .dataIn(rx_dout),     
        .WR(rx_done_tick),  
        .RD(rd_uart),    
        .dataOut(r_data),      
        .EMPTY(rx_empty)	
          		  
    );

    // Transmitter
    wire tx_empty, tx_done_tick;
	wire [`BITWIDTH-1:0] txdin;
    uart_tx transmitter(
        .clk(clk),
        .reset_n(~reset_n),
        .tx_start(tx_empty),
        .s_tick(tick),
        .tx_din(txdin),
        .tx_done_tick(tx_done_tick),
        .tx(t_x)
    );
    
    buffer_t tx (
        .tClk(clk),         
        .tRst(~reset_n),
        .tpaddr(paddr),
        .tdataIn(w_data),      
        .tWR(wr_uart),  
        .tRD(tx_done_tick),    
        .tdataOut(txdin),	  
        .ttxrdy(tx_full),            
        .tEMPTY(tx_empty)		  
    );    
endmodule

