`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:				Shahid Beheshti University
// Engineer:			AmirMohammad Deilami
// 
// Create Date:		14:09:17 10/04/2017 
// Design Name: 	
// Module Name:		Debouncer
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

//Search about button debouncing.
//You may use a device that does not require this module so read your device documentation
module Debouncer(

  input clk,
  input bounceSignal,
  output outCLK
    );

   integer countOne=0;
   integer countZero=0;
	reg	  outTemp=1;


  always @(posedge clk)
  begin
  
  if(bounceSignal==0)
	begin
		if(countZero>500000)
			begin
			countZero<=0;
			countOne<=0;
			outTemp<=0;
			end
		else
			begin
			countZero <= countZero+1;
			countOne	<= 0;
			end
	end
	
 else
	
 begin
		if(countOne>500000)
			begin
			countZero<=0;
			countOne<=0;
			outTemp<=1;
			end
		else
			begin
			countOne <= countOne+1;
			countZero	<= 0;
			end
			end


  end


	assign outCLK = outTemp;
	
endmodule
