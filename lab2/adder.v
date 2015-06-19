module adder(a,b,cout,sum);
	parameter n=5;					
	input [n-1:0] a, b;		//input up to 5 bits long for a or b
	output [n-1:0] sum;		//output up to 5 bits long for sum
	output cout;				//output carry out as 1 bit
 
	wire [n-1:0] prop = a ^ b;		//propegate = a ^ b (XOR)
	wire [n-1:0] gen = a & b;		//generate = a and b
	wire [n:0] carry = {gen | (prop & carry[n-1:0]), 1'b0};	//carry = gen or (prop & c
	assign sum = prop ^ carry[n-1:0];		//sum of prop and c[n-1:0]
	assign cout = carry[n];		// so if there was overflow, then it would be 1, otherwise it would
												// spit out a 0
endmodule
