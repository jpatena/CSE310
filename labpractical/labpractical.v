// Class: CSCI 310 Digital Logic
// Term: Winter '15
// Name(s): Jaron Patena
//
// Lab Practical
// Create Date:    12:41:06 03/17/2015 

module labpractical(
	input pushbutton_one,
	input pushbutton_two,
	input pushbutton_three,
	input pushbutton_four,
	input [3:0] A,
	input [3:0] B,
	output reg [3:0] result
	);
	
	wire [3:0] sum_result;
	wire [3:0] difference_result;
	wire [3:0] shifted_right_result;
	wire [3:0] shifted_left_result; 

	assign sum_result = A + B; // addition
	assign difference_result = A - B; // subtraction
	assign shifted_right_result = A >> B; // A shifted to the right B positions
	assign shifted_left_result = B << A; // B shifted to the left A positions
	always @* begin
		casex( {pushbutton_four, pushbutton_three, pushbutton_two, pushbutton_one} )
			4'b0001: result = sum_result;
			4'b001x: result = difference_result;
			4'b01xx: result = shifted_right_result; 
			4'b1xxx: result = shifted_left_result; // right most button takes precedence
			default: result = 4'b0;		endcase
	end
endmodule

