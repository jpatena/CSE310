module big_number_first(aIn,bIn,aOut,bOut);
	input [7:0] aIn, bIn;
	output [7:0] aOut, bOut;
	wire flag;
	assign flag = (aIn[7:5] >= bIn[7:5]);
	assign aOut = flag ? aIn : bIn;		//? is a turnary operator, it states that anything to the left of the ? if it's true, then it makes the
													//right of ? true, then whatever is on the right of the : must be false
	assign bOut = flag ? bIn : aIn;		//clearly bOut must be opposite of aOut
endmodule
