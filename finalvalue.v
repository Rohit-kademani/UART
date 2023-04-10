`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:23:50 03/30/2023 
// Design Name: 
// Module Name:    finalvalue 
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
module finalvalue(clock,clk);
input clock;
output reg clk=1'b0;

reg [23:0] count=24'b11;

always @(posedge clock)
begin
if(count==999999)
begin
count=24'b0;

clk=~clk;
end

else
begin
count=count+1'b1;
end
end



endmodule
