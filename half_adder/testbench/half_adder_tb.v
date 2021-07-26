`timescale 1ns/1ns

module half_adder_tb;
	// Inputs
	reg t_a;
	reg t_b;
	
	// Outputs
	wire t_sum;
	wire t_carry;

	// Instantiate the Unit Under Test (UUT)
	half_adder ha (
		.a(t_a), 
		.b(t_b),  
		.sum(t_sum), 
		.carry(t_carry)
	);

	initial begin
		$dumpfile("haout.vcd");
		$dumpvars(1,halfadder_tb);
		
		t_a = 0;
		t_b = 0;
		#10
		$display("a=%d, b=%d, s=%d, cout=%d", t_a,t_b, t_sum,t_carry);
		
		t_a = 0;
		t_b = 1;
		#10
		$display("a=%d, b=%d, s=%d, cout=%d", t_a,t_b, t_sum,t_carry);
		
		t_a = 1;
		t_b = 0;
		#10
		$display("a=%d, b=%d, s=%d, cout=%d", t_a,t_b, t_sum,t_carry);
		
		t_a = 1;
		t_b = 1;
		#10
		$display("a=%d, b=%d, s=%d, cout=%d", t_a,t_b, t_sum,t_carry);

		$stop;
	end

endmodule