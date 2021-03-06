`timescale 1ns/1ns

module full_adder_tb;
	// Inputs
	reg t_a;
	reg t_b;
	reg t_carry_in;

	// Outputs
	wire t_sum;
	wire t_carry_out;

	// Instantiate the Unit Under Test (UUT)
	full_adder UUT (
		.a(t_a), 
		.b(t_b),
		.carry_in(t_carry_in),
		.sum(t_sum), 
		.carry_out(t_carry_out)
	);

	initial begin
		$dumpfile("haout.vcd");
		$dumpvars(1, full_adder_tb);
	
		t_a = 0;
		t_b = 0;
		t_carry_in = 0;
		#10
		$display("a=%d, b=%d, cin=%d, s=%d, cout=%d", t_a, t_b, t_carry_in, t_sum, t_carry_out);

		t_a = 0;
		t_b = 0;
		t_carry_in = 1;
		#10
		$display("a=%d, b=%d, cin=%d, s=%d, cout=%d", t_a, t_b, t_carry_in, t_sum, t_carry_out);

		t_a = 0;
		t_b = 1;
		t_carry_in = 0;
		#10
		$display("a=%d, b=%d, cin=%d, s=%d, cout=%d", t_a, t_b, t_carry_in, t_sum, t_carry_out);

		t_a = 0;
		t_b = 1;
		t_carry_in = 1;
		#10
		$display("a=%d, b=%d, cin=%d, s=%d, cout=%d", t_a, t_b, t_carry_in, t_sum, t_carry_out);

		t_a = 1;
		t_b = 0;
		t_carry_in = 0;
		#10
		$display("a=%d, b=%d, cin=%d, s=%d, cout=%d", t_a, t_b, t_carry_in, t_sum, t_carry_out);
	
		t_a = 1;
		t_b = 0;
		t_carry_in = 1;
		#10
		$display("a=%d, b=%d, cin=%d, s=%d, cout=%d", t_a, t_b, t_carry_in, t_sum, t_carry_out);
	
		t_a = 1;
		t_b = 1;
		t_carry_in = 0;
		#10
		$display("a=%d, b=%d, cin=%d, s=%d, cout=%d", t_a, t_b, t_carry_in, t_sum, t_carry_out);
	
		t_a = 1;
		t_b = 1;
		t_carry_in = 1;
		#10
		$display("a=%d, b=%d, cin=%d, s=%d, cout=%d", t_a, t_b, t_carry_in, t_sum, t_carry_out);
	
		$stop;
	end

endmodule