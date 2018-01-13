`timescale 1ns / 1ns
/** @module : Memory Module
 *  @author : Albert Bitdiddle
 *  Simple Memory Design Template
 *  Adaptive and Secure Computing Systems (ASCS) Laboratory
 */
 
module Memory (
		clock,
    	Address,
   		MemRead, ReadData,
    	MemWrite,writeData
); 

input clock; 
input [7:0]   Address;
input MemRead; //1bit enable
output[31:0]  ReadData;//output data for read.
input MemWrite;//1bit enable
input [31:0]   writeData;//input data for write.
 
localparam MEM_DEPTH = 1 << 7;//ignore.
reg [31:0]     ram [0:MEM_DEPTH-1]; // an array of ram.
 
//--------------Add your code here ------------------ 
assign ReadData= MemRead? ram[Address] : 0;
always @(posedge clock)begin
	if (MemWrite) begin
		ram[Address] <= writeData;
		end
end


//----------------------------------------------------
endmodule
