`timescale 1ns / 1ps

module MUX_2x1_32b(
	input [31:0] Zero,One,
    input Control,
    output reg [31:0] Out
    );

    always @ (*) begin
        case (Control)
                0: assign Out = Zero;
                1: assign Out = One;
        endcase
    end
endmodule



