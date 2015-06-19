`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:54 01/21/2015 
// Design Name: 
// Module Name:    play_adjacent_edge 
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
module play_adjacent_edge(
	 input [8:0] ain,
    input [8:0] bin,
    output wire [8:0] cout		//make it 9 bits since we are couting gameboard with 9 slots
    );
	wire radj, ladj, nadj, sadj;

	play_adjacent_1 rightadj(
		.ain({ain[8], ain[4], ain[0]}),
      .bin({bin[8], bin[4], bin[0]}),
      .cout(radj)
	);
	
	play_adjacent_1 leftadj(
        .ain({ain[6], ain[4], ain[2]}),
        .bin({bin[6], bin[4], bin[2]}),
        .cout(ladj)
	);
	
	play_adjacent_1 northadj(
        .ain({ain[8], ain[4], ain[0]}),
        .bin({bin[8], bin[4], bin[0]}),
        .cout(nadj)
	);
	
	play_adjacent_1 southadj(
        .ain({ain[6], ain[4], ain[2]}),
        .bin({bin[6], bin[4], bin[2]}),
        .cout(sadj)
	);
	
	
	assign cout = {1'b0, 1'b0, 1'b0, ladj, 1'b0, radj, 1'b0, 1'b0, 1'b0} ;
	//assign cout = {1'b0, sadj, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, nadj, 1'b0} ;
endmodule
