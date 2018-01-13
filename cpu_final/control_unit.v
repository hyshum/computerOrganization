`timescale 1ns / 1ns
module Control_Unit(
    input  [31:0] instruction,
    output reg [3:0]  ALU_Control,
    output reg [4:0]  read_sel1,
    output reg [4:0]  read_sel2,
    output reg [4:0]  write_sel,
     output reg [31:0] extended,
    output reg Branch,
     output reg ALUSrc,
     output reg RegWrite,
     output reg RegDst,
	  output reg MemRead,
     output reg MemtoReg,
     output reg MemWrite
);

    always @ (*) begin
        assign read_sel1 = instruction[25:21]; //rs
        assign read_sel2 = instruction[20:16];	//rt
        assign write_sel = instruction[15:11];	//rd
		
		//Internal Sign Extend Component.
        case (instruction[15])
            0: assign extended = {16'b0000000000000000, instruction[15:0]};
            1: assign extended = {16'b1111111111111111, instruction[15:0]};
        endcase

        case (instruction[31:26])
			6'b000000: begin                     // R type
                case (instruction[5:0])
                    6'b100000: begin               // add
                        assign RegDst      = 1;
                        assign ALUSrc      = 0;
                        assign MemtoReg    = 0;
                        assign RegWrite    = 1;
                        assign MemRead     = 0;
                        assign MemWrite    = 0;
                        assign Branch      = 0;
                        assign ALU_Control = 4'b0010;
                    end
                   
                    6'b100010: begin               // sub
                        assign RegDst      = 1;
                        assign ALUSrc      = 0;
                        assign MemtoReg    = 0;
                        assign RegWrite    = 1;
                        assign MemRead     = 0;
                        assign MemWrite    = 0;
                        assign Branch      = 0;
                        assign ALU_Control = 4'b0110;
                    end
           
                    6'b100100: begin               // and
                        assign RegDst      = 1;
                        assign ALUSrc      = 0;
                        assign MemtoReg    = 0;
                        assign RegWrite    = 1;
                        assign MemRead     = 0;
                        assign MemWrite    = 0;
                        assign Branch      = 0;
                        assign ALU_Control = 4'b0000;
                    end

                    6'b100101: begin               // or
                        assign RegDst      = 1;
                        assign ALUSrc      = 0;
                        assign MemtoReg    = 0;
                        assign RegWrite    = 1;
                        assign MemRead     = 0;
                        assign MemWrite    = 0;
                        assign Branch      = 0;
                        assign ALU_Control = 4'b0001;
                    end
           
                    6'b101010: begin               // slt
                        assign RegDst      = 1;
                        assign ALUSrc      = 0;
                        assign MemtoReg    = 0;
                        assign RegWrite    = 1;
                        assign MemRead     = 0;
                        assign MemWrite    = 0;
                        assign Branch      = 0;
                        assign ALU_Control = 4'b0111;
                    end


                    6'b100111: begin               // nor
                        assign RegDst      = 1;
                        assign ALUSrc      = 0;
                        assign MemtoReg    = 0;
                        assign RegWrite    = 1;
                        assign MemRead     = 0;
                        assign MemWrite    = 0;
                        assign Branch      = 0;
                        assign ALU_Control = 4'b1100;
                    end
                   
                endcase
               
            end
				
            6'b000100: begin                      // BEQ
                assign RegDst      = 0;
                assign ALUSrc      = 0;
                assign MemtoReg    = 0;
                assign RegWrite    = 0;
                assign MemRead     = 0;
                assign MemWrite    = 0;
                assign Branch      = 1;
                assign ALU_Control = 4'b0110;
            end
           
            6'b100011: begin                      // lw
                assign RegDst   = 0;
                assign ALUSrc   = 1;
                assign MemtoReg = 1;
                assign RegWrite = 1;
                assign MemRead  = 1;
                assign MemWrite = 0;
                assign Branch   = 0;
                assign ALU_Control = 4'b0010;
            end
           
            6'b101011: begin                      // sw
                assign RegDst   = 0;
                assign ALUSrc   = 1;
                assign MemtoReg = 0;
                assign RegWrite = 0;
                assign MemRead  = 0;
                assign MemWrite = 1;
                assign Branch   = 0;
                assign ALU_Control = 4'b0010;
            end
           
            6'b001000: begin                     // addi
                assign RegDst   = 0;
                assign ALUSrc   = 1;
                assign MemtoReg = 0;
                assign RegWrite = 1;
                assign MemRead  = 0;
                assign MemWrite = 0;
                assign Branch   = 0;
                assign ALU_Control = 4'b0010;
            end
           
        endcase
       
    end
   
endmodule