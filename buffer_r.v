`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:16 03/30/2023 
// Design Name: 
// Module Name:    buffer_r 
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


module buffer_r( Clk, dataIn,RD, WR, rpaddr, dataOut, Rst,EMPTY); 

input  Clk,RD,WR,Rst;
input [1:0]rpaddr;
output  EMPTY; 

input [`BITWIDTH-1:0]dataIn;
output reg[`BITWIDTH-1:0] dataOut;

  assign EMPTY = (!WR)? 1'b1:1'b0;  //buffer empty status

reg[`BITWIDTH-1:0]mem[3:0];

always @(posedge Clk)
begin
 if(!Rst)begin
   if(WR && !RD) 
     mem[rpaddr]=dataIn;     //write to buffer
 else if(RD && !WR)
     dataOut=mem[rpaddr];     //Read from buffer
else
     dataOut=8'b0;
end
end

endmodule
