module shifter(in,distance,direction,out);
	parameter k = 5;
	parameter lk = 3;
	input [lk-1:0] distance;			//how much to shift
	input [k-1:0] in;		       //number to shift
	input direction; 				//direction 0=left, 1=right
	output [k-1:0] out;		//k-amount of bits because to make sure that 
										//there will be a wire to be able to shift the bits and prevents
										//overflow
	assign out = direction ? in>>distance : in<<distance;	
										//turnary operator shifts right if direction is 1, otherwise, shift left 
										//Note: direction is based off in shifting distance, not distance shifting in
endmodule
