module FPGA(V0_0,V0_1,V0_2,V0_3,V0_4,V0_5,V0_6,V0_7,V1_0,V1_1,V1_2,V1_3,V1_4,V1_5,V1_6,V1_7,
            H0_0,H0_1,H0_2,H0_3,H0_4,H0_5,H0_6,H0_7,H1_0,H1_1,H1_2,H1_3,H1_4,H1_5,H1_6,H1_7,
            clk,reset,prgm_b,CLB_prgm_b,cb_prgm_b,sb_prgm_b,sb_prgm_b_2,bit_in_CLB,bit_in_CB,sb_prgm_b_in,cb_prgm_b_in,CLB_prgm_b_in,bit_in_SB,bit_in_SB_2);

input clk,reset,prgm_b,clb_prgm_b,cb_prgm_b,bit_in_CLB,bit_in_CB,CLB_prgm_b,CLB_prgm_b_in,cb_prgm_b_in,sb_prgm_b_in,bit_in_SB,sb_prgm_b,bit_in_SB_2,sb_prgm_b_2;

inout V0_0,V0_1,V0_2,V0_3,V0_4,V0_5,V0_6,V0_7,V1_0,V1_1,V1_2,V1_3,V1_4,V1_5,V1_6,V1_7,V2_0,V2_1,V2_2,V2_3,V2_4,V2_5,V2_6,V2_7,
            H0_0,H0_1,H0_2,H0_3,H0_4,H0_5,H0_6,H0_7,H1_0,H1_1,H1_2,H1_3,H1_4,H1_5,H1_6,H1_7,H2_0,H2_1,H2_2,H2_3,H2_4,H2_5,H2_6,H2_7;

wire CLB_prgm_b_out_1,sb_prgm_b_out_1,sb_prgm_b_out_2,sb_prgm_b_out_3,sb_prgm_b_out_4;

wire x5,x6,x7,x8,CLB1_q3,CLB1_q4;
wire x5_1,x6_1,x7_1,x8_1,CLB1_q3_1,CLB1_q4_1;
wire x5_2,x6_2,x7_2,x8_2,CLB1_q3_2,CLB1_q4_2;
wire x5_3,x6_3,x7_3,x8_3,CLB1_q3_3,CLB1_q4_3;

wire cb_prgm_b_out,cb_prgm_b_out_1,cb_prgm_b_out_2,cb_prgm_b_out_3;
wire SB1_SB2_0,SB1_SB2_1,SB1_SB2_2,SB1_SB2_3,SB1_SB2_4,SB1_SB2_5,SB1_SB2_6,SB1_SB2_7;
wire SB1_SB4_0,SB1_SB4_1,SB1_SB4_2,SB1_SB4_3,SB1_SB4_4,SB1_SB4_5,SB1_SB4_6,SB1_SB4_7;


wire SB2_SB6_0,SB2_SB6_1,SB2_SB6_2,SB2_SB6_3,SB2_SB6_4,SB2_SB6_5,SB2_SB6_6,SB2_SB6_7,

SB3_VY1_0,SB3_VY1_1,SB3_VY1_2,SB3_VY1_3,SB3_VY1_4,SB3_VY1_5,SB3_VY1_6,SB3_VY1_7;




wire CLB_I1,CLB_I2,CLB_I3,CLB_I4,CLB_I5,CLB_I6,CLB_I7,CLB_I8,CLB_I9,CLB_I10,CLB_I11,CLB_I12,CLB_I13,CLB_I14,CLB_I15,CLB_I0;
wire CLB_IQ1,CLB_IQ2,CLB_IQ3,CLB_IQ4,CLB_IQ5,CLB_IQ6,CLB_IQ7,CLB_IQ8;

 CB CB00(.x1(CLB_I12),.x2(CLB_I13),.x3(CLB_I14),.x4(CLB_I15),.q1(CLB_IQ7),.q2(CLB_IQ8),
 	.G0(SB1_SB2_0),.G1(SB1_SB2_1),.G2(SB1_SB2_2),.G3(SB1_SB2_3),.G4(SB1_SB2_4),.G5(SB1_SB2_5),.G6(SB1_SB2_6),.G7(SB1_SB2_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),
 	.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out),.cb_prgm_b_in(cb_prgm_b_in));


CB CB01(.x1(CLB_I4),.x2(CLB_I5),.x3(CLB_I6),.x4(CLB_I7),.q1(CLB_IQ3),.q2(CLB_IQ4),
   .G0(SB2_SB3_0),.G1(SB2_SB3_1),.G2(SB2_SB3_2),.G3(SB2_SB3_3),.G4(SB2_SB3_4),.G5(SB2_SB3_5),.G6(SB2_SB3_6),.G7(SB2_SB3_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),
   .cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_1),.cb_prgm_b_in(cb_prgm_b_out));

CB CB02(.x1(CLB_I8),.x2(CLB_I9),.x3(CLB_I10),.x4(CLB_I11),.q1(CLB_IQ5),.q2(CLB_IQ6),
   .G0(SB3_SB4_0),.G1(SB3_SB4_1),.G2(SB3_SB4_2),.G3(SB3_SB4_3),.G4(SB3_SB4_4),.G5(SB3_SB4_5),.G6(SB3_SB4_6),.G7(SB3_SB4_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),
   .cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_2),.cb_prgm_b_in(cb_prgm_b_out_1));

CB CB03(.x1(CLB_I0),.x2(CLB_I1),.x3(CLB_I2),.x4(CLB_I3),.q1(CLB_IQ1),.q2(CLB_IQ2),
   .G0(SB1_SB4_0),.G1(SB1_SB4_1),.G2(SB1_SB4_2),.G3(SB1_SB4_3),.G4(SB1_SB4_4),.G5(SB1_SB4_5),.G6(SB1_SB4_6),.G7(SB1_SB4_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),
   .cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_3),.cb_prgm_b_in(cb_prgm_b_out_2));

CLB CLB00(.I1(CLB_I1),.I2(CLB_I2),.I3(CLB_I3),.I4(CLB_I4),.I5(CLB_I5),.I6(CLB_I6),.I7(CLB_I7),.I8(CLB_I8),.I9(CLB_I9),.I10(CLB_I10),.I11(CLB_I11),
	.I12(CLB_I12),.I13(CLB_I13),.I14(CLB_I14),.I15(CLB_I15),.I0(CLB_I0),.IQ1(CLB_IQ1),.IQ2(CLB_IQ2),.IQ3(CLB_IQ3),.IQ4(CLB_IQ4),.IQ5(CLB_IQ5),
	.IQ6(CLB_IQ6),.IQ7(CLB_IQ7),.IQ8(CLB_IQ8),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB_prgm_b_in),.CLB_prgm_b_out(CLB_prgm_b_out_1)); 

switch_block SB00(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(sb_prgm_b_in),.sb_prgm_b_out(sb_prgm_b_out_1),
                                 .A0(V0_0),.A1(V0_1),.A2(V0_2),.A3(V0_3),.A4(V0_4),.A5(V0_5),.A6(V0_6),.A7(V0_7),
                                 .B0(SB1_SB2_0),.B1(SB1_SB2_1),.B2(SB1_SB2_2),.B3(SB1_SB2_3),.B4(SB1_SB2_4),.B5(SB1_SB2_5),.B6(SB1_SB2_6),.B7(SB1_SB2_7),
                                 .C0(SB1_SB4_0),.C1(SB1_SB4_1),.C2(SB1_SB4_2),.C3(SB1_SB4_3),.C4(SB1_SB4_4),.C5(SB1_SB4_5),.C6(SB1_SB4_6),.C7(SB1_SB4_7),
                                 .D0(H0_0),.D1(H0_1),.D2(H0_2),.D3(H0_3),.D4(H0_4),.D5(H0_5),.D6(H0_6),.D7(H0_7));

switch_block SB01(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(sb_prgm_b_out_1),.sb_prgm_b_out(sb_prgm_b_out_2),
                                 .A0(V1_0),.A1(V1_1),.A2(V1_2),.A3(V1_3),.A4(V1_4),.A5(V1_5),.A6(V1_6),.A7(V1_7),
                                 .B0(SB2_SB5_0),.B1(SB2_SB5_1),.B2(SB2_SB5_2),.B3(SB2_SB5_3),.B4(SB2_SB5_4),.B5(SB2_SB5_5),.B6(SB2_SB5_6),.B7(SB2_SB5_7),
                                 .C0(SB2_SB3_0),.C1(SB2_SB3_1),.C2(SB2_SB3_2),.C3(SB2_SB3_3),.C4(SB2_SB3_4),.C5(SB2_SB3_5),.C6(SB2_SB3_6),.C7(SB2_SB3_7),
                                 .D0(SB1_SB2_0),.D1(SB1_SB2_1),.D2(SB1_SB2_2),.D3(SB1_SB2_3),.D4(SB1_SB2_4),.D5(SB1_SB2_5),.D6(SB1_SB2_6),.D7(SB1_SB2_7));


switch_block SB10(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(sb_prgm_b_out_2),.sb_prgm_b_out(sb_prgm_b_out_3),
                                  .A0(SB1_SB4_0),.A1(SB1_SB4_1),.A2(SB1_SB4_2),.A3(SB1_SB4_3),.A4(SB1_SB4_4),.A5(SB1_SB4_5),.A6(SB1_SB4_6),.A7(SB1_SB4_7),
                                 .B0(SB3_SB4_0),.B1(SB3_SB4_1),.B2(SB3_SB4_2),.B3(SB3_SB4_3),.B4(SB3_SB4_4),.B5(SB3_SB4_5),.B6(SB3_SB4_6),.B7(SB3_SB4_7),
                                 .C0(SB4_VY2_0),.C1(SB4_VY2_1),.C2(SB4_VY2_2),.C3(SB4_VY2_3),.C4(SB4_VY2_4),.C5(SB4_VY2_5),.C6(SB4_VY2_6),.C7(SB4_VY2_7),
                                 .D0(H1_0),.D1(H1_1),.D2(H1_2),.D3(H1_3),.D4(H1_4),.D5(H1_5),.D6(H1_6),.D7(H1_7));

switch_block SB11(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(sb_prgm_b_out_3),.sb_prgm_b_out(sb_prgm_b_out_4),
                                 .A0(SB2_SB3_0),.A1(SB2_SB3_1),.A2(SB2_SB3_2),.A3(SB2_SB3_3),.A4(SB2_SB3_4),.A5(SB2_SB3_5),.A6(SB2_SB3_6),.A7(SB2_SB3_7),
                                 .B0(SB2_SB6_0),.B1(SB2_SB6_1),.B2(SB2_SB6_2),.B3(SB2_SB6_3),.B4(SB2_SB6_4),.B5(SB2_SB6_5),.B6(SB2_SB6_6),.B7(SB2_SB6_7),
                                 .C0(SB3_VY1_0),.C1(SB3_VY1_1),.C2(SB3_VY1_2),.C3(SB3_VY1_3),.C4(SB3_VY1_4),.C5(SB3_VY1_5),.C6(SB3_VY1_6),.C7(SB3_VY1_7),
                                 .D0(SB3_SB4_0),.D1(SB3_SB4_1),.D2(SB3_SB4_2),.D3(SB3_SB4_3),.D4(SB3_SB4_4),.D5(SB3_SB4_5),.D6(SB3_SB4_6),.D7(SB3_SB4_7));


endmodule
