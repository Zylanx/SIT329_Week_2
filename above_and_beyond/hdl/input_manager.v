`timescale 1ns/1ns

module input_manager
	(
		input clk,
		
		input input_button,
		input op_button,
		
		input [3:0] sliders,
		
		output reg [3:0] a = 4'b0000,
		output reg [3:0] b = 4'b0000,
		output reg [1:0] op = 2'b00,
		output selected_output
	);
	
	// Button registers for detecting clock synced edges
	reg input_button_delayed = 1'b0;
	reg op_button_delayed = 1'b0;
	
	// Register to store the currently selected output
	reg output_select = 1'b0;
	
	// The currently selected output, a or b, to assign the sliders value to
	assign selected_output = output_select;
	
	// Button delay block
	always @(posedge clk) begin
		input_button_delayed <= input_button;
		op_button_delayed <= op_button;
	end
	
	// input_button block
	always @(posedge clk) begin
		// detect rising edge on input_button
		if (input_button && ~input_button_delayed) begin
			if (~output_select) begin
				a <= sliders;
				output_select <= 1'b1;
			end else begin
				b <= sliders;
				output_select <= 1'b0;
			end
		end
	end
	
	// op_button block
	always @(posedge clk) begin
		if (op_button && ~op_button_delayed) begin
			op <= op + 1;
		end
	end
	
endmodule