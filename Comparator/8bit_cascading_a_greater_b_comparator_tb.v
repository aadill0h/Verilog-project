//this comparator only checks if a>b and nothing more
module <top_level_entity>;
//replace with your own top level entity

reg a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7;
wire a_greater_b;

<top_level_entity> ff(a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7,a_greater_b);

initial begin
a0=1;a1=0;a2=1;a3=1;a4=0;a5=0;a6=1;a7=1;b0=1;b1=0;b2=1;b3=1;b4=0;b5=1;b6=1;b7=1;
#10
a0=1;a1=0;a2=0;a3=1;a4=1;a5=1;a6=0;a7=1;b0=1;b1=0;b2=1;b3=1;b4=1;b5=0;b6=0;b7=1
$finish();

end

endmodule
