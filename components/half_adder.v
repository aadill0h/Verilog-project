module half_adder(a,b,s,c);
	input a,b;
	output s,c;
	
	xor_gate xor1(a,b,s);
	and_gate and1(a,b,c);
endmodule

