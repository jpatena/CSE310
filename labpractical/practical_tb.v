// Class: CSCI 310 Digital Logic
// Term: Winter '15
// Name(s): Jaron Patena
//
// Lab Practical
// Create Date:    12:50:15 03/17/2015

module practical_tb ();
	reg sim_ONE_button;
	reg sim_TWO_button;
	reg sim_THREE_button;
	reg sim_FOUR_button;
	reg [3:0] sim_A;
	reg [3:0] sim_B;
	wire [3:0] sim_result;

	labpractical dut (
		.pushbutton_one(sim_ONE_button),
		.pushbutton_two(sim_TWO_button),
		.pushbutton_three(sim_THREE_button),
		.pushbutton_four(sim_FOUR_button),
		.A(sim_A),
		.B(sim_B),
		.result(sim_result)
		);

	initial begin
	// start out by setting our buttons to "not-pushed"
		sim_ONE_button = 1'b0;
		sim_TWO_button = 1'b0;
		sim_THREE_button = 1'b0;
		sim_FOUR_button = 1'b0;
	// start out with our inputs both being 0s.
		sim_A = 4'b0;
		sim_B = 4'b0;
	// wait five simulation timesteps to allow those changes to happen
		#5;
	// Our first test:
		sim_ONE_button = 1'b1;
		sim_A = 4'b0011;
		sim_B = 4'b0001;
	// again, wait five timesteps to allow changes to occur
		#5;
	// print the current values to the log
		$display
		("Output is %b, we expected %b", sim_result, (4'b0011 + 4'b0001));
	// stop simulating
		$stop;
	end
endmodule
