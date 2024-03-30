
module FCIMS_tb;
reg a0,a1,a2,a3,b0,b1,b2,b3;
wire p0,p1,p2,p3,p4,p5,p6,p7;

FCIMS uut(a0,a1,a2,a3,b0,b1,b2,b3,p0,p1,p2,p3,p4,p5,p6,p7);

initial begin
a3 = 1;a2 = 0;a1 =1;a0 =0; b3 = 0; b2= 1; b1 =0 ;b0=1;
#10

$finish();
end
                
endmodule