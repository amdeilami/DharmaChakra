`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:				Shahid Beheshti University
// Engineer:			AmirMohammad Deilami
// 
// Create Date:		14:09:17 10/04/2017 
// Design Name: 	
// Module Name:		SevenSegDriver
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

/*module SevenSegDriver(
    input i_clk,
    input [12:0] i_binary,
    output o_data,
    output o_latch
    );

    wire [15:0] number_out [0:3];	 
 	 reg [1:0] Counter = 0;
	integer Counter=0;
	 reg [15:0] finalOut=16'b0010000000000100;
	 
	 ToSegment to_seg(.i_data(i_binary),.o_data_0(number_out[3]), .o_data_1(number_out[2]), .o_data_2(number_out[1]), .o_data_3(number_out[0]));
	 
	 LED_Driver LED_Driver_uut(.i_clk(i_clk), .i_data(finalout) number_out[Counter], .o_data(o_data), .o_latch(o_latch));
	 
	 always @(posedge o_latch) when latch becomes 1 , we have to put the next value to piso driver
    Counter = Counter + 1;
	 
	 always @(posedge i_clk)
	 begin
	 if(Counter==16)
	 finalOut<=number_out[0];
	 
	 if(Counter==32)
	 finalOut<=number_out[1];
	 if(Counter==48)
	 finalOut<=number_out[2];
	 if(Counter==64)
	 begin
	 finalOut<=number_out[3];
	 Counter=0;
	 end
	 Counter=Counter+1;
	 end
	 
	 
	 

endmodule */

module SevenSegDriver(
	input 		 i_CLK,
	input [12:0] i_Data,
	output 		 o_Data, 
   output 	    o_Latch
	);
	
	integer loopNum = 0;
	reg o_Latch, o_Data;
	wire [63:0] storeReg;
	reg temp, temp_latch;

	initial
	begin
		o_Latch <= 1'b1;
	end
	
	wire [3:0] Thousands, Hundreds, Tens, Ones;

	BinaryToBCD instance_tobcd(            							     
		.binary(i_Data),               				 
      .Thousands(Thousands),
		.Hundreds(Hundreds),
		.Tens(Tens),
		.Ones(Ones)
		);
	
	BCDto7Seg instance_toseg_1(            							     
		.bcd(Thousands),               				 
      .seg(storeReg[15:8])
		);
	BCDto7Seg instance_toseg_2(            							     
		.bcd(Hundreds),               				 
      .seg(storeReg[31:24])
		);
	BCDto7Seg instance_toseg_3(            							     
		.bcd(Tens),               				 
      .seg(storeReg[47:40])
		);
	BCDto7Seg instance_toseg_4(            							     
		.bcd(Ones),               				 
      .seg(storeReg[63:56])
		);
		
	assign storeReg[7:0] = 8'b00000100;
	assign storeReg[23:16] = 8'b00001000;
	assign storeReg[39:32] = 8'b00100000;
	assign storeReg[55:48] = 8'b01000000;
	
	always@(posedge i_CLK)
	begin
		if(loopNum >= 0 && loopNum < 15)
		begin
			temp_latch <= 1'b1;
			temp <= storeReg[loopNum];
			loopNum <= loopNum + 1;		
		end
		else if(loopNum >= 16 && loopNum < 31)
		begin
			temp_latch <= 1'b1;
			temp <= storeReg[loopNum];
			loopNum <= loopNum + 1;
		end
		else if(loopNum >= 32 && loopNum < 47)
		begin
			temp_latch <= 1'b1;
			temp <= storeReg[loopNum];
			loopNum <= loopNum + 1;
		end
		else if(loopNum >= 48 && loopNum < 63)
		begin
			temp_latch <= 1'b1;
			temp <= storeReg[loopNum];
			loopNum <= loopNum + 1;
		end
		else if(loopNum == 15)
		begin
			temp_latch <= 1'b0;
			temp <= storeReg[loopNum];
			loopNum <= loopNum + 1;
		end
		else if(loopNum == 31)
		begin
			temp_latch <= 1'b0;
			temp <= storeReg[loopNum];
			loopNum <= loopNum + 1;
		end
		else if(loopNum == 47)
		begin
			temp_latch <= 1'b0;
			temp <= storeReg[loopNum];
			loopNum <= loopNum + 1;
		end
		else if(loopNum == 63)
		begin
			temp_latch <= 1'b0;
			temp <= storeReg[loopNum];
			loopNum <= 0;
		end
		
		o_Data <= temp;
		o_Latch <= temp_latch;		
	end

endmodule


