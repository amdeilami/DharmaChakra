`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:				Shahid Beheshti University
// Engineer:			AmirMohammad Deilami
// 
// Create Date:		14:09:17 10/04/2017 
// Design Name: 	
// Module Name:		LED_Driver 
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

module 	LED_Driver(
			input i_clk,
			input [15:0] i_data,
			output o_data,
			output o_latch
    );
	 
		integer 			counter = 0;
		reg [0:15] 		shiftReg;
		reg 				o_latch,o_data;

			initial
			
				begin
					o_latch<=1'b1;
				end
							
				
			always@(posedge i_clk)

				begin

				o_latch <= 1'b1;
						if(counter == 15)
								begin
								shiftReg[0:7] <= i_data[7:0];
								shiftReg[8:15] <= i_data[15:8];
								o_latch <= 1'b0;
								counter <= 0;
								o_data <= shiftReg[0];
								end
						else
								begin
								o_data <= shiftReg[0];
								shiftReg[0:14] <= shiftReg[1:15];
								counter <= counter + 1;		
								end
	
				end

endmodule
