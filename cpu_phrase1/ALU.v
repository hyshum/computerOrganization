`timescale 1ns / 1ns
/** @module : ALU
 *  @author : Albert Bitdiddle
 *  ALU Module Template 
 *  Adaptive and Secure Computing Systems (ASCS) Laboratory
 */
 //Changes from 4bits to 6 bits for both i and r op code.
module ALU (
		ALU_Control, 
		operand_A, operand_B, 
		ALU_result, zero, immediate
); 
input [3:0]   ALU_Control; 
input [31:0]  operand_A ;
input [31:0]  operand_B ;
output zero; 
output reg[31:0] ALU_result;


//--------------Add your code here ------------------ 
// TODO: right now, ALU only ANDs the two operands. You have to implement the rest of the instructions.
 always @(ALU_Control, operand_A, operand_B)begin
	case(ALU_Control)
	4'b0000: ALU_result = operand_A & operand_B;	// AND
	4'b0001: ALU_result = operand_A | operand_B; // OR
	4'b0010: ALU_result = operand_A + operand_B; // ADD
	4'b0110: ALU_result = operand_A - operand_B; // SUB
	4'b0111: ALU_result = (operand_A <	operand_B)	?	1	:	0;
	4'b1100: ALU_result = ~(operand_A | operand_B);
	default: ALU_result = 0;
	endcase
end
assign zero = ALU_result == (ALU_result == 0) ? 1 : 0; // if(alu_result == 0) zero = 0; else zero= 1;
//----------------------------------------------------

endmodule
