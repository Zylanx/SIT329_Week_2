`timescale 1ns/1ns

module alu_tb;
	// Inputs
	reg [3:0] t_a;
	reg [3:0] t_b;
	reg [1:0] t_op;

	// Outputs
	wire [3:0] t_out;
	wire t_overflow;

	// Instantiate the Unit Under Test (UUT)
	alu UUT (
		.a(t_a),
		.b(t_b),
		.op(t_op),
		.out(t_out),
		.overflow(t_overflow)
	);

	initial begin
		$dumpfile("haout.vcd");
		$dumpvars(1, alu_tb);
		
		t_a = 0;
		t_b = 0;
		t_op = 0;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 1 + 0 = 1
		t_a = 1;
		t_b = 0;
		t_op = 0;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 1 + 3 = 4
		t_a = 1;
		t_b = 3;
		t_op = 0;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 15 + 2 = 1 (+ overflow)
		t_a = 15;
		t_b = 2;
		t_op = 0;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 2 + 15 = 1 (+ overflow)
		t_a = 2;
		t_b = 15;
		t_op = 0;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 4 - 2 = 2
		t_a = 4;
		t_b = 2;
		t_op = 2'b01;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 2 - 4 = 14 (+ overflow)
		t_a = 2;
		t_b = 4;
		t_op = 2'b01;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 15 - 1 = 14
		t_a = 15;
		t_b = 1;
		t_op = 2'b01;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// !2 = 13
		t_a = 2;
		t_b = 0;
		t_op = 2'b10;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// !0 = 15 
		t_a = 0;
		t_b = 0;
		t_op = 2'b10;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// !15 = 0
		t_a = 15;
		t_b = 0;
		t_op = 2'b10;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 10 AND 5 = 0
		t_a = 10;
		t_b = 5;
		t_op = 02'b11;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		// 11 AND 5 = 1
		t_a = 11;
		t_b = 5;
		t_op = 02'b11;
		#10
		$display("a=%d, b=%d, op=%b, out=%f, overflow=%d", t_a, t_b, t_op, t_out, t_overflow);
		
		$stop;
	end

endmodule