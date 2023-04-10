`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:05:43 03/30/2023 
// Design Name: 
// Module Name:    uart_rx 
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
`timescale 1ns / 1ps
`define BITWIDTH 8
`define SB_TICK 16

module uart_rx(
input clk, reset_n,
input rx, s_tick,
output reg rx_done_tick,
output [`BITWIDTH-1:0] rx_dout
);
    
localparam  idle = 0, start = 1,data = 2, stop = 3;
                
reg [1:0] state_reg, state_next;
reg [3:0] s_reg;
reg [3:0] s_next;                // keep track of the baud rate ticks
reg [`BITWIDTH-1:0] n_reg;
reg [`BITWIDTH-1:0] n_next; // keep track of the number of data bits recieved
reg [`BITWIDTH-1:0] b_reg, b_next;         // stores the recieved data bits
    
    
always @(posedge clk, negedge reset_n)
begin
 if(~reset_n)
 begin
  state_reg <= idle;
  s_reg = 1'b0;
  n_reg = 1'b0;
  b_reg = 1'b0;
  end
else
 begin
  state_reg <= state_next;
  s_reg = s_next;
  n_reg = n_next;
  b_reg = b_next;
  end
end
    
    // Next state logic
always @(negedge clk)
 begin
  state_next = state_reg;
  s_next = s_reg;
  n_next = n_reg;
  b_next = b_reg;
  rx_done_tick = 1'b0;
 case(state_reg)
  idle:                
    if (~rx)
    begin
     s_next = 1'b0;
     state_next = start;                        
    end                 
 start:                
  if (s_tick)
   if (s_reg == 0)
   begin
    s_next = 1'b0;
    n_next = 1'b0;
    state_next = data;
   end
   else                        
   s_next = s_reg + 1'b1;
	
 data:
  if (s_tick )
  if(s_reg == 0)
   begin
    s_next = 0;
    b_next = {rx, b_reg[`BITWIDTH-1:1]}; // Right shift
  if (n_reg == (`BITWIDTH-1))
   state_next = stop;
  else
   n_next = n_reg + 1'b1;
  end
  else
   s_next = s_reg + 1'b1;
	
stop:
  if (s_tick)
	  if(s_reg == 0)
    begin
     rx_done_tick = 1'b1;
     state_next = idle;
    end
    else
     s_next = s_reg + 1'b1;
 default:
   state_next = idle;
 endcase
end
       
 assign rx_dout = b_reg;
 
endmodule
