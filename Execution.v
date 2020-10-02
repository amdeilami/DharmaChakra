`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:				Shahid Beheshti University
// Engineer:			AmirMohammad Deilami
// 
// Create Date:		14:09:17 10/04/2017 
// Design Name: 	
// Module Name:		Execution
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
module Execution
	(
    input 	[4:0] AluOperation,
    input 	[7:0] Datain1,
    input 	[7:0] Datain2,
    output 	[7:0] Result,
	 output 	[7:0] Result2,
    output reg 	S,
    output reg 	Z,
    output reg 	C,
    output reg 	O,
	 output reg		ConditionalJump,
	 input			Sin,
	 input			Zin,
	 input			Cin,
	 input			Oin,
	 input [2:0] 	immediate,
	 input [7:0] 	dip_to_exe,
	 input [7:0] 	jump_address
    );
	 
	 reg	[8:0]		TempResult;
	 reg	[7:0]		result2_temp;
	 

	 

	 always @(AluOperation	,	Datain1	,	Datain2)
	 
		 begin
		 
			 case( AluOperation[4:0] )
			 
				5'b00000: //NOP
				
					begin
					S<=Sin; 
					C<=Cin; 
					Z<=Zin;
					O<=Oin;
					ConditionalJump <= 1'b0;
					end
				 
			 
				5'b00001: //ADD
				
					begin 
						TempResult<= Datain1 + Datain2; 
						S<=TempResult[7]; 
						C<=TempResult[8]; 
						Z<=~(|TempResult[7:0]);
						O<=TempResult[8] ^ TempResult[7] ^ Datain1[7] ^ Datain2[7];
						ConditionalJump <= 1'b0;
					end
				 
				5'b00010: //AND 
				
					begin 
						TempResult<= Datain1 & Datain2; 
						S<=TempResult[7]; 
						C<=1'b0; 
						Z<=~(|TempResult[7:0]);
						O<=1'b0;
						ConditionalJump <= 1'b0;
					end
				 
				 
				5'b00011: //SUB
				
					begin 
						TempResult<= Datain1 + (~(Datain2)+1); 
						S<=TempResult[7]; 
						C<=TempResult[8]; 
						Z<=~(|TempResult[7:0]);
						O<=TempResult[8] ^ TempResult[7] ^ Datain1[7] ^ Datain2[7];
						ConditionalJump <= 1'b0;
					end
				 
				 
				 5'b00100: //OR
				 begin 
				 TempResult<= Datain1 | Datain2; 
				 S<=TempResult[7]; 
				 C<=1'b0; 
				 Z<=~(|TempResult[7:0]);
				 O<=1'b0;
				 ConditionalJump <= 1'b0;
				 end
				 
				 
				 5'b00101: //XOR
				 begin 
				 TempResult<= Datain1 ^ Datain2; 
				 S<=TempResult[7]; 
				 C<=1'b0; 
				 Z<=~(|TempResult[7:0]);
				 O<=1'b0;
				 ConditionalJump <= 1'b0;
				 end
				 
				 
				 5'b00110: //MOV
				 begin 
				 TempResult<= Datain2; 
				 S<=Sin; 
				 C<=Cin; 
				 Z<=Zin;
				 O<=Oin;
				 ConditionalJump <= 1'b0;
				 end
				 
				 5'b00111: //ADC
				 begin 
				 TempResult<= Datain1 + Cin; 
				 S<=TempResult[7]; 
				 C<=TempResult[8]; 
				 Z<=~(|TempResult[7:0]);
				 O<=TempResult[8] ^ TempResult[7] ^ Datain1[7] ^ Datain2[7];
				 ConditionalJump <= 1'b0;
				 end
				 
				 
				 5'b01000: //NOT
				 begin 
				 TempResult<= ~Datain1;
				 S<=Sin; 
				 C<=Cin; 
				 Z<=Zin;
				 O<=Oin;				 
				 ConditionalJump <= 1'b0;
				 end
				 
				 5'b01001: //SAR
				 begin 
				 TempResult<= (Datain1 >>> immediate); 
				 S<=TempResult[7]; 
				 if(immediate != 0)
				 begin
				 C <= Datain1[immediate-1];
				 end
				 Z<=~(|TempResult[7:0]);
				 O<=Datain1[7] ^ TempResult[7];
				 ConditionalJump <= 1'b0;
				 end
				 
				 5'b01010: //SLR
				 begin 
				 TempResult<= (Datain1 >> immediate); 
				 S<=TempResult[7]; 
				 if(immediate != 0)
				 begin
				 C <= Datain1[immediate-1];
				 end
				 Z<=~(|TempResult[7:0]);
				 O<=Datain1[7] ^ TempResult[7];
				 ConditionalJump <= 1'b0;
				 end
				 
				 5'b01011: //SAL
				 begin 
				 TempResult<= (Datain1 <<< immediate); 
				 S<=TempResult[7]; 
				 if(immediate != 0)
				 begin
				 C <= Datain1[8-immediate];
				 end
				 Z<=~(|TempResult[7:0]);
				 O<=Datain1[7] ^ TempResult[7];
				 ConditionalJump <= 1'b0;
				 end
				 
				 5'b01010: //SLL
				 begin 
				 TempResult<= (Datain1 << immediate); 
				 S<=TempResult[7]; 
				 if(immediate != 0)
				 begin
				 C <= Datain1[8-immediate];
				 end
				 Z<=~(|TempResult[7:0]);
				 O<=Datain1[7] ^ TempResult[7];
				 ConditionalJump <= 1'b0;
				 end
				 
				 
				 5'b01101: //ROL
				 begin
				 TempResult<= (Datain1 << immediate) | (Datain1 >> (~immediate));
				 S<=TempResult[7]; 
				 if(immediate != 0)
				 begin
				 C <= Datain1[8-immediate];
				 end
				 Z<=~(|TempResult[7:0]);
				 O<=Datain1[7] ^ TempResult[7];
				 ConditionalJump <= 1'b0;
				 end
				 
				 
				 5'b01110: //ROR
				 begin
				 TempResult<= (Datain1 >> immediate) | (Datain1 << (~immediate));
				 S<=TempResult[7]; 
				 if(immediate != 0)
				 begin
				 C <= Datain1[immediate-1];
				 end
				 Z<=~(|TempResult[7:0]);
				 O<=Datain1[7] ^ TempResult[7];
				 ConditionalJump <= 1'b0;
				 end
				 
				 
				 
			 5'b01111: //INC
				 begin 
				 TempResult<= Datain1 + 1; 
				 S<=TempResult[7];
				 C<=TempResult[8]; 
				 Z<=~(|TempResult[7:0]);
				 O<=TempResult[8] ^ TempResult[7] ^ Datain1[7] ^ 0;
				 ConditionalJump <= 1'b0;
				 end
				 
				 
			 5'b10000: //DEC
				 begin 
				 TempResult<= Datain1 + 8'b11111111; 
				 S<=TempResult[7]; 
				 C<=TempResult[8]; 
				 Z<=~(|TempResult[7:0]);
				 O<=TempResult[8] ^ TempResult[7] ^ Datain1[7] ^ 1;
				 ConditionalJump <= 1'b0;
				 end
				 
				 

			 
				 
			 5'b10010: //SHOWR
				 begin	
				 TempResult <= Datain1;
				 S<=Sin; 
				 C<=Cin; 
				 Z<=Zin;
				 O<=Oin;
				 ConditionalJump <= 1'b0;
				 end
				 
				 
				 
			    5'b10011: //SHOWRR
				 begin 
				 TempResult<= Datain1;
				 result2_temp <= Datain2;
				 S<=Sin; 
				 C<=Cin; 
				 Z<=Zin;
				 O<=Oin;
				 ConditionalJump <= 1'b0;
				 end
				 
			    5'b10100: //LoadDipR
				 begin 
				 TempResult<= dip_to_exe;
				 S<=Sin; 
				 C<=Cin; 
				 Z<=Zin;
				 O<=Oin;
				 ConditionalJump <= 1'b0;
				 end
				 
				 5'b10110: //CMP
				 begin 
				 TempResult<= Datain1 - Datain2; 
				 S<=TempResult[7]; 
				 C<=TempResult[8]; 
				 Z<=~(|TempResult[7:0]);
				 O<=TempResult[8] ^ TempResult[7] ^ Datain1[7] ^ Datain2[7];
				 ConditionalJump <= 1'b0;
				 end
				 
				5'b11101: //LI
				 begin 
				 TempResult<= jump_address; 
				 S<=Sin; 
				 C<=Cin; 
				 Z<=Zin;
				 O<=Oin;
				 ConditionalJump <= 1'b0;
				 end
				 
				 
				 5'b10111: //JE
				 begin 
				 
				 ConditionalJump <= 1'b0;
				 if(Zin == 1)
				 begin
				 ConditionalJump <= 1'b1;
				 end
				 S<=Sin; 
				 C<=Cin; 
				 Z<=Zin;
				 O<=Oin;	
				 
				 end
				 
				 5'b11000: //JB
				 begin 
				 
				 ConditionalJump <= 1'b0;
				 if(Cin == 1)
				 begin
				 ConditionalJump <= 1'b1;
				 end
				 
				 S<=Sin; 
				 C<=Cin; 
				 Z<=Zin;
				 O<=Oin;	
				 end
				 
				 
				 5'b11001: //JA
				 begin 
				 
				 ConditionalJump <= 1'b0;
				 if(Cin == 0 )
				 begin
				 
					if(Zin == 0)
					begin
				   ConditionalJump <= 1'b1;
					end
				 S<=Sin; 
				 C<=Cin; 
				 Z<=Zin;
				 O<=Oin;	
				 end
				 
				 end
				 
				 5'b11010: //JL
				 begin 
				 
				 ConditionalJump <= 1'b0;
				 if(Sin != Oin )
				 begin
				 ConditionalJump <= 1'b1;
				 end
				 S<=Sin; 
				 C<=Cin; 
				 Z<=Zin;
				 O<=Oin;	
				 
				 end
				 
				 5'b11011: //JG
				 begin 
				 
				 ConditionalJump <= 1'b0;
				 if(Sin == Oin )
				 begin
					 if(Zin == 0)
					 begin
					 ConditionalJump <= 1'b1;
					 end
				 end
				 S<=Sin; 
				 C<=Cin; 
				 Z<=Zin;
				 O<=Oin;	
				 
				 end
				 
				 
				 
				 5'b11100: //JMP
				 begin
				 S<=Sin; 
				 C<=Cin; 
				 Z<=Zin;
				 O<=Oin;				 
				 ConditionalJump <= 1'b1;
				 end
				 
				 
			 
			 endcase
		 

		 end
		 
	 assign Result [7:0] = TempResult[7:0];
	 assign Result2 [7:0] = result2_temp;



endmodule
