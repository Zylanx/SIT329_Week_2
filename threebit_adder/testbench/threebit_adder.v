`timescale 1ns/1ns

module threebit_adder_tb;
	// Inputs
	reg [2:0] t_a;
	reg [2:0] t_b;
	reg t_carry_in;

	// Outputs
	wire [2:0] t_sum;
	wire t_carry_out;

	// Instantiate the Unit Under Test (UUT)
	threebit_adder UUT (
		.carry_in(t_carry_in),
		.a(t_a), 
		.b(t_b),
		.sum(t_sum), 
		.carry_out(t_carry_out)
	);

	initial begin
		$dumpfile("haout.vcd");
		$dumpvars(1, threebit_adder_tb);
		
		t_a = 0;
		t_b = 0;
		t_carry_in = 0;
		#10
		$display("a=%d, b=%d, cin=%d, s=%d, cout=%d", t_a, t_b, t_carry_in, t_sum, t_carry_out);
		
		t_a = 3;
		t_b = 4;
		t_carry_in = 0;
		#10
		$display("a=%d, b=%d, cin=%d, s=%d, cout=%d", t_a, t_b, t_carry_in, t_sum, t_carry_out);
		
		t_a = 2;
		t_b = 2;
		t_carry_in = 0;
		#10
		$display("a=%d, b=%d, cin=%d, s=%d, cout=%d", t_a, t_b, t_carry_in, t_sum, t_carry_out);
		
		t_a = 3'd5;
		t_b = 3'd1;
		t_carry_in = 0;
		#10
		$display("a=%d, b=%d, cin=%d, s=%d, cout=%d", t_a, t_b, t_carry_in, t_sum, t_carry_out);
		
		$stop;
	end

endmodule