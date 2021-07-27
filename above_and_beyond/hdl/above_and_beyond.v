`timescale 1ns/1ns

module above_and_beyond
	(
		input clk,
		
		input input_button,
		input op_button,
		
		input [3:0] sliders,
		
		output [5:0] leds
	);
	
	wire [3:0] a;
	wire [3:0] b;
	wire [1:0] op;
	
	input_manager input_manager (
		.clk(clk),
		.input_button(input_button),
		.op_button(op_button),
		.sliders(sliders),
		.a(a),
		.b(b),
		.op(op),
		.selected_output(leds[5])
	);
	
	alu alu (
		.a(a),
		.b(b),
		.op(op),
		.out(leds[3:0]),
		.overflow(leds[4])
	);
	
endmodule