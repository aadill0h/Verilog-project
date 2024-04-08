

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

module xnor_gate(a,b,c);
	input a,b;
	output c;
	wire w1;
	xor_gate xor1(a,b,w1);
	not_gate not1(w1,c);
endmodule

module and3_gate(a,b,c,out);
	input a,b,c;
	output out;
	wire w1;
	
	and_gate and1(a,b,w1);
	and_gate and2(c,w1,out);
endmodule

module and4_gate(a,b,c,d,out);
	input a,b,c,d;
	output out;
	wire w1,w2;
	
	and_gate and1(a,b,w1);
	and_gate and2(w1,c,w2);
	and_gate and3(w2,d,out);
endmodule

module and5_gate(a,b,c,d,e,out);
	input a,b,c,d,e;
	output out;
	wire w1,w2,w3;
	
	and_gate and1(a,b,w1);
	and_gate and2(w1,c,w2);
	and_gate and3(w2,d,w3);
	and_gate and4(w3,e,out);
endmodule
	
module or4_gate(a,b,c,d,out);
	input a,b,c,d;
	output out;
	wire w1,w2;
	
	or_gate or1(a,b,w1);
	or_gate or2(c,w1,w2);
	or_gate or3(d,w2,out);
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

module comparator_8bit(a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7,a_greater_b);
	input a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7;
	output a_greater_b;
	wire a0_3greaterb0_3,a4_7_greater_b4_7,w3,w4,w5,w6,a4_7equalb4_7,w7;
	//a0-3>b0-3
	comparator_4bit low4bit(a0,a1,a2,a3,b0,b1,b2,b3,a0_3greaterb0_3);
	//high4bit a4-7>b4-7
	comparator_4bit high4bit(a4,a5,a6,a7,b4,b5,b6,b7,a4_7_greater_b4_7);
	//a4-7==b4-7
	xnor_gate xnor1(a4,b4,w3);
	xnor_gate xnor2(a5,b5,w4);
	xnor_gate xnor3(a6,b6,w5);
	xnor_gate xnor4(a7,b7,w6);
	and4_gate and4_1(w3,w4,w5,w6,a4_7equalb4_7);
	
	
	and_gate and1(a4_7equalb4_7,a0_3greaterb0_3,w7);
	or_gate or1(w7,a4_7_greater_b4_7,a_greater_b);

endmodule
	
module FCIMS(reset,ctrl,uprice0,uprice1,uprice2,uprice3,ncel0,ncel1,ncel2,ncel3,ct0,ct1,ct2,ct3,fprice0,fprice1,fprice2,fprice3,fprice4,fprice5,fprice6,fprice7,new_ct0,new_ct1,new_ct2,new_ct3,tprice_init0,tprice_init1,tprice_init2,tprice_init3,tprice_init4,tprice_init5,tprice_init6,tprice_init7,tprice_final0,tprice_final1,tprice_final2,tprice_final3,tprice_final4,tprice_final5,tprice_final6,tprice_final7,empty,n_empty0,n_empty1,n_empty2,n_empty3);
	input uprice0,uprice1,uprice2,uprice3,ncel0,ncel1,ncel2,ncel3,ct0,ct1,ct2,ct3,ctrl,reset,tprice_init0,tprice_init1,tprice_init2,tprice_init3,tprice_init4,tprice_init5,tprice_init6,tprice_init7;
	output fprice0,fprice1,fprice2,fprice3,fprice4,fprice5,fprice6,fprice7,new_ct0,new_ct1,new_ct2,new_ct3,tprice_final0,tprice_final1,tprice_final2,tprice_final3,tprice_final4,tprice_final5,tprice_final6,tprice_final7,empty,n_empty0,n_empty1,n_empty2,n_empty3;
	wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,ncell_greater_count,e1;
	
	not_gate not1(reset,w1);
	//if reset ==1 or TRUE then system will be reset
	//if reset==0 system will not be reset
	and_gate and1(uprice0,w1,w2);
	and_gate and2(uprice1,w1,w3);
	and_gate and3(uprice2,w1,w4);
	and_gate and4(uprice3,w1,w5);
	
	and_gate and5(ncel0,w1,w6);
	and_gate and6(ncel1,w1,w7);
	and_gate and7(ncel2,w1,w8);
	and_gate and8(ncel3,w1,w9);
	
	and_gate and9(ct0,w1,w10);
	and_gate and10(ct1,w1,w11);
	and_gate and11(ct2,w1,w12);
	and_gate and12(ct3,w1,w13);
	and_gate and13(ctrl,w1,w14);
	
	and_gate and14(tprice_init0,w1,w15);
	and_gate and15(tprice_init1,w1,w16);
	and_gate and16(tprice_init2,w1,w17);
	and_gate and17(tprice_init3,w1,w18);
	and_gate and18(tprice_init4,w1,w19);
	and_gate and19(tprice_init5,w1,w20);
	and_gate and20(tprice_init6,w1,w21);
	and_gate and21(tprice_init7,w1,w22);
	
	comparator_4bit comp1(w6,w7,w8,w9,w10,w11,w12,w13,ncell_greater_count);
	and_gate and22(ncell_greater_count,w14,w23);
	not_gate not2(w23,w24);
	
	and_gate and23(w24,w6,w25);
	and_gate and24(w24,w7,w26);
	and_gate and25(w24,w8,w27);
	and_gate and26(w24,w9,w28);
	
	multiplier_4_bit multi1(w25,w26,w27,w28,w2,w3,w4,w5,fprice0,fprice1,fprice2,fprice3,fprice4,fprice5,fprice6,fprice7);
	
	not_gate not3(w14,w29);

	
	adder_subtracter ad_sub1(w10,w11,w12,w13,w25,w26,w27,w28,w14,new_ct0,new_ct1,new_ct2,new_ct3);
	adder_8bit add_prod(fprice0,fprice1,fprice2,fprice3,fprice4,fprice5,fprice6,fprice7,w15,w16,w17,w18,w19,w20,w21,w22,tprice_final0,tprice_final1,tprice_final2,tprice_final3,tprice_final4,tprice_final5,tprice_final6,tprice_final7,w29);
	or4_gate or4_1(new_ct0,new_ct1,new_ct2,new_ct3,e1);
	not_gate not4(e1,empty);
	adder_subtracter ad_sub2(1,1,1,1,new_ct0,new_ct1,new_ct2,new_ct3,n_empty0,n_empty1,n_empty2,n_empty3);
endmodule
