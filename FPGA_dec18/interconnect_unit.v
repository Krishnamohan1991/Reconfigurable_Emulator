module interconnect_unit(I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,CLB_prgm_b,interconnect_switch,prgm_b,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,lut_inp
,BY_0,BY_1,BY_2,BY_3,BY_4,BY_5,,BY_6,BY_7,RQ0,RQ1,RQ2,RQ3,RQ4,RQ5,RQ6,RQ7);

input I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,CLB_prgm_b,I16,prgm_b,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
input BY_0,BY_1,BY_2,BY_3,BY_4,BY_5,BY_6,BY_7,RQ0,RQ1,RQ2,RQ3,RQ4,RQ5,RQ6,RQ7;
input [5:0] interconnect_switch;
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
6'b000000:lut_inp=I0;
6'b000001: lut_inp=I1;
6'b000010: lut_inp=I2;
6'b000011: lut_inp=I3;
6'b000100: lut_inp=I4;
6'b000101: lut_inp=I5;
6'b000110: lut_inp=I6;
6'b000111: lut_inp=I7;
6'b001000: lut_inp=I8;
6'b001001: lut_inp=I9;
6'b001010: lut_inp=I10;
6'b001011: lut_inp=I11;
6'b001100: lut_inp=I12;
6'b001101: lut_inp=I13;
6'b001110: lut_inp=I14;
6'b001111: lut_inp=I15;
6'b010000: lut_inp=Q0;
6'b010001: lut_inp=Q1;
6'b010010: lut_inp=Q2;
6'b010011: lut_inp=Q3;
6'b010100: lut_inp=Q4;
6'b010101: lut_inp=Q5;
6'b010110: lut_inp=Q6;
6'b010111: lut_inp=Q7;
6'b011000: lut_inp=RQ0;
6'b011001: lut_inp=RQ1;
6'b011010: lut_inp=RQ2;
6'b011011: lut_inp=RQ3;
6'b011100: lut_inp=RQ4;
6'b011101: lut_inp=RQ5;
6'b011110: lut_inp=RQ6;
6'b011111: lut_inp=RQ7;
6'b100000: lut_inp=BY_0;
6'b100001: lut_inp=BY_1;
6'b100010: lut_inp=BY_2;
6'b100011: lut_inp=BY_3;
6'b100100: lut_inp=BY_4;
6'b100101: lut_inp=BY_5;
6'b100110: lut_inp=BY_6;
6'b100111: lut_inp=BY_7;
default: lut_inp=1'bx;   //earler default was 1'bz now changed to 1'bx as actual fpga might not give equivalent sybthesis for high impedence
endcase

end

end
endmodule
