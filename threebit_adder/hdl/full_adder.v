`timescale 1ns/1ns

module full_adder
	(
		input a,
		input b,
		input carry_in,
		
		output sum,
		output carry_out
	);
	
	// internal signals
	wire stage1_sum;
	wire stage1_carry;
	wire stage2_carry;
	
	half_adder stage1
	(
		.a(a),
		.b(b),
		.sum(stage1_sum),
		.carry(stage1_carry)
	);
	
	half_adder stage2
	(
		.a(stage1_sum),
		.b(carry_in), 
		.sum(sum),
		.carry(stage2_carry)
	);
	
	or(carry_out, stage1_carry, stage2_carry);
	
endmodule