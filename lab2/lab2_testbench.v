// Class: CSCI 310 Digital Logic
// Term: Winter '15
// Name(s): Richard Quon, Jaron Patena
//
// Lab #2
// Create Date:    11:31:08 02/10/2015 

module lab2_testbench();
	reg [7:0] aIn, bIn;
	wire [7:0] result;
	
	float_add fadd(
		.aIn(aIn),
		.bIn(bIn),
		.result(result)
	);
	
	initial begin
		// test float module
		aIn = 8'b00001000; bIn = 8'b00000011;
		#100 $display("%b + %b = %b" , aIn, bIn, result);
		aIn = 8'b00110001; bIn = 8'b00001100;
		#100 $display("%b + %b = %b" , aIn, bIn, result);
		aIn = 8'b10010010; bIn = 8'b01011111;
		#100 $display("%b + %b = %b", aIn, bIn, result);
		aIn = 8'b11111110; bIn = 8'b11111000;
		#100 $display("%b + %b = %b", aIn, bIn, result);
	end
endmodule
