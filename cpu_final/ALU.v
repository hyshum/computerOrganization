`timescale 1ns / 1ns

module ALU (
        ALU_Control,
        operand_A, operand_B,
        ALU_result, zero
);

input [3:0]   ALU_Control;
input [31:0]  operand_A ;
input [31:0]  operand_B ;
output reg zero;
output reg [31:0] ALU_result;

    always @ (*) begin   
        case(ALU_Control)
            4'b0000: ALU_result = operand_A & operand_B;
            4'b0001: ALU_result = operand_A | operand_B;
            4'b0010: ALU_result = operand_A + operand_B;
            4'b0110: ALU_result = operand_A - operand_B;
            4'b0111: ALU_result = (operand_A < operand_B) ? 1 : 0;
            4'b1100: ALU_result = ~ (operand_A | operand_B);
        endcase
    end

    always @ (*) begin
        if (ALU_result == 0)
            assign zero = 1;
        else
            assign zero = 0;
    end
endmodule