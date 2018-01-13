`timescale 1ns / 1ns

module Memory (
        clock,
        Address,
       MemRead, ReadData,
        MemWrite,writeData
);

    input clock;
    input [31:0]   Address;
    input MemRead;//1bit enable
    output reg [31:0]  ReadData;//output data for read.
    input MemWrite;//1bit enable
    input [31:0]   writeData;//input data for write.
 
    reg [31:0] ram[0:31];// an array of ram.
 //--------------Add your code here ------------------ 
    always @ (*) begin
        if (MemRead)
            assign ReadData = ram[Address];
    end

    always @ (posedge clock) begin
        if (MemWrite)
            ram[Address] = writeData;
    end
//----------------------------------------------------
endmodule

