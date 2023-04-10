`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:05:12 03/30/2023 
// Design Name: 
// Module Name:    BGEN 
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
module BGEN(
    input clk,
    input reset_n,
    input enable,
    input [`BITWIDTH - 1:0] FINAL_VALUE,
    output done
    );
  
    reg [`BITWIDTH - 1:0] Q_reg, Q_next;
    
always @(posedge clk, negedge reset_n)
 begin
 if (~reset_n)
   Q_reg <= 'b0;
 else if(enable)
   Q_reg <= Q_next;
 else
   Q_reg <= Q_reg;
end
   
assign done = Q_reg == FINAL_VALUE;
always @(negedge clk)
 Q_next = done? 1'b0 : Q_reg + 1'b1;
    
    
endmodule

