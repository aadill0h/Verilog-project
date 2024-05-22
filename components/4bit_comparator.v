module comparator_4bit(a0,a1,a2,a3,b0,b1,b2,b3,a_greater_b);
	input a0,a1,a2,a3,b0,b1,b2,b3;
	output a_greater_b;
	wire w1,w2,w3,w4,w5,w6,w7,out1,out2,out3,out4;
	
	xnor_gate xnor1(a3,b3,w2);
	xnor_gate xnor2(a2,b2,w3);
	xnor_gate xnor3(a1,b1,w4);
	
	not_gate not1(b3,w1);
	and_gate and1(a3,w1,out1);
	
	not_gate not2(b2,w5);
	and3_gate and3_1(w2,a2,w5,out2);
	
	not_gate not3(b1,w6);
	and4_gate and4_1(w2,w3,a1,w6,out3);
	
	not_gate not4(b0,w7);
	and5_gate and5_1(w2,w3,w4,a0,w7,out4);
	
	or4_gate or4_1(out1,out2,out3,out4,a_greater_b);
endmodule

4bit_
