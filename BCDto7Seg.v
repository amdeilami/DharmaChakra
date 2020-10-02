`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:22:31 11/01/2017 
// Design Name: 
// Module Name:    BCDto7Seg 
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
module BCDto7Seg(
	input  [3:0] bcd,
	output [7:0] seg
	);
	
	reg [7:0] seg;

	always@(bcd) 
	begin
		case(bcd)   // FCAGBDEP			  ABCDEFGP
			0: seg = 8'b11101110;	//8'b11111100;
			1: seg = 8'b01001000;   //8'b01100000;
			2: seg = 8'b00111110;	//8'b11011010;
			3: seg = 8'b01111100;	//8'b11110010;
			4: seg = 8'b11011000;	//8'b01100110;
			5: seg = 8'b11110100;	//8'b10110110;
			6: seg = 8'b11110110;	//8'b10111110;
			7: seg = 8'b01101000;	//8'b11100000;
			8: seg = 8'b11111110;   //8'b11111110;
			9: seg = 8'b11111100;	//8'b11110110;
			default : seg = 8'b00000000;
		endcase
	end

endmodule