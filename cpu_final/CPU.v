`timescale 1ns / 1ns
module CPU (
  clock,
  reset,
  start,
  program_counter
);
	//input
   input clock, reset, start;
   input [31:0]  program_counter;
	//Internal
   wire [3:0] ALU_Control;
   wire [4:0] regfile_read_sel1, regfile_read_sel2, regfile_write_sel, reg_write_addr;
	wire [31:0] instruction;
   wire [31:0] ReadData1, ReadData2, ALU_result, Reg_Write, MemReadData, Sign_Extend, IM_Address, ALU_operand_B;
   wire ALU_zero, MemWrite, MemRead, MemtoReg, RegWrite, RegDst;

	//Instruction Fetch Components.
	
    PC my_Program_Counter(
            .clock       (clock     ),
            .reset     (reset     ),
            .Branch    (Branch    ),
            .Zero      (ALU_zero  ),
            .extended  (Sign_Extend  ),
            .IM_Address(IM_Address)
    );
	 
	   Memory my_Instruction_Memory (
        .clock    (           ),
        .Address  (IM_Address ),
        .MemRead  (1'b1       ),
        .ReadData (instruction),
        .MemWrite (1'b0       ),
        .writeData(           )
    ); 
	//Instruction Decode
   Control_Unit my_Control_Unit (
        .instruction(instruction      ),
        .ALU_Control(ALU_Control      ),
        .read_sel1  (regfile_read_sel1),
        .read_sel2  (regfile_read_sel2),
        .write_sel  (regfile_write_sel),
          .extended   (Sign_Extend         ),
          .Branch     (Branch           ),
          .ALUSrc     (ALUSrc           ),
          .RegWrite   (RegWrite         ),
          .RegDst     (RegDst           ),
			 .MemRead    (MemRead          ),
          .MemtoReg   (MemtoReg         ),
          .MemWrite   (MemWrite         )
    );

    MUX_2x1_5b my_Register_Multiplexer (
            .Zero   (regfile_read_sel2),
            .One    (regfile_write_sel),
            .Control(RegDst           ),
            .Out    (reg_write_addr   )
            );

   registerFile my_RegisterFile (
        .clock     (clock            ),
        .reset     (reset            ),
        .read_sel1 (regfile_read_sel1),
        .read_sel2 (regfile_read_sel2),
        .write     (RegWrite         ),
        .write_sel (reg_write_addr   ),
        .write_data(Reg_Write        ),
        .read_data1(ReadData1        ),
        .read_data2(ReadData2        )
    );

	//Operation Components
    MUX_2x1_32b my_ALU_Multiplexer(
        .Zero   (ReadData2    ),
        .One    (Sign_Extend     ),
        .Control(ALUSrc       ),
        .Out    (ALU_operand_B)
    );   
   
   ALU my_ALU_Unit(
        .ALU_Control(ALU_Control  ),
        .operand_A  (ReadData1    ),
        .operand_B  (ALU_operand_B),
        .ALU_result (ALU_result   ),
        .zero       (ALU_zero     )
    );

  //Writeback Components
    Memory my_Data_Memory (
        .clock    (clock      ),
        .Address  (ALU_result ),
        .MemRead  (MemRead    ),
        .ReadData (MemReadData),
        .MemWrite (MemWrite   ),
        .writeData(ReadData2  )
    );

    MUX_2x1_32b my_Writeback_Multiplexer(
        .Zero   (ALU_result ),
        .One    (MemReadData),
        .Control(MemtoReg   ),
        .Out    (Reg_Write  )
    );
     
endmodule