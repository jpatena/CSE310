// Class: CSCI 310 Digital Logic
// Term: Winter '15
// Name(s): Richard Quon, Jaron Patena
//
// Lab #0
// Create Date:    11:49:22 01/13/2015 

module lab0_top(
	input LEFT_pushbutton,
	input RIGHT_pushbutton,
	input [3:0] A,
	input [3:0] B,
	output reg [3:0] result
	);

	wire [3:0] anded_result;
	wire [3:0] added_result;

	assign anded_result = A & B;
	assign added_result = A + B;
	always @* begin
		case( {LEFT_pushbutton, RIGHT_pushbutton} )
			2'b01: result = added_result;
			2'b10: result = anded_result;
			2'b11: result = added_result; // Right push button takes precedence
			default: result = 4'b0;		endcase
	end
endmodule
