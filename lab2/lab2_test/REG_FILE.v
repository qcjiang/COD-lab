`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:49:43 03/20/2017 
// Design Name: 
// Module Name:    REG_FILE 
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
module REG_FILE(
input	  clk,
reg [31:0] register[0:31];
integer k,i;
always@(posedge clk or negedge rst_n)
begin
 if(~rst_n)
 begin
   register[0]=32'b1;
	register[1]=32'b1;
   for(k=2;k<32;k=k+1)
	  register[k]=32'b0;
 end
 else if(r3_wr)
 begin
   i=r3_addr;
	register[i]=r3_din;
	i=r1_addr;
	r1_dout=register[i];
	i=r2_addr;
	r2_dout=register[i];
 end
 else
 begin
   i=r1_addr;
	r1_dout=register[i];
	i=r2_addr;
	r2_dout=register[i];
 end
end



endmodule