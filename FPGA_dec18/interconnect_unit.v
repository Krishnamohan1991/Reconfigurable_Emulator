module interconnect_unit(I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,CLB_prgm_b,interconnect_switch,prgm_b,IQ1,IQ2,IQ3,IQ4,IQ5,IQ6,IQ7,IQ8,lut_inp);
input I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,CLB_prgm_b,I16,prgm_b,IQ1,IQ2,IQ3,IQ4,IQ5,IQ6,IQ7,IQ8;
input [4:0] interconnect_switch;
output reg lut_inp;
initial
begin
if(prgm_b==1'b1)
	lut_inp=1'b0;
	else begin
		lut_inp=1'bx;
	end
end	
always@(*)
begin

if (prgm_b==1'b1 && CLB_prgm_b==1'b0) 
begin
#5	case (interconnect_switch)
5'b00000:  lut_inp=I0;
5'b00001:  lut_inp=I1;
5'b00010:  lut_inp=I2;
5'b00011:  lut_inp=I3;
5'b00100:  lut_inp=I4;
5'b00101:  lut_inp=I5;
5'b00110:  lut_inp=I6;
5'b00111:  lut_inp=I7;
5'b01000:  lut_inp=I8;
5'b01001:  lut_inp=I9;
5'b01010:  lut_inp=I10;
5'b01011:  lut_inp=I11;
5'b01100:  lut_inp=I12;
5'b01101:  lut_inp=I13;
5'b01110:  lut_inp=I14;
5'b01111:  lut_inp=I15;
5'b10000:  lut_inp=IQ1;
5'b10001:  lut_inp=IQ2;
5'b10010:  lut_inp=IQ3;
5'b10011:  lut_inp=IQ4;
5'b10100:  lut_inp=IQ5;
5'b10101:  lut_inp=IQ6;
5'b10110:  lut_inp=IQ7;
5'b10111:  lut_inp=IQ8;
default: lut_inp=1'bz;   //,IQ1,IQ2,IQ3,IQ4,IQ5,IQ6,IQ7,IQ8, if LUT input is not used
endcase

end

end
endmodule
