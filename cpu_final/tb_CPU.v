`timescale 1ns / 1ns
/** @module : CPU
 *  @author : Albert Bitdiddle
 *  CPU Module Testbed
 *  Adaptive and Secure Computing Systems (ASCS) Laboratory
 */


module tb_CPU ();
reg clock, reset, start;
reg [31:0] program_counter; 


CPU cpu (
    .clock(clock),
    .reset(reset),
    .start(start),
    .program_counter(program_counter)
);    

    // In phase I, we are not implementing the instruction memory. Therefore, we manually the instruction, the register
    // in the CPU.v It is implemented as a register right now, but you will eventually want to change it to a wire and
    // drive it from instruction memory.

    // Clock generator
    always #1 clock = ~clock;

    initial begin
        clock = 0;
        reset = 1;
        start = 0;
       
         
          #10 program_counter = 32'b0;
        // Right now the regfile is empty. You can manually set the values in the regfile with something like:
        // cpu.registerFile.memory[10] = 100;
        // This will allow you to test your ALU and register file before the processor is complete.               
               
//Test Values
					cpu.my_RegisterFile.r[1] = 6;
                cpu.my_RegisterFile.r[2] = 6;

        // After 10 nanoseconds, lets set the regfile_read_sel_1 to 1, regfile_read_sel_2 to 2, AND those values,
        // and write the result to register 3.
         #10 cpu.my_Instruction_Memory.ram[0] = 32'b000100_00001_00010_0000000000000001;
         #10 cpu.my_Instruction_Memory.ram[1] = 32'b000000000000000000000000000000;
         #10 cpu.my_Instruction_Memory.ram[2] = 32'b000000_00001_00010_00001_00000_100000;
         #10 cpu.my_Instruction_Memory.ram[3] = 32'b000000_00010_00001_00011_00000_100000;  //r-type || src reg 1 || src reg 2 || dest reg || 00000 || funct field (add)
         #10 cpu.my_Instruction_Memory.ram[4] = 32'b001000_00011_00101_0000000000000001;    //addi code || source reg || dest reg || immediate
         #10 cpu.my_Instruction_Memory.ram[5] = 32'b101011_00000_00010_0000000000000001;    //sw code || first address operand alu || register that carries the value to be store || immediate add to operand to calculate dataMem addr
        
  
         // #10 cpu.instruction_Memory.ram[4] = 32'b000000_00000_00000_00000_00000_000000;
          //#10 cpu.ins_Memory.ram[5] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
          //#10 cpu.ins_Memory.ram[6] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
        //  #10 cpu.instruction_Memory.ram[5] = 32'b1000_1100_0000_0111_0000_0000_0000_0001;    //lw code || first addr opd alu || register to store value || immediate add to opd to cal dataMem addr
          //#10 cpu.ins_Memory.ram[5] = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
            #10 reset = 0;
            start = 1;
                //#100 program_counter = 32'd1;
        // If you set the values of those  registers 1 and 2 to something other than 0, you should see some result in
        // register 3.

     end
    
endmodule