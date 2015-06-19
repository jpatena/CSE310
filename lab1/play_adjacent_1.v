`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:58 01/27/2015 
// Design Name: 
// Module Name:    play_adjacent_1 
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
module play_adjacent_1(
	input [2:0] ain, bin,
	output wire cout
	);
	
	assign cout = ain[1] & bin[0] & bin[2] ;  //It checks the middle variable first,
															//then checks the left variable followed by the right variable

endmodule
