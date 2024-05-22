module adder_8bit(a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7,p0,p1,p2,p3,p4,p5,p6,p7,ctrl);
	input a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7,ctrl;
	output p0,p1,p2,p3,p4,p5,p6,p7;
	wire w0,w1,w2,w3,w4,w5,w6,w7,cw1,cw2,cw3,cw4,cw5,cw6,cw7,cw8;
	
	xor_gate xor1(a0,ctrl,w0);
	xor_gate xor2(a1,ctrl,w1);
	xor_gate xor3(a2,ctrl,w2);
	xor_gate xor4(a3,ctrl,w3);
	xor_gate xor5(a4,ctrl,w4);
	xor_gate xor6(a5,ctrl,w5);
	xor_gate xor7(a6,ctrl,w6);
	xor_gate xor8(a7,ctrl,w7);
	
	full_adder_1bit full1(w0,b0,ctrl,p0,cw1);
	full_adder_1bit full2(w1,b1,cw1,p1,cw2);
	full_adder_1bit full3(w2,b2,cw2,p2,cw3);
	full_adder_1bit full4(w3,b3,cw3,p3,cw4);
	full_adder_1bit full5(w4,b4,cw4,p4,cw5);
	full_adder_1bit full6(w5,b5,cw5,p5,cw6);
	full_adder_1bit full7(w6,b6,cw6,p6,cw7);
	full_adder_1bit full8(w7,b7,cw7,p7,cw8);

endmodule
