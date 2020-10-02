`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:				Shahid Beheshti University
// Engineer:			AmirMohammad Deilami
// 
// Create Date:		14:09:17 10/04/2017 
// Design Name: 	
// Module Name:		Decoder
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
module Decoder(
    input [15:0] IR,
    output reg [2:0] Addr1,
    output reg [2:0] Addr2,
	 output reg [2:0] AddrWR,
    output reg [4:0] AluOperation,
    output reg	      WR,
	 output reg	  	   Show,
	 output reg		   JMP,
	 output reg	[7:0] JmpAddress,
	 output reg [2:0] immediate,
	 output reg 		ShowRR,
	 output reg			FlagWR
    );
	 
	 

	always @(IR)
		begin
		
			if(IR[15] == 1)
				begin
				
				
					case ( IR [14:11] )
					
					4'b0000: //JE
					begin
					AluOperation <= 5'b10111;
					JmpAddress <= IR [7:0];
					Show <= 1'b0;
					WR <=1'b0;
					JMP <= 1'b1;
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					4'b0001: //JB
					begin
					AluOperation <= 5'b11000;
					JmpAddress <= IR [7:0];
					Show <= 1'b0;
					WR <=1'b0;
					JMP <= 1'b1;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					4'b0010: //JA
					begin
					AluOperation <= 5'b11001;
					JmpAddress <= IR [7:0];
					Show <= 1'b0;
					WR <=1'b0;
					JMP <= 1'b1;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					4'b0011: //JL
					begin
					AluOperation <= 5'b11010;
					JmpAddress <= IR [7:0];
					Show <= 1'b0;
					WR <=1'b0;	
					JMP <= 1'b1;
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					4'b0100: //JG
					begin
					AluOperation <= 5'b11011;
					JmpAddress <= IR [7:0];
					Show <= 1'b0;
					WR <=1'b0;
					JMP <= 1'b1;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					
					4'b0101: //JUMP
					begin
					AluOperation <= 5'b11100;
					JmpAddress <= IR [7:0];
					Show <= 1'b0;
					WR <=1'b0;	
					JMP <= 1'b1;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					
					4'b0110: //LDI
					begin
					AluOperation <= 5'b11101;
					JmpAddress <= IR [7:0]; // in this case , jmpaddress is the immediate
					AddrWR <= IR[10:8];
					Show <= 1'b0;
					WR <=1'b1;
					JMP <= 1'b0;
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
				
				
					endcase
				
			end
			
			
		
		
		
		  else
		  
				begin
				
					case ( IR [14:6] )
					
					
					9'b000000000: //NOP
					begin
					AluOperation <= 5'b00000;
					Show <= 1'b0;
					Addr1 <= IR[5:3];
					Addr2 <= IR[2:0];
					AddrWR <= IR[5:3];
					WR <=1'b0;	
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					
					9'b000000001 : 
					begin 
					AluOperation <= 5'b00001;  //ADD
					Addr2 <= IR[2:0]; 
					Addr1 <= IR[5:3]; 
					AddrWR <= IR[5:3];
					Show <= 1'b0; 
					WR <=1'b1; 
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end 
					
					
					9'b000000010: //AND
					begin
					AluOperation <= 5'b00010;
					Addr1 <= IR[5:3];
					Addr2 <= IR[2:0];
					AddrWR <= IR[5:3];
					Show <= 1'b0;
					WR <=1'b1;
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					9'b000000011: //SUB
					begin
					AluOperation <= 5'b00011;
					Show <= 1'b0;
					Addr1 <= IR[5:3];
					Addr2 <= IR[2:0];
					AddrWR <= IR[5:3];
					WR <=1'b1;	
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					
					9'b000000100: //OR
					begin
					AluOperation <= 5'b00100;
					Show <= 1'b0;
					Addr1 <= IR[5:3];
					Addr2 <= IR[2:0];
					AddrWR <= IR[5:3];
					WR <=1'b1;
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					
					9'b000000101: //XOR
					begin
					AluOperation <= 5'b00101;
					Show <= 1'b0;
					Addr1 <= IR[5:3];
					Addr2 <= IR[2:0];
					AddrWR <= IR[5:3];
					WR <=1'b1;	
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					
					9'b000000110: //MOV
					begin
					AluOperation <= 5'b00110;
					Show <= 1'b0;
					Addr1 <= IR[5:3];
					Addr2 <= IR[2:0];
					AddrWR <= IR[5:3];
					WR <=1'b1;
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					9'b000000111: //ADC
					begin
					AluOperation <= 5'b00111;
					Show <= 1'b0;
					Addr1 <= IR[5:3];
					Addr2 <= IR[2:0];
					AddrWR <= IR[5:3];
					WR <=1'b1;	
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end


					9'b000001000: //NOT
					begin
					AluOperation <= 5'b01000;
					Show <= 1'b0;
					Addr1 <= IR[5:3];
					Addr2 <= IR[2:0];
					AddrWR <= IR[5:3];
					WR <=1'b1;	
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end						


					9'b000001001: //SAR
					begin
					AluOperation <= 5'b01001;
					Show <= 1'b0;
					Addr1 <= IR[5:3];
					immediate <= IR[2:0];
					AddrWR <= IR[5:3];
					WR <=1'b1;	
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					

					9'b000001010: //SLR Reg
					begin
					AluOperation <= 5'b01010;
					Show <= 1'b0;
					Addr1 <= IR[5:3];
					immediate <= IR[2:0];
					AddrWR <= IR[5:3];
					WR <=1'b1;	
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					

					9'b000001011: //SAL Reg
					begin
					AluOperation <= 5'b01011;
					Show <= 1'b0;
					Addr1 <= IR[5:3];
					immediate <= IR[2:0];
					AddrWR <= IR[5:3];
					WR <=1'b1;
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					
					9'b000001100: //SLL
					begin
					AluOperation <= 5'b01100;
					Show <= 1'b0;
					Addr1 <= IR[5:3];
					immediate <= IR[2:0];
					AddrWR <= IR[5:3];
					WR <=1'b1;	
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					
					9'b000001101: //ROL
					begin
					AluOperation <= 5'b01101;
					Show <= 1'b0;
					Addr1 <= IR[5:3];
					immediate <= IR[2:0];
					AddrWR <= IR[5:3];
					WR <=1'b1;	
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					9'b000001110: //ROR
					begin
					AluOperation <= 5'b01110;
					Show <= 1'b0;
					Addr1 <= IR[5:3];
					immediate <= IR[2:0];
					AddrWR <= IR[5:3];
					WR <=1'b1;
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					9'b000001111: //INC
					begin
					AluOperation <= 5'b01111;
					Show <= 1'b0;
					Addr1 <= IR[5:3];
					Addr2 <= IR[2:0];
					AddrWR <= IR[5:3];
					WR <=1'b1;	
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					9'b000010000: //DEC
					begin
					AluOperation <= 5'b10000;
					Show <= 1'b0;
					Addr1 <= IR[5:3];
					Addr2 <= IR[2:0];
					AddrWR <= IR[5:3];
					WR <=1'b1;
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
	
					
					9'b000010010 :  //SHOW R
					begin 
					AluOperation <= 5'b10010;
					Show <= 1'b1;
					Addr1 <= IR[5:3];
					WR <=1'b0; 
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b0;
					end
					
					9'b000010011: //SHOW RR
					begin
					AluOperation <= 5'b10011;
					Show <= 1'b0;
					Addr1 <= IR[5:3];
					Addr2 <= IR[2:0];
					AddrWR <= IR[5:3];
					WR <=1'b0;	
					JMP <= 1'b0;	
					ShowRR <= 1'b1;
					FlagWR <= 1'b0;
					end
					
					9'b000010100: //LoadDipR
					begin
					AluOperation <= 5'b10100;
					Show <= 1'b0;
					Addr1 <= IR[5:3];
					Addr2 <= IR[2:0];
					AddrWR <= IR[5:3];
					WR <=1'b1;	
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					9'b000010110: //CMP
					begin
					AluOperation <= 5'b10110;
					Show <= 1'b0;
					Addr1 <= IR[5:3];
					Addr2 <= IR[2:0];
					AddrWR <= IR[5:3];
					WR <=1'b0;	
					JMP <= 1'b0;	
					ShowRR <= 1'b0;
					FlagWR <= 1'b1;
					end
					
					
					endcase;
				end
	
	
	
		end


endmodule
