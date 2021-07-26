`timescale 1ns/1ns

module half_adder 
	(
		input a,
		input b,

		output sum,
		output carry
	);

	assign sum   = a ^ b;  // bitwise xor
	assign carry = a & b;  // bitwise and
endmodule // half_adder