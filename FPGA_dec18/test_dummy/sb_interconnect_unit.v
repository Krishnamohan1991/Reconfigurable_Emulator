module sb_interconnect_unit(I1,I2,I3,interconnect_switch);
inout I1,I2,I3;
input CLB_prgm_b,prgm_b;
input [4:0] interconnect_switch;
//output reg lut_inp;
/*initial
begin
if(prgm_b==1'b1)
	lut_inp=1'b0;
	else begin
		lut_inp=1'bx;
	end
end	*/
always@(*)
begin


#5	case (interconnect_switch)
5'b00000:  I2=I1;
5'b00001:  I1=I2;
5'b00010:  I3=I1;
5'b00011:  I1=I4;
  //,IQ1,IQ2,IQ3,IQ4,IQ5,IQ6,IQ7,IQ8, if LUT input is not used
endcase


end
endmodule