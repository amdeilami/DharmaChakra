`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:23:29 11/01/2017 
// Design Name: 
// Module Name:    BinaryToBCD 
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
module BinaryToBCD(
	input  [12:0] binary,
	output reg [3:0]  Thousands, 
					  Hundreds, 
					  Tens, 
					  Ones
	);
	
	integer i;
	always@(binary) 
	begin
		Thousands = 4'd0;
		Hundreds = 4'd0;
		Tens = 4'd0;
		Ones = 4'd0;
		
		for (i = 12; i >= 0; i = i - 1)
		begin
			if (Thousands >= 5)
				Thousands = Thousands + 3;
			if (Hundreds >= 5)
				Hundreds = Hundreds + 3;
			if (Tens >= 5)
				Tens = Tens + 3;
			if (Ones >= 5)
				Ones = Ones + 3;
				
			Thousands = Thousands << 1;
			Thousands[0] = Hundreds[3];
			Hundreds = Hundreds << 1;
			Hundreds[0] = Tens[3];
			Tens = Tens << 1;
			Tens[0] = Ones[3];
			Ones = Ones << 1;
			Ones[0] = binary[i];
		end
	end

endmodule