`timescale 1ns / 1ns
/** @module : registerFile
 *  @author : Albert Bitdiddle
 *  Register File Template
 *  Adaptive and Secure Computing Systems (ASCS) Laboratory
 */

// Parameterized register file
module registerFile (
				clock, reset, 
                read_sel1, read_sel2,
				write, write_sel, write_data, 
				read_data1, read_data2
);

input clock, reset; 
input [4:0] read_sel1, read_sel2; 
input write; 
input [31:0] write_data;
input [4:0] write_sel;
output[31:0] read_data1; 
output[31:0] read_data2; 

//--------------Add your code here ------------------ 

//assign read_data1 = 7;
//assign read_data2 = 11;
//32 x 32bits register file.
reg[31:0] r[0:31]; 
integer i;

assign read_data1 = r[read_sel1]; 		
assign read_data2 = r[read_sel2];

always @(posedge clock) begin
if (reset) begin
	for(i = 0; i < 32; i = i + 1)begin
		r[i] = 0;
	end
end

else if  (write) r[write_sel] <= write_data;
end




//----------------------------------------------------
endmodule
