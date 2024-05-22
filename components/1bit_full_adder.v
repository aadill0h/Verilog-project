module full_adder_1bit(a,b,cin,s,cout);
	input a,b,cin;
	wire w1,w2,w3;
	output s,cout;
	half_adder half1(a,b,w1,w2);//w1=sum ,w2=carry
	half_adder half2(cin,w1,s,w3);//s=sum and w3 takes towards OR gate
	or_gate or1(w2,w3,cout);
endmodule
