`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:				Shahid Beheshti University
// Engineer:			AmirMohammad Deilami
// 
// Create Date:		14:09:17 10/04/2017 
// Design Name: 	
// Module Name:		RegisterBank
// Project Name: 		8-bit Processor
// Target Devices:	Xilinx Spartan6 - XC6SLX9
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 1.01 - Comments revised
// Additional Comments: Feel free to add new features! Just be sure to actually test your changes on hardware before sharing.
//
//////////////////////////////////////////////////////////////////////////////////
module RegisterBank
	(
	 input			 Cin,
	 input			 Oin,
	 input			 Sin,
	 input		 	 Zin,
    input [2:0] 	 Addr1,
    input [2:0] 	 Addr2,
    input [2:0] 	 AddrWR,
    input [7:0] 	 Datain,
    input 		 	 CLK,
    input 	    	 WR,
    output reg  [7:0] Out1,
    output reg  [7:0] Out2,
	 output reg	  	 CF,
	 output reg	  	 OF,
	 output reg	  	 SF,
	 output reg	  	 ZF,
	 input		 	 FlagWR
    );
	 
	 
	 reg [7:0] RegBank [0:7];
	 reg		  C,O,S,Z;
	 
	 initial
	 begin
	// RegBank[0] <= 8'b00000000;
	// RegBank[1] <= 8'b11111110;
	 RegBank[0] <= 8'b00001000;
	 RegBank[1] <= 8'b00000110;
	 RegBank[2] <= 8'b00000010;
	 RegBank[3] <= 8'b00000011;
	 RegBank[4] <= 8'b00000100;
	 RegBank[5] <= 8'b00000101;
	 RegBank[6] <= 8'b00000110;
	 RegBank[7] <= 8'b00000011;
	 C				<= 1'b0;
	 O				<= 1'b0;
	 S				<= 1'b0;
	 Z				<= 1'b0;	 
	 end
	 
	
	always @(posedge CLK)
	begin
	Out1 = RegBank[Addr1];
	Out2 = RegBank[Addr2];
	OF = O;
	CF = C;
	ZF = Z;
	SF = S;
	end
	

	 
	 always @(negedge CLK)
		 begin
		 
				if(WR)			//if WR then an update takes place into register(s)
				
					begin
					RegBank[AddrWR] <= Datain;
					end
					
				if(FlagWR)		//if FlagWr then flags must be updated
					begin
					O					 <= Oin;
					C					 <= Cin;
					S					 <= Sin;
					Z					 <= Zin;
					end
		 
		 end
		 
		// assign OF = O;
		// assign CF = C;
		// assign ZF = Z;
		// assign SF = S;


endmodule
