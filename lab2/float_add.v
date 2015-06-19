// Class: CSCI 310 Digital Logic
// Term: Winter '15
// Name(s): Richard Quon, Jaron Patena
//
// Lab #2
// Create Date:    11:26:17 02/10/2015 

module float_add(aIn, bIn, result);
	input [7:0] aIn, bIn; // big
	output wire [7:0] result; // big
	
	wire [4:0] in, a, b; // shift  // adder
	wire [2:0] distance, gtE, ltE, fExp; // shift
	wire direction, cout;// shift // adder
	wire [7:0] aOut, bOut; // big number first
	wire [4:0] nltM, sum, gtM, ltM, fMant; // shift and adder
	
	big_number_first big(
		.aIn(aIn),
		.bIn(bIn),
		.aOut(aOut),
		.bOut(bOut)
	);
	
	assign gtE = aOut[7:5];			//greater than Exponent
	assign ltE = bOut[7:5];			//less than Exponent
	assign gtM = aOut[4:0];			//greater than Mantissa
	assign ltM = bOut[4:0];			//less than Mantissa
	
	shifter shift(
		.in(ltM),			//shifting with the lower mantissa, never the larger one
		.distance(gtE-ltE),	//subtract the greater exponent from the lesser exponent 
		.direction(1'b1),	//if 0, shift left; if 1, shift right
		.out(nltM)				//output of the shifted lower mantissa AKA new lower mantissa
	);
	
	adder add(				
		.a(gtM),				//think of everything step by step, so a will take the parameters of the greater than mantissa
		.b(nltM),				//b will take the parameters from the shifter because the lower mantissa gets shifted
		.sum(sum),
		.cout(cout)
	);
	
	
	assign fExp = (cout==1	? (gtE==3'b111 ? gtE : gtE+1)  : gtE);	//final exponent 2 nested turnary operators if cout==1 then check (gtE == 3'b111 if that's true, then assign fExp to gtE
																						//otherwise assign it to gtE+1, and if false, set fExp to gtE
	assign fMant = (gtE==3'b111 ? (cout ==1 ? 5'b11111:sum) : sum);	//final mantissa 2 nested turnary operators if gtE==3'b111 then check (cout == 1 if that's true, then assign fMant to 5'b11111
																						//otherwise assign it to sum, and if false, set fExp to sum
	assign result = {fExp, fMant};					//result will output the final exponent then the final mantissa
endmodule
