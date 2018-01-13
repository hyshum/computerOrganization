`timescale 1ns / 1ns

module PC(
     input clock,
     input reset,
     input Branch,
     input Zero,
     input [31:0] extended,
     output [31:0] IM_Address
    );
     
    reg [31:0] pc;
    wire PCSrc = Branch && Zero;
   
    always @ (posedge clock) begin
        if (reset)
            pc = 0;
        else
            pc = PCSrc ? (pc + 1 + extended):(pc + 1);
    end
   
    assign IM_Address = pc;

endmodule
