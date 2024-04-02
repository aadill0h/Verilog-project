
module and_gate(a,b,c);

	input a,b;
	output c;
	and(c,a,b);
endmodule


module or_gate(a,b,c);
	input a,b;
	output c;
	or(c,a,b);
endmodule

module not_gate(a,y);
	input a;
	output y;
	not(y,a);
endmodule

module xor_gate(a,b,c);
	input a,b;
	output c;
	xor (c,a,b);
endmodule

module half_adder(a,b,s,c);
	input a,b;
	output s,c;
	
	xor_gate xor1(a,b,s);
	and_gate and1(a,b,c);
endmodule

module full_adder_1bit(a,b,cin,s,cout);
	input a,b,cin;
	wire w1,w2,w3;
	output s,cout;
	half_adder half1(a,b,w1,w2);//w1=sum ,w2=carry
	half_adder half2(cin,w1,s,w3);//s=sum and w3 takes towards OR gate
	or_gate or1(w2,w3,cout);
endmodule

module adder_subtracter(ct0,ct1,ct2,ct3,ncell0,ncell1,ncell2,ncell3,ctrl,new_ct0,new_ct1,new_ct2,new_ct3);
	//A(XOR)1=A BAR
	//A(XOR)0=A
	input ct0,ct1,ct2,ct3,ncell0,ncell1,ncell2,ncell3,ctrl;
	output new_ct0,new_ct1,new_ct2,new_ct3;
	wire w1,w2,w3,w4,cw0,cw1,cw2,cw3;
	
	//and_gate and1(ncell0,on_off,w1);
	//and_gate and2(ncell1,on_off,w2);
	//and_gate and3(ncell2,on_off,w3);
	//and_gate and4(ncell3,on_off,w4);
	
	xor_gate xor1(ncell0,ctrl,w1);
	xor_gate xor2(ncell1,ctrl,w2);
	xor_gate xor3(ncell2,ctrl,w3);
	xor_gate xor4(ncell3,ctrl,w4);
	
	full_adder_1bit full1(w1,ct0,ctrl,new_ct0,cw1);
	full_adder_1bit full2(w2,ct1,cw1,new_ct1,cw2);
	full_adder_1bit full3(w3,ct2,cw2,new_ct2,cw3);
	full_adder_1bit full4(w4,ct3,cw3,new_ct3,cw4);
endmodule


module multiplier_4_bit(a0,a1,a2,a3,b0,b1,b2,b3,p0,p1,p2,p3,p4,p5,p6,p7);
	input a0,a1,a2,a3,b0,b1,b2,b3;
	output p0,p1,p2,p3,p4,p5,p6,p7;
	wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,cw1,cw2,cw3,cw4,cw5,cw6,cw7,cw8,cw9,cw10,cw11;
	//wire cw1,cw2,cw3,cw4,cw5,cw6,cw7
	
	//level1
	and_gate and1(b0,a0,p0);
	and_gate and2(b0,a1,w1);
	and_gate and3(b0,a2,w2);
	and_gate and4(b0,a3,w3);
	
	//level2
	and_gate and5(b1,a0,w4);
	and_gate and6(b1,a1,w5);
	and_gate and7(b1,a2,w6);
	and_gate and8(b1,a3,w7);
	half_adder half1(w1,w4,p1,cw1);
	full_adder_1bit full1(w2,w5,cw1,w8,cw2);
	full_adder_1bit full2(w3,w6,cw2,w9,cw3);
	half_adder half2(w7,cw3,w10,cw4);
	
	//level3
	and_gate and9(b2,a0,w11);
	and_gate and10(b2,a1,w12);
	and_gate and11(b2,a2,w13);
	and_gate and12(b2,a3,w14);
	half_adder half3(w8,w11,p2,cw5);
	full_adder_1bit full3(w9,w12,cw5,w15,cw6);
	full_adder_1bit full4(w10,w13,cw6,w16,cw7);
	full_adder_1bit full5(cw4,w14,cw7,w17,cw8);
	
	
	//level4
	and_gate and13(b3,a0,w18);
	and_gate and14(b3,a1,w19);
	and_gate and15(b3,a2,w20);
	and_gate and16(b3,a3,w21);
	half_adder half4(w15,w18,p3,cw9);
	full_adder_1bit full6(w16,w19,cw9,p4,cw10);
	full_adder_1bit full7(w17,w20,cw10,p5,cw11);
	full_adder_1bit full8(cw8,w21,cw11,p6,p7);
endmodule

module FCIMS(ctrl,uprice0,uprice1,uprice2,uprice3,ncel0,ncel1,ncel2,ncel3,ct0,ct1,ct2,ct3,fprice0,fprice1,fprice2,fprice3,fprice4,fprice5,fprice6,fprice7,new_ct0,new_ct1,new_ct2,new_ct3);
	input uprice0,uprice1,uprice2,uprice3,uprice3,ncel0,ncel1,ncel2,ncel3,ct0,ct1,ct2,ct3,ctrl;
	output fprice0,fprice1,fprice2,fprice3,fprice4,fprice5,fprice6,fprice7,new_ct0,new_ct1,new_ct2,new_ct3;
	
	adder_subtracter ad_sub1(ct0,ct1,ct2,ct3,ncel0,ncel1,ncel2,ncel3,ctrl,new_ct0,new_ct1,new_ct2,new_ct3);
	multiplier_4_bit multi1(uprice0,uprice1,uprice2,uprice3,ncel0,ncel1,ncel2,ncel3,fprice0,fprice1,fprice2,fprice3,fprice4,fprice5,fprice6,fprice7);
	//ctrl,uprice0,uprice1,uprice2,uprice3,ncel0,ncel1,ncel2,ncel3,fprice0,fprice1,fprice2,fprice3,fprice4,fprice5,fprice6,fprice7,ct0,ct1,ct2,ct3,new_ct0,new_ct1,new_ct2,new_ct3,on_off
	//input uprice0,uprice1,uprice2,uprice3,uprice3,ncel0,ncel1,ncel2,ncel3,ct0,ct1,ct2,ct3,ctrl,on_off;
	//output fprice0,fprice1,fprice2,fprice3,fprice4,fprice5,fprice6,fprice7,new_ct0,new_ct1,new_ct2,new_ct3;
	//adder_subtracter ad_sub1(ct0,ct1,ct2,ct3,ncel0,ncel1,ncel2,ncel3,ctrl,on_off,new_ct0,new_ct1,new_ct2,new_ct3);
	//multiplier_4_bit multi1(uprice0,uprice1,uprice2,uprice3,ncel0,ncel1,ncel2,ncel3,fprice0,fprice1,fprice2,fprice3,fprice4,fprice5,fprice6,fprice7);
endmodule





