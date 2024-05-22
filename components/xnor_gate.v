module xnor_gate(a,b,c);
	input a,b;
	output c;
	wire w1;
	xor_gate xor1(a,b,w1);
	not_gate not1(w1,c);
endmodule
