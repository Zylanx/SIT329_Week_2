`timescale 1ns/1ns

module threebit_adder
	(
		input carry_in,
		input [2:0] a,
		input [2:0] b,
		
		output [2:0] sum,
		output carry_out
	);
	
	// internal signals
	wire stage1_carry;
	wire stage2_carry;
	
	full_adder stage1
	(
		.carry_in(carry_in),
		.a(a[0]),
		.b(b[0]),
		.sum(sum[0]),
		.carry_out(stage1_carry)
	);
	
	full_adder stage2
	(
		.carry_in(stage1_carry),
		.a(a[1]),
		.b(b[1]),
		.sum(sum[1]),
		.carry_out(stage2_carry)
	);
	
	full_adder stage3
	(
		.carry_in(stage2_carry),
		.a(a[2]),
		.b(b[2]),
		.sum(sum[2]),
		.carry_out(carry_out)
	);
	
endmodule