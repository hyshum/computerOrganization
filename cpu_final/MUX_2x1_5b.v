`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:07:49 12/06/2017 
// Design Name: 
// Module Name:    MUX_2x1_5b 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module MUX_2x1_5b(
    input [4:0] Zero,One,
    input Control,
    output reg [4:0] Out
    );

    always @ (*) begin
        case (Control)
                0: assign Out = Zero;
                1: assign Out = One;
        endcase
    end
endmodule
