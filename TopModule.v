`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:				Shahid Beheshti University
// Engineer:			AmirMohammad Deilami
// 
// Create Date:		14:09:17 10/04/2017 
// Design Name: 	
// Module Name:		TopModule 
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

module TopModule(
	 input 			i_CLK,					//Main clock signal of FPGA, coming from the crystal
    output 			o_PSCLK,					//output clock of FPGA that we send to other modules
    output 			o_LEDData,				//sends 16bit serial data to led's
    output 			o_LEDLatch,				//controls entrance of data in led's
    output 			o_DIPLatch,				//regarding to DIP switch
    input 			i_DIPData,				//input we enter to DIP switch
    output 			o_SEGData,				//regarding to Seven Segment
    output 			o_SEGLatch,				//controls 7segment
    output 			o_LCDData,
    output 			o_LCDLatch,				//same as above
    output 			o_Eth_RST,  
    input 			i_Eth_INT,
    output 			o_Eth_CS,
    output 			o_Eth_RD,
    output 			o_Eth_WR,
    output 			o_USB_SLOE,
    inout 			io_USB_IFCLK,
    output 			o_USB_SLRD,
    output 			o_USB_SLWR,
    inout [7:0] 	io_Data,
    inout [9:0] 	io_MuxEthUSB,
    output 			o_VGA_blue0,
    output 			o_VGA_blue1,
    output 			o_VGA_green0,
    output 			o_VGA_green1,
    output			o_VGA_red0,
    output 			o_VGA_red1,
    output 			o_VGA_vsync,
    output 			o_VGA_hsync,
    input 			i_SW1,
    input 			i_SW2,
    input 			i_SW3,
    input 			i_SW4,
    output 			o_TXD1,
    input 			i_RXD1,
    output 			o_TXD2,
    input 			i_RXD2,
    output 			o_MMC_SCK,
    input 			i_MMC_DO,
    output 			o_MMC_DI,
    output 			o_MMC_CS,
    input 			i_SYS_RESET
    );
	 
	//assign o_PSCLK = 1'bz;
	//assign o_LEDData = 1'bz;
	//assign o_LEDLatch = 1'bz;
	//assign o_DIPLatch = 1'bz;
	//assign o_SEGData = 1'bz;
	//assign o_SEGLatch = 1'bz;
	
	assign o_LCDData  =		1'bz;
	assign o_LCDLatch = 		1'bz;

	assign o_MMC_SCK	= 		1'bz;

	assign o_MMC_DI 	= 		1'bz;
	assign o_MMC_CS 	= 		1'bz;

	assign o_VGA_blue0 	= 	1'bz;
	assign o_VGA_blue1 	= 	1'bz;
	assign o_VGA_green0 	= 	1'bz;
	assign o_VGA_green1 	= 	1'bz;
	assign o_VGA_red0 	= 	1'bz;
	assign o_VGA_red1 	= 	1'bz;
	assign o_VGA_vsync 	= 	1'bz;
	assign o_VGA_hsync 	= 	1'bz;

	assign o_Eth_RST 		= 	1'bz;

	assign o_Eth_CS 		= 	1'bz;
	assign o_Eth_RD 		= 	1'bz;
	assign o_Eth_WR		= 	1'bz;
	assign o_USB_SLOE 	= 	1'bz;
	assign io_USB_IFCLK 	= 	1'bz;
	assign o_USB_SLRD 	= 	1'bz;
	assign o_USB_SLWR 	= 	1'bz;
	assign io_Data 		= 	8'bz;
	assign io_MuxEthUSB 	= 	10'bz;

	assign o_TXD1 = 1'bz;
	assign o_TXD2 = 1'bz;



	//assign o_SEGData = 1'bz;
	//assign o_SEGLatch = 1'bz;

	assign o_LCDData = 1'bz;
	assign o_LCDLatch = 1'bz;
	
	wire [15:0]			DiptoLED;
	wire					clk5M,clk20M,clk50M,clk100M;
	assign 				o_PSCLK= ~clk5M;
	wire [7:0] 			FiveButtons;
	reg  [7:0] 			PC;
	wire 					rstPC,DebouncedButton;
	wire [15:0] 		IR;
	wire [7:0]  		ShowOnSevenseg;
	wire [7:0]  		ExecutionResultinTop;
	wire [7:0]  		RegValue1;
	wire [7:0]  		RegValue2;
	wire					Show,WRinTop,S,Z,C,O;
	
	wire [2:0]  		Addr1;
	wire [2:0]			Addr2;
	wire [2:0]  		AddrWR;
	wire [4:0]  		AluOperation;
	
	wire [7:0]  		LEDInput;
	wire [15:0]  		LEDInput16;
	wire					SF,OF,ZF,CF;
	wire					DecodeSaidJump,JumpConfirmed;
	wire [7:0]  		JumpAddress;
	wire [7:0]  		FinalPC;
	wire [2:0]  		immediate;
	wire [7:0]  		ExecutionResultinTop2;
	wire					ShowRR;
	wire					FlagWR;
	wire					show_anyway;
	wire [15:0] 		LEDinput_final;
	wire [15:0] 		LEDInp;
	
	
	 assign show_anyway = Show | ShowRR;
    assign LEDInput    = Show ? ExecutionResultinTop : 8'b00000000;
	 assign LEDInput16  = ShowRR ? {ExecutionResultinTop,ExecutionResultinTop2} : 16'b0000000000000000;
	 assign FinalPC     = JumpConfirmed ? JumpAddress :(PC+8'b00000001);
	 assign LEDInp		  = Show ? {CF,SF,ZF,OF,4'b0000,LEDInput} : {ExecutionResultinTop,ExecutionResultinTop2};
	 assign LEDinput_final = show_anyway ? LEDInp : 16'b0000000000000000;

	
	 initial
	 begin
	 //Now everything starts! Program Counter initialized to refer to the first cell of instructions
	 PC = 0;
	 end
	
	  ClockGenerator CLKGenerator
   (// Clock in ports
    .CLK_IN1(i_CLK),      // IN
    // Clock out ports
    .CLK5M(clk5M),     // OUT
    .CLK20M(clk20M),     // OUT
    .CLK50M(clk50M),     // OUT
    .CLK100M(clk100M));    // OUT
	 
	 LED_Driver			LED_Driver
	 (.i_clk(clk5M),
	 .i_data(LEDinput_final),
	 .o_data(o_LEDData),
	 .o_latch(o_LEDLatch));
	 
	 //{12'b000000000000,OF,CF,SF,ZF}
	 
	 DipSwitch_Driver		Dip_Driver
	 (.i_clk(clk5M),
	 .i_DipData(i_DIPData),
	 .o_data(DiptoLED),
	 .o_DipLatch(o_DIPLatch),
     .FiveButtons(FiveButtons)
	  );
	  
	 
	 SevenSegDriver		SevengSegUUT
	 (.i_CLK(clk5M),
	 .i_Data({5'b00000,PC}),
	 .o_Data(o_SEGData),
	 .o_Latch(o_SEGLatch));
	 
	 Debouncer DebouncerUUT
	 (.clk(clk5M),
	 .bounceSignal(FiveButtons[7]),
	 .outCLK(DebouncedButton) );
	 
	  Debouncer DebouncerUUT2
	 (.clk(clk5M),
	 .bounceSignal(FiveButtons[6]),
	 .outCLK(rstPC) );
	 
	 InstructionMemory IMUUT(.addra(PC),
							 .ena(1'b1),
							 .clka(clk5M),
							 .douta(IR));
							 
	 Decoder DecoderUUT(.IR(IR),
				 .Addr1(Addr1),
				 .Addr2(Addr2),
				 .AluOperation(AluOperation),
				 .AddrWR(AddrWR),
				 .WR(WRinTop),
				 .Show(Show),
				 .JMP(DecodeSaidJump),
				 .JmpAddress(JumpAddress),
				 .immediate(immediate),
				 .ShowRR(ShowRR),
				 .FlagWR(FlagWR));
		
	 RegisterBank RegBankUUT(.Sin(S),
						.Cin(C),
						.Oin(O),
						.Zin(Z),
						.Addr1(Addr1),
						.Addr2(Addr2),
						.AddrWR(AddrWR),
						.Datain(ExecutionResultinTop),
						.CLK(DebouncedButton),
						.WR(WRinTop),
						.Out1(RegValue1),
						.Out2(RegValue2),
						.CF(CF),
						.OF(OF),
						.ZF(ZF),
						.SF(SF),
						.FlagWR(FlagWR));
						
	 Execution ExecutionUUT(
					.AluOperation(AluOperation),
					.Datain1(RegValue1),
					.Datain2(RegValue2),
					.Result(ExecutionResultinTop),
					.Result2(ExecutionResultinTop2),
					.S(S),
					.Z(Z),
					.O(O),
					.C(C),
					.ConditionalJump(JumpConfirmed),
					.Sin(SF),
					.Cin(CF),
					.Zin(ZF),
					.Oin(OF),
					.immediate(immediate),
					.dip_to_exe(DiptoLED[7:0]),
					.jump_address(JumpAddress));
	 

	 
	always @(negedge DebouncedButton ,negedge rstPC)
	begin
		if(rstPC==0)
			begin
			PC<=0;
			end
		else
		
			begin
			PC<=FinalPC;	
			end
	end

   

   

endmodule
