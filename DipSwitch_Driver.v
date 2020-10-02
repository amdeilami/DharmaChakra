`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:				Shahid Beheshti University
// Engineer:			AmirMohammad Deilami
// 
// Create Date:		14:09:17 10/04/2017 
// Design Name: 	
// Module Name:		DipSwitch_Driver
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
module DipSwitch_Driver(
    input i_clk,
    input i_DipData,
    output [15:0] o_data,
    output o_DipLatch,
	 output [7:0] FiveButtons
    );
	 
	 	 
	integer counter=0;
	reg [15:0] o_data;
	reg o_DipLatch;
	reg [22:0] o_data_reg;
	//reg s3,s4,s5,s6,s7;
	reg [7:0] FiveButtons; //7 is s7 and so on

		initial
			begin
			o_DipLatch<=1'b1; //we won't send any data till the proper clock cycle
			end

	always@(posedge i_clk)
		begin
			o_DipLatch <= 1'b1;
			
				if(counter == 23)
				begin
				o_DipLatch<=1'b0;
				counter<=0;
				// o_data[15]<=i_DipData;
				// o_data[14:0]<=o_data_reg;
				


			  /* o_data[1] <= o_data_reg[5];
				o_data[2] <= o_data_reg[4];
				o_data[3] <= o_data_reg[3];
				o_data[4] <= o_data_reg[2];
				o_data[5] <= o_data_reg[1];
				o_data[6] <= o_data_reg[0];
				o_data[7] <= i_DipData;

				o_data[8] <= o_data_reg[14];
				o_data[9] <= o_data_reg[13];
				o_data[10] <= o_data_reg[12];
				o_data[11] <= o_data_reg[11];
				o_data[12] <= o_data_reg[10];
				o_data[13] <= o_data_reg[9];
				o_data[14] <= o_data_reg[8];
				o_data[15] <= o_data_reg[7];


				o_data[0] <= o_data_reg[6];*/
				
				o_data[8] <= o_data_reg[22];
				o_data[9] <= o_data_reg[21];
				o_data[10] <= o_data_reg[20];
				o_data[11] <= o_data_reg[19];
				o_data[12] <= o_data_reg[18];
				o_data[13] <= o_data_reg[17];
				o_data[14] <= o_data_reg[16];
				o_data[15] <= o_data_reg[15];
				
				o_data[0] <= o_data_reg[14];
				o_data[1] <= o_data_reg[13];
				o_data[2] <= o_data_reg[12];
				o_data[3] <= o_data_reg[11];
				o_data[4] <= o_data_reg[10];
				o_data[5] <= o_data_reg[9];
				o_data[6] <= o_data_reg[8];
				//o_data[7] <= i_DipData;
				o_data[7] <= o_data_reg[7];
				FiveButtons[7] <= o_data_reg[6]; // s7
				FiveButtons[6] <= o_data_reg[5]; //s6
				FiveButtons[5] <= o_data_reg[4];  //s5
				FiveButtons[4] <= o_data_reg[3];  //s4
				FiveButtons[3]	<= o_data_reg[2];  //s3
				FiveButtons[2]	<= o_data_reg[1]; 
				FiveButtons[1] <= o_data_reg[0];  
				FiveButtons[0] <= i_DipData;
				
		end

		else
			begin
			o_data_reg[22:1]<=o_data_reg[21:0];
			o_data_reg[0]<=i_DipData;
			counter<=counter+1;

			end
	end




endmodule
