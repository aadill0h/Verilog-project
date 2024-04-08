module FCIMS_tb;

reg uprice0,uprice1,uprice2,uprice3,ncel0,ncel1,ncel2,ncel3,ct0,ct1,ct2,ct3,ctrl,reset,tprice_init0,tprice_init1,tprice_init2,tprice_init3,tprice_init4,tprice_init5,tprice_init6,tprice_init7;
wire fprice0,fprice1,fprice2,fprice3,fprice4,fprice5,fprice6,fprice7,new_ct0,new_ct1,new_ct2,new_ct3,tprice_final0,tprice_final1,tprice_final2,tprice_final3,tprice_final4,tprice_final5,tprice_final6,tprice_final7,empty;
	

FCIMS ff(reset,ctrl,uprice0,uprice1,uprice2,uprice3,ncel0,ncel1,ncel2,ncel3,ct0,ct1,ct2,ct3,fprice0,fprice1,fprice2,fprice3,fprice4,fprice5,fprice6,fprice7,new_ct0,new_ct1,new_ct2,new_ct3,tprice_init0,tprice_init1,tprice_init2,tprice_init3,tprice_init4,tprice_init5,tprice_init6,tprice_init7,tprice_final0,tprice_final1,tprice_final2,tprice_final3,tprice_final4,tprice_final5,tprice_final6,tprice_final7,empty);

initial begin
reset=0;uprice0=0;uprice1=0;uprice2=0;uprice3=1;ncel0=1;ncel1=1;ncel2=0;ncel3=0;ct0=1;ct1=1;ct2=1;ct3=1;ctrl=1;tprice_init0=0;tprice_init1=0;tprice_init2=0;tprice_init3=0;tprice_init4=0;tprice_init5=0;tprice_init6=0;tprice_init7=0;
#10
reset=0;uprice0=0;uprice1=1;uprice2=0;uprice3=0;ncel0=0;ncel1=1;ncel2=0;ncel3=0;ct0=0;ct1=0;ct2=1;ct3=1;ctrl=1;tprice_init0=0;tprice_init1=0;tprice_init2=0;tprice_init3=1;tprice_init4=1;tprice_init5=0;tprice_init6=0;tprice_init7=0;
#10
reset=0;uprice0=1;uprice1=1;uprice2=0;uprice3=0;ncel0=0;ncel1=1;ncel2=0;ncel3=0;ct0=0;ct1=1;ct2=0;ct3=1;ctrl=0;tprice_init0=0;tprice_init1=0;tprice_init2=1;tprice_init3=1;tprice_init4=1;tprice_init5=0;tprice_init6=0;tprice_init7=0;
#10
reset=0;uprice0=1;uprice1=1;uprice2=0;uprice3=0;ncel0=0;ncel1=0;ncel2=0;ncel3=0;ct0=0;ct1=0;ct2=0;ct3=0;ctrl=0;tprice_init0=0;tprice_init1=0;tprice_init2=1;tprice_init3=1;tprice_init4=1;tprice_init5=0;tprice_init6=0;tprice_init7=0;
#10
$finish();
end

endmodule


