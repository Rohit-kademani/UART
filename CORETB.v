`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:27:27 04/01/2023
// Design Name:   UAPBCORE
// Module Name:   C:/Users/aec/Desktop/UART_S/CORETB.v
// Project Name:  UART_S
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UAPBCORE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CORETB;

	// Inputs
	reg PCLK;
	reg PRESETN;
	reg PSEL;
	reg PENABLE;
	reg [1:0] PADDR;
	reg PWRITE;
	reg [7:0] PWDATA;
	reg RX;

	// Outputs
	wire [7:0] PRDATA;
	wire PREADY;
	wire TX;
	wire TXRDY;
	wire RXRDY;
	wire [7:0] DATAOUT;
	wire s_tick;

	// Instantiate the Unit Under Test (UUT)
	UAPBCORE uut (
		.PCLK(PCLK), 
		.PRESETN(PRESETN), 
		.PSEL(PSEL), 
		.PENABLE(PENABLE), 
		.PADDR(PADDR), 
		.PWRITE(PWRITE), 
		.PWDATA(PWDATA), 
		.PRDATA(PRDATA), 
		.PREADY(PREADY), 
		.RX(RX), 
		.TX(TX), 
		.TXRDY(TXRDY), 
		.RXRDY(RXRDY), 
		.DATAOUT(DATAOUT), 
		.s_tick(s_tick)
	);

	always #1 PCLK=~PCLK;
	initial begin
		// Initialize Inputs
		PCLK = 1;
		PRESETN = 0;
		PSEL = 0;
		PENABLE = 0;
		PADDR = 0;
		PWRITE = 0;
		PWDATA = 0;
		RX = 1;

		#16;
		
		PRESETN=1'b0;
		#32;
/////////////////////////////////////		
		PWRITE=1;
		PSEL=1;
		#32;
		PWDATA=8'b1101;
		PADDR=2'b00;
		PENABLE=1;
		#32;
		PWRITE=0;
		PSEL=0;
		PENABLE=0;
		#32;
/////////////////////////////////////////
      PRESETN = 1'b0;
      PWRITE=1;
		PSEL=1;
		#32;
		PWDATA=8'b0;
		PADDR=2'b01;
		PENABLE=1;
		#32;
		PWRITE=0;
		PSEL=0;
		PENABLE=0;
		#32;
//////////////////////////////////////////		
      PWRITE=1;
		PSEL=1;
		#32;
		PWDATA=8'h9a;
		PADDR=2'b10;
		PENABLE=1;
		#32;
		PWRITE=0;
		PSEL=0;
		PENABLE=0;
		#64;
///////////////////////////////////////
      
////////////////////////////////////////
      PRESETN=1'b0;
		#32;
      PWRITE=1;
		#110000;
		PWRITE=0;
		#48;
		#40000;
////////////////////////////////////////		
		RX=1'b0;
      #7186;
      
		RX=1'b1;
      #7168;
      RX=1'b0;
      #7168;
      RX=1'b1;
      #7168;
      RX=1'b0;
      #7168;
      RX=1'b1;
      #7168;
      RX=1'b0;
      #7168;
      RX=1'b1;
      #7168;
      RX=1'b0;
      #7168;
      
      RX=1'b1;
      #7168;		
		PENABLE=1;
		#32;
		PENABLE=0;
		#16;
	//////////////////////////////////////
      PRESETN=1;
      #32;
      PWRITE=0;
      PSEL=1;
      #32;
      PADDR=2'b11;
      PENABLE=1;
      #32;
      
      PWRITE=0;
      PSEL=0;
      PENABLE=0;
      #32;
		#50000;
//////////////////////////////////// 		
$finish;		

	end
      
endmodule
