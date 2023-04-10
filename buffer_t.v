`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:07:51 03/30/2023 
// Design Name: 
// Module Name:    buffer_t 
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
module buffer_t( tClk, tdataIn,tRD, tWR, tpaddr, tdataOut,tRst,tEMPTY,ttxrdy); 

 input  tClk,tRD,tWR,tRst;
 input [1:0]tpaddr;
 output  tEMPTY,ttxrdy; 
 input [`BITWIDTH-1:0]tdataIn;
 output reg[`BITWIDTH-1:0] tdataOut;   

 assign tEMPTY = (!tWR && tRD)? 1'b0:1'b1; //buffer empty
 assign ttxrdy = (!tRst)? 1'b0:1'b1; //data buffer status
 

reg[`BITWIDTH-1:0]mem[3:0];

always @(posedge tClk)
begin
if(tRst)begin
  if(tWR && !tRD)begin 
   mem[tpaddr]=tdataIn;       //write to buffer
  end
else if(tRD)begin
 tdataOut=mem[tpaddr];      //Read from buffer
end
else;
end
end







endmodule
