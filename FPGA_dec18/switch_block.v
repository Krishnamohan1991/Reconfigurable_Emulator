
module switch_block(bit_in,clk,reset,prgm_b,sb_prgm_b,sb_prgm_b_in,sb_prgm_b_out,sb_prgm_b_out,N0,N1,N2,N3,N4,N5,N6,N7,E0,E1,E2,E3,E4,E5,E6,E7,
	S0,S1,S2,S3,S4,S5,S6,S7,W0,W1,W2,W3,W4,W5,W6,W7);

inout N0,N1,N2,N3,N4,N5,N6,N7,E0,E1,E2,E3,E4,E5,E6,E7,S0,S1,S2,S3,S4,S5,S6,S7,W0,W1,W2,W3,W4,W5,W6,W7;


output sb_prgm_b_out;

input bit_in,prgm_b,sb_prgm_b,sb_prgm_b_in,clk,reset;

 
wire [1:0]N0_E0; wire [1:0]N0_E1; wire [1:0]N0_E2; wire [1:0]N0_E3; wire [1:0]N0_E4; wire [1:0]N0_E5; wire [1:0]N0_E6; wire [1:0]N0_E7; wire [1:0]N0_S0; wire [1:0]N0_S1; wire [1:0]N0_S2; wire [1:0]N0_S3; wire [1:0]N0_S4; wire [1:0]N0_S5; wire [1:0]N0_S6; wire [1:0]N0_S7; wire [1:0]N0_W0; wire [1:0]N0_W1; wire [1:0]N0_W2;wire [1:0]N0_W3; wire [1:0]N0_W4; wire [1:0]N0_W5; wire [1:0]N0_W6; wire [1:0]N0_W7; wire [1:0]N1_E0;
 wire [1:0]N1_E1; wire [1:0]N1_E2; wire [1:0]N1_E3; wire [1:0]N1_E4; wire [1:0]N1_E5; wire [1:0]N1_E6; wire [1:0]N1_E7; wire [1:0]N1_S0; wire [1:0]N1_S1; wire [1:0]N1_S2; wire [1:0]N1_S3; wire [1:0]N1_S4; wire [1:0]N1_S5; wire [1:0]N1_S6; wire [1:0]N1_S7; wire [1:0]N1_W0; wire [1:0]N1_W1; wire [1:0]N1_W2; wire [1:0]N1_W3; wire [1:0]N1_W4; wire [1:0]N1_W5; wire [1:0]N1_W6; wire [1:0]N1_W7; wire [1:0]N2_E0; wire [1:0]N2_E1;
 wire [1:0]N2_E2; wire [1:0]N2_E3; wire [1:0]N2_E4; wire [1:0]N2_E5; wire [1:0]N2_E6; wire [1:0]N2_E7; wire [1:0]N2_S0; wire [1:0]N2_S1; wire [1:0]N2_S2; wire [1:0]N2_S3; wire [1:0]N2_S4; wire [1:0]N2_S5; wire [1:0]N2_S6; wire [1:0]N2_S7; wire [1:0]N2_W0; wire [1:0]N2_W1; wire [1:0]N2_W2; wire [1:0]N2_W3; wire [1:0]N2_W4; wire [1:0]N2_W5; wire [1:0]N2_W6; wire [1:0]N2_W7; wire [1:0]N3_E0; wire [1:0]N3_E1; wire [1:0]N3_E2;
 wire [1:0]N3_E3; wire [1:0]N3_E4; wire [1:0]N3_E5; wire [1:0]N3_E6; wire [1:0]N3_E7; wire [1:0]N3_S0; wire [1:0]N3_S1; wire [1:0]N3_S2; wire [1:0]N3_S3; wire [1:0]N3_S4; wire [1:0]N3_S5; wire [1:0]N3_S6; wire [1:0]N3_S7; wire [1:0]N3_W0; wire [1:0]N3_W1; wire [1:0]N3_W2; wire [1:0]N3_W3; wire [1:0]N3_W4; wire [1:0]N3_W5; wire [1:0]N3_W6; wire [1:0]N3_W7; wire [1:0]N4_E0; wire [1:0]N4_E1; wire [1:0]N4_E2; wire [1:0]N4_E3;
 wire [1:0]N4_E4; wire [1:0]N4_E5; wire [1:0]N4_E6; wire [1:0]N4_E7; wire [1:0]N4_S0; wire [1:0]N4_S1; wire [1:0]N4_S2; wire [1:0]N4_S3; wire [1:0]N4_S4; wire [1:0]N4_S5; wire [1:0]N4_S6; wire [1:0]N4_S7; wire [1:0]N4_W0; wire [1:0]N4_W1; wire [1:0]N4_W2; wire [1:0]N4_W3; wire [1:0]N4_W4; wire [1:0]N4_W5; wire [1:0]N4_W6; wire [1:0]N4_W7; wire [1:0]N5_E0; wire [1:0]N5_E1; wire [1:0]N5_E2; wire [1:0]N5_E3; wire [1:0]N5_E4;
 wire [1:0]N5_E5; wire [1:0]N5_E6; wire [1:0]N5_E7; wire [1:0]N5_S0; wire [1:0]N5_S1; wire [1:0]N5_S2; wire [1:0]N5_S3; wire [1:0]N5_S4; wire [1:0]N5_S5; wire [1:0]N5_S6; wire [1:0]N5_S7; wire [1:0]N5_W0; wire [1:0]N5_W1; wire [1:0]N5_W2; wire [1:0]N5_W3; wire [1:0]N5_W4; wire [1:0]N5_W5; wire [1:0]N5_W6; wire [1:0]N5_W7; wire [1:0]N6_E0; wire [1:0]N6_E1; wire [1:0]N6_E2; wire [1:0]N6_E3; wire [1:0]N6_E4; wire [1:0]N6_E5;
 wire [1:0]N6_E6; wire [1:0]N6_E7; wire [1:0]N6_S0; wire [1:0]N6_S1; wire [1:0]N6_S2; wire [1:0]N6_S3; wire [1:0]N6_S4; wire [1:0]N6_S5; wire [1:0]N6_S6; wire [1:0]N6_S7; wire [1:0]N6_W0; wire [1:0]N6_W1; wire [1:0]N6_W2; wire [1:0]N6_W3; wire [1:0]N6_W4; wire [1:0]N6_W5; wire [1:0]N6_W6; wire [1:0]N6_W7; wire [1:0]N7_E0; wire [1:0]N7_E1; wire [1:0]N7_E2; wire [1:0]N7_E3; wire [1:0]N7_E4; wire [1:0]N7_E5; wire [1:0]N7_E6;
 wire [1:0]N7_E7; wire [1:0]N7_S0; wire [1:0]N7_S1; wire [1:0]N7_S2; wire [1:0]N7_S3; wire [1:0]N7_S4; wire [1:0]N7_S5; wire [1:0]N7_S6; wire [1:0]N7_S7; wire [1:0]N7_W0; wire [1:0]N7_W1; wire [1:0]N7_W2; wire [1:0]N7_W3; wire [1:0]N7_W4; wire [1:0]N7_W5; wire [1:0]N7_W6; wire [1:0]N7_W7; wire [1:0]E0_W0; wire [1:0]E0_W1; wire [1:0]E0_W2; wire [1:0]E0_W3; wire [1:0]E0_W4; wire [1:0]E0_W5; wire [1:0]E0_W6; wire [1:0]E0_W7;
 wire [1:0]E0_S0; wire [1:0]E0_S1; wire [1:0]E0_S2; wire [1:0]E0_S3; wire [1:0]E0_S4; wire [1:0]E0_S5; wire [1:0]E0_S6; wire [1:0]E0_S7; wire [1:0]E1_W0; wire [1:0]E1_W1; wire [1:0]E1_W2; wire [1:0]E1_W3; wire [1:0]E1_W4; wire [1:0]E1_W5; wire [1:0]E1_W6; wire [1:0]E1_W7; wire [1:0]E1_S0; wire [1:0]E1_S1; wire [1:0]E1_S2; wire [1:0]E1_S3; wire [1:0]E1_S4; wire [1:0]E1_S5; wire [1:0]E1_S6; wire [1:0]E1_S7; wire [1:0]E2_W0;
 wire [1:0]E2_W1; wire [1:0]E2_W2; wire [1:0]E2_W3; wire [1:0]E2_W4; wire [1:0]E2_W5; wire [1:0]E2_W6; wire [1:0]E2_W7; wire [1:0]E2_S0; wire [1:0]E2_S1; wire [1:0]E2_S2; wire [1:0]E2_S3; wire [1:0]E2_S4; wire [1:0]E2_S5; wire [1:0]E2_S6; wire [1:0]E2_S7; wire [1:0]E3_W0; wire [1:0]E3_W1; wire [1:0]E3_W2; wire [1:0]E3_W3; wire [1:0]E3_W4; wire [1:0]E3_W5; wire [1:0]E3_W6; wire [1:0]E3_W7; wire [1:0]E3_S0; wire [1:0]E3_S1;
 wire [1:0]E3_S2; wire [1:0]E3_S3; wire [1:0]E3_S4; wire [1:0]E3_S5; wire [1:0]E3_S6; wire [1:0]E3_S7; wire [1:0]E4_W0; wire [1:0]E4_W1; wire [1:0]E4_W2; wire [1:0]E4_W3; wire [1:0]E4_W4; wire [1:0]E4_W5; wire [1:0]E4_W6; wire [1:0]E4_W7; wire [1:0]E4_S0; wire [1:0]E4_S1; wire [1:0]E4_S2; wire [1:0]E4_S3; wire [1:0]E4_S4; wire [1:0]E4_S5; wire [1:0]E4_S6; wire [1:0]E4_S7; wire [1:0]E5_W0; wire [1:0]E5_W1; wire [1:0]E5_W2;
 wire [1:0]E5_W3; wire [1:0]E5_W4; wire [1:0]E5_W5; wire [1:0]E5_W6; wire [1:0]E5_W7; wire [1:0]E5_S0; wire [1:0]E5_S1; wire [1:0]E5_S2; wire [1:0]E5_S3; wire [1:0]E5_S4; wire [1:0]E5_S5; wire [1:0]E5_S6; wire [1:0]E5_S7; wire [1:0]E6_W0; wire [1:0]E6_W1; wire [1:0]E6_W2; wire [1:0]E6_W3; wire [1:0]E6_W4; wire [1:0]E6_W5; wire [1:0]E6_W6; wire [1:0]E6_W7; wire [1:0]E6_S0; wire [1:0]E6_S1; wire [1:0]E6_S2; wire [1:0]E6_S3;
 wire [1:0]E6_S4; wire [1:0]E6_S5; wire [1:0]E6_S6; wire [1:0]E6_S7; wire [1:0]E7_W0; wire [1:0]E7_W1; wire [1:0]E7_W2; wire [1:0]E7_W3; wire [1:0]E7_W4; wire [1:0]E7_W5; wire [1:0]E7_W6; wire [1:0]E7_W7; wire [1:0]E7_S0; wire [1:0]E7_S1; wire [1:0]E7_S2; wire [1:0]E7_S3; wire [1:0]E7_S4; wire [1:0]E7_S5; wire [1:0]E7_S6; wire [1:0]E7_S7; wire [1:0]S0_W0; wire [1:0]S0_W1; wire [1:0]S0_W2; wire [1:0]S0_W3; wire [1:0]S0_W4;
 wire [1:0]S0_W5; wire [1:0]S0_W6; wire [1:0]S0_W7; wire [1:0]S1_W0; wire [1:0]S1_W1; wire [1:0]S1_W2; wire [1:0]S1_W3; wire [1:0]S1_W4; wire [1:0]S1_W5; wire [1:0]S1_W6; wire [1:0]S1_W7; wire [1:0]S2_W0; wire [1:0]S2_W1; wire [1:0]S2_W2; wire [1:0]S2_W3; wire [1:0]S2_W4; wire [1:0]S2_W5; wire [1:0]S2_W6; wire [1:0]S2_W7; wire [1:0]S3_W0; wire [1:0]S3_W1; wire [1:0]S3_W2; wire [1:0]S3_W3; wire [1:0]S3_W4; wire [1:0]S3_W5;
 wire [1:0]S3_W6; wire [1:0]S3_W7; wire [1:0]S4_W0; wire [1:0]S4_W1; wire [1:0]S4_W2; wire [1:0]S4_W3; wire [1:0]S4_W4; wire [1:0]S4_W5; wire [1:0]S4_W6; wire [1:0]S4_W7; wire [1:0]S5_W0; wire [1:0]S5_W1; wire [1:0]S5_W2; wire [1:0]S5_W3; wire [1:0]S5_W4; wire [1:0]S5_W5; wire [1:0]S5_W6; wire [1:0]S5_W7; wire [1:0]S6_W0; wire [1:0]S6_W1; wire [1:0]S6_W2; wire [1:0]S6_W3; wire [1:0]S6_W4; wire [1:0]S6_W5; wire [1:0]S6_W6;
 wire [1:0]S6_W7; wire [1:0]S7_W0; wire [1:0]S7_W1; wire [1:0]S7_W2; wire [1:0]S7_W3; wire [1:0]S7_W4; wire [1:0]S7_W5; wire [1:0]S7_W6; wire [1:0]S7_W7;

SB_config_behav SB_behav_config(.bit_in(bit_in),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.clk(clk),.reset(reset),.sb_prgm_b_in(sb_prgm_b_in),.sb_prgm_b_out(sb_prgm_b_out),
.N0_E0(N0_E0),.N0_E1(N0_E1),.N0_E2(N0_E2),.N0_E3(N0_E3),.N0_E4(N0_E4),.N0_E5(N0_E5),.N0_E6(N0_E6),.N0_E7(N0_E7),.N0_S0(N0_S0),.N0_S1(N0_S1),.N0_S2(N0_S2),.N0_S3(N0_S3),.N0_S4(N0_S4),.N0_S5(N0_S5),.N0_S6(N0_S6),.N0_S7(N0_S7),.N0_W0(N0_W0),.N0_W1(N0_W1),.N0_W2(N0_W2),.N0_W3(N0_W3),.N0_W4(N0_W4),.N0_W5(N0_W5),.N0_W6(N0_W6),.N0_W7(N0_W7),.N1_E0(N1_E0),
.N1_E1(N1_E1),.N1_E2(N1_E2),.N1_E3(N1_E3),.N1_E4(N1_E4),.N1_E5(N1_E5),.N1_E6(N1_E6),.N1_E7(N1_E7),.N1_S0(N1_S0),.N1_S1(N1_S1),.N1_S2(N1_S2),.N1_S3(N1_S3),.N1_S4(N1_S4),.N1_S5(N1_S5),.N1_S6(N1_S6),.N1_S7(N1_S7),.N1_W0(N1_W0),.N1_W1(N1_W1),.N1_W2(N1_W2),.N1_W3(N1_W3),.N1_W4(N1_W4),.N1_W5(N1_W5),.N1_W6(N1_W6),.N1_W7(N1_W7),.N2_E0(N2_E0),.N2_E1(N2_E1),
.N2_E2(N2_E2),.N2_E3(N2_E3),.N2_E4(N2_E4),.N2_E5(N2_E5),.N2_E6(N2_E6),.N2_E7(N2_E7),.N2_S0(N2_S0),.N2_S1(N2_S1),.N2_S2(N2_S2),.N2_S3(N2_S3),.N2_S4(N2_S4),.N2_S5(N2_S5),.N2_S6(N2_S6),.N2_S7(N2_S7),.N2_W0(N2_W0),.N2_W1(N2_W1),.N2_W2(N2_W2),.N2_W3(N2_W3),.N2_W4(N2_W4),.N2_W5(N2_W5),.N2_W6(N2_W6),.N2_W7(N2_W7),.N3_E0(N3_E0),.N3_E1(N3_E1),.N3_E2(N3_E2),
.N3_E3(N3_E3),.N3_E4(N3_E4),.N3_E5(N3_E5),.N3_E6(N3_E6),.N3_E7(N3_E7),.N3_S0(N3_S0),.N3_S1(N3_S1),.N3_S2(N3_S2),.N3_S3(N3_S3),.N3_S4(N3_S4),.N3_S5(N3_S5),.N3_S6(N3_S6),.N3_S7(N3_S7),.N3_W0(N3_W0),.N3_W1(N3_W1),.N3_W2(N3_W2),.N3_W3(N3_W3),.N3_W4(N3_W4),.N3_W5(N3_W5),.N3_W6(N3_W6),.N3_W7(N3_W7),.N4_E0(N4_E0),.N4_E1(N4_E1),.N4_E2(N4_E2),.N4_E3(N4_E3),
.N4_E4(N4_E4),.N4_E5(N4_E5),.N4_E6(N4_E6),.N4_E7(N4_E7),.N4_S0(N4_S0),.N4_S1(N4_S1),.N4_S2(N4_S2),.N4_S3(N4_S3),.N4_S4(N4_S4),.N4_S5(N4_S5),.N4_S6(N4_S6),.N4_S7(N4_S7),.N4_W0(N4_W0),.N4_W1(N4_W1),.N4_W2(N4_W2),.N4_W3(N4_W3),.N4_W4(N4_W4),.N4_W5(N4_W5),.N4_W6(N4_W6),.N4_W7(N4_W7),.N5_E0(N5_E0),.N5_E1(N5_E1),.N5_E2(N5_E2),.N5_E3(N5_E3),.N5_E4(N5_E4),
.N5_E5(N5_E5),.N5_E6(N5_E6),.N5_E7(N5_E7),.N5_S0(N5_S0),.N5_S1(N5_S1),.N5_S2(N5_S2),.N5_S3(N5_S3),.N5_S4(N5_S4),.N5_S5(N5_S5),.N5_S6(N5_S6),.N5_S7(N5_S7),.N5_W0(N5_W0),.N5_W1(N5_W1),.N5_W2(N5_W2),.N5_W3(N5_W3),.N5_W4(N5_W4),.N5_W5(N5_W5),.N5_W6(N5_W6),.N5_W7(N5_W7),.N6_E0(N6_E0),.N6_E1(N6_E1),.N6_E2(N6_E2),.N6_E3(N6_E3),.N6_E4(N6_E4),.N6_E5(N6_E5),
.N6_E6(N6_E6),.N6_E7(N6_E7),.N6_S0(N6_S0),.N6_S1(N6_S1),.N6_S2(N6_S2),.N6_S3(N6_S3),.N6_S4(N6_S4),.N6_S5(N6_S5),.N6_S6(N6_S6),.N6_S7(N6_S7),.N6_W0(N6_W0),.N6_W1(N6_W1),.N6_W2(N6_W2),.N6_W3(N6_W3),.N6_W4(N6_W4),.N6_W5(N6_W5),.N6_W6(N6_W6),.N6_W7(N6_W7),.N7_E0(N7_E0),.N7_E1(N7_E1),.N7_E2(N7_E2),.N7_E3(N7_E3),.N7_E4(N7_E4),.N7_E5(N7_E5),.N7_E6(N7_E6),
.N7_E7(N7_E7),.N7_S0(N7_S0),.N7_S1(N7_S1),.N7_S2(N7_S2),.N7_S3(N7_S3),.N7_S4(N7_S4),.N7_S5(N7_S5),.N7_S6(N7_S6),.N7_S7(N7_S7),.N7_W0(N7_W0),.N7_W1(N7_W1),.N7_W2(N7_W2),.N7_W3(N7_W3),.N7_W4(N7_W4),.N7_W5(N7_W5),.N7_W6(N7_W6),.N7_W7(N7_W7),.E0_W0(E0_W0),.E0_W1(E0_W1),.E0_W2(E0_W2),.E0_W3(E0_W3),.E0_W4(E0_W4),.E0_W5(E0_W5),.E0_W6(E0_W6),.E0_W7(E0_W7),
.E0_S0(E0_S0),.E0_S1(E0_S1),.E0_S2(E0_S2),.E0_S3(E0_S3),.E0_S4(E0_S4),.E0_S5(E0_S5),.E0_S6(E0_S6),.E0_S7(E0_S7),.E1_W0(E1_W0),.E1_W1(E1_W1),.E1_W2(E1_W2),.E1_W3(E1_W3),.E1_W4(E1_W4),.E1_W5(E1_W5),.E1_W6(E1_W6),.E1_W7(E1_W7),.E1_S0(E1_S0),.E1_S1(E1_S1),.E1_S2(E1_S2),.E1_S3(E1_S3),.E1_S4(E1_S4),.E1_S5(E1_S5),.E1_S6(E1_S6),.E1_S7(E1_S7),.E2_W0(E2_W0),
.E2_W1(E2_W1),.E2_W2(E2_W2),.E2_W3(E2_W3),.E2_W4(E2_W4),.E2_W5(E2_W5),.E2_W6(E2_W6),.E2_W7(E2_W7),.E2_S0(E2_S0),.E2_S1(E2_S1),.E2_S2(E2_S2),.E2_S3(E2_S3),.E2_S4(E2_S4),.E2_S5(E2_S5),.E2_S6(E2_S6),.E2_S7(E2_S7),.E3_W0(E3_W0),.E3_W1(E3_W1),.E3_W2(E3_W2),.E3_W3(E3_W3),.E3_W4(E3_W4),.E3_W5(E3_W5),.E3_W6(E3_W6),.E3_W7(E3_W7),.E3_S0(E3_S0),.E3_S1(E3_S1),
.E3_S2(E3_S2),.E3_S3(E3_S3),.E3_S4(E3_S4),.E3_S5(E3_S5),.E3_S6(E3_S6),.E3_S7(E3_S7),.E4_W0(E4_W0),.E4_W1(E4_W1),.E4_W2(E4_W2),.E4_W3(E4_W3),.E4_W4(E4_W4),.E4_W5(E4_W5),.E4_W6(E4_W6),.E4_W7(E4_W7),.E4_S0(E4_S0),.E4_S1(E4_S1),.E4_S2(E4_S2),.E4_S3(E4_S3),.E4_S4(E4_S4),.E4_S5(E4_S5),.E4_S6(E4_S6),.E4_S7(E4_S7),.E5_W0(E5_W0),.E5_W1(E5_W1),.E5_W2(E5_W2),
.E5_W3(E5_W3),.E5_W4(E5_W4),.E5_W5(E5_W5),.E5_W6(E5_W6),.E5_W7(E5_W7),.E5_S0(E5_S0),.E5_S1(E5_S1),.E5_S2(E5_S2),.E5_S3(E5_S3),.E5_S4(E5_S4),.E5_S5(E5_S5),.E5_S6(E5_S6),.E5_S7(E5_S7),.E6_W0(E6_W0),.E6_W1(E6_W1),.E6_W2(E6_W2),.E6_W3(E6_W3),.E6_W4(E6_W4),.E6_W5(E6_W5),.E6_W6(E6_W6),.E6_W7(E6_W7),.E6_S0(E6_S0),.E6_S1(E6_S1),.E6_S2(E6_S2),.E6_S3(E6_S3),
.E6_S4(E6_S4),.E6_S5(E6_S5),.E6_S6(E6_S6),.E6_S7(E6_S7),.E7_W0(E7_W0),.E7_W1(E7_W1),.E7_W2(E7_W2),.E7_W3(E7_W3),.E7_W4(E7_W4),.E7_W5(E7_W5),.E7_W6(E7_W6),.E7_W7(E7_W7),.E7_S0(E7_S0),.E7_S1(E7_S1),.E7_S2(E7_S2),.E7_S3(E7_S3),.E7_S4(E7_S4),.E7_S5(E7_S5),.E7_S6(E7_S6),.E7_S7(E7_S7),.S0_W0(S0_W0),.S0_W1(S0_W1),.S0_W2(S0_W2),.S0_W3(S0_W3),.S0_W4(S0_W4),
.S0_W5(S0_W5),.S0_W6(S0_W6),.S0_W7(S0_W7),.S1_W0(S1_W0),.S1_W1(S1_W1),.S1_W2(S1_W2),.S1_W3(S1_W3),.S1_W4(S1_W4),.S1_W5(S1_W5),.S1_W6(S1_W6),.S1_W7(S1_W7),.S2_W0(S2_W0),.S2_W1(S2_W1),.S2_W2(S2_W2),.S2_W3(S2_W3),.S2_W4(S2_W4),.S2_W5(S2_W5),.S2_W6(S2_W6),.S2_W7(S2_W7),.S3_W0(S3_W0),.S3_W1(S3_W1),.S3_W2(S3_W2),.S3_W3(S3_W3),.S3_W4(S3_W4),.S3_W5(S3_W5),
.S3_W6(S3_W6),.S3_W7(S3_W7),.S4_W0(S4_W0),.S4_W1(S4_W1),.S4_W2(S4_W2),.S4_W3(S4_W3),.S4_W4(S4_W4),.S4_W5(S4_W5),.S4_W6(S4_W6),.S4_W7(S4_W7),.S5_W0(S5_W0),.S5_W1(S5_W1),.S5_W2(S5_W2),.S5_W3(S5_W3),.S5_W4(S5_W4),.S5_W5(S5_W5),.S5_W6(S5_W6),.S5_W7(S5_W7),.S6_W0(S6_W0),.S6_W1(S6_W1),.S6_W2(S6_W2),.S6_W3(S6_W3),.S6_W4(S6_W4),.S6_W5(S6_W5),.S6_W6(S6_W6),
.S6_W7(S6_W7),.S7_W0(S7_W0),.S7_W1(S7_W1),.S7_W2(S7_W2),.S7_W3(S7_W3),.S7_W4(S7_W4),.S7_W5(S7_W5),.S7_W6(S7_W6),.S7_W7(S7_W7));




bidir_switch N0E0(.port1(N0),.port2(E0),.enable_dir(N0_E0));    bidir_switch N1E0(.port1(N1),.port2(E0),.enable_dir(N1_E0));   bidir_switch AB1(.port1(N2),.port2(E0),.enable_dir(N2_E0));   bidir_switch NE1(.port1(N3),.port2(E0),.enable_dir(N3_E0));
                                                                              
bidir_switch N0E1(.port1(N0),.port2(E1),.enable_dir(N0_E1));    bidir_switch N1E1(.port1(N1),.port2(E1),.enable_dir(N1_E1));   bidir_switch AB2(.port1(N2),.port2(E1),.enable_dir(N2_E1));   bidir_switch NE2(.port1(N3),.port2(E1),.enable_dir(N3_E1));
                                                                              
bidir_switch N0E2(.port1(N0),.port2(E2),.enable_dir(N0_E2));    bidir_switch N1E2(.port1(N1),.port2(E2),.enable_dir(N1_E2));   bidir_switch AB3(.port1(N2),.port2(E2),.enable_dir(N2_E2));   bidir_switch NE3(.port1(N3),.port2(E2),.enable_dir(N3_E2));
                                                                              
bidir_switch N0E3(.port1(N0),.port2(E3),.enable_dir(N0_E3));    bidir_switch N1E3(.port1(N1),.port2(E3),.enable_dir(N1_E3));   bidir_switch AB4(.port1(N2),.port2(E3),.enable_dir(N2_E3));   bidir_switch NE4(.port1(N3),.port2(E3),.enable_dir(N3_E3));
                                                                              
bidir_switch N0E4(.port1(N0),.port2(E4),.enable_dir(N0_E4));    bidir_switch N1E4(.port1(N1),.port2(E4),.enable_dir(N1_E4));   bidir_switch AB5(.port1(N2),.port2(E4),.enable_dir(N2_E4));   bidir_switch NE5(.port1(N3),.port2(E4),.enable_dir(N3_E4));
                                                                              
bidir_switch N0E5(.port1(N0),.port2(E5),.enable_dir(N0_E5));    bidir_switch N1E5(.port1(N1),.port2(E5),.enable_dir(N1_E5));   bidir_switch AB6(.port1(N2),.port2(E5),.enable_dir(N2_E5));   bidir_switch NE6(.port1(N3),.port2(E5),.enable_dir(N3_E5));
                                                                              
bidir_switch N0E6(.port1(N0),.port2(E6),.enable_dir(N0_E6));    bidir_switch N1E6(.port1(N1),.port2(E6),.enable_dir(N1_E6));   bidir_switch AB7(.port1(N2),.port2(E6),.enable_dir(N2_E6));   bidir_switch NE7(.port1(N3),.port2(E6),.enable_dir(N3_E6));
                                                                              
bidir_switch N0E7(.port1(N0),.port2(E7),.enable_dir(N0_E7));    bidir_switch N1E7(.port1(N1),.port2(E7),.enable_dir(N1_E7));   bidir_switch AB8(.port1(N2),.port2(E7),.enable_dir(N2_E7));   bidir_switch NE8(.port1(N3),.port2(E7),.enable_dir(N3_E7));
              
bidir_switch N0S0(.port1(N0),.port2(S0),.enable_dir(N0_S0));   bidir_switch N1S0(.port1(N1),.port2(S0),.enable_dir(N1_S0));  bidir_switch AB9(.port1(N2),.port2(S0),.enable_dir(N2_S0));   bidir_switch NE9(.port1(N3),.port2(S0),.enable_dir(N3_S0));
                                                                             
bidir_switch N0S1(.port1(N0),.port2(S1),.enable_dir(N0_S1));   bidir_switch N1S1(.port1(N1),.port2(S1),.enable_dir(N1_S1));  bidir_switch AB10(.port1(N2),.port2(S1),.enable_dir(N2_S1));  bidir_switch NE10(.port1(N3),.port2(S1),.enable_dir(N3_S1));
                                                                             
bidir_switch N0S2(.port1(N0),.port2(S2),.enable_dir(N0_S2));   bidir_switch N1S2(.port1(N1),.port2(S2),.enable_dir(N1_S2));  bidir_switch AB11(.port1(N2),.port2(S2),.enable_dir(N2_S2));  bidir_switch NE11(.port1(N3),.port2(S2),.enable_dir(N3_S2));
                                                                             
bidir_switch N0S3(.port1(N0),.port2(S3),.enable_dir(N0_S3));   bidir_switch N1S3(.port1(N1),.port2(S3),.enable_dir(N1_S3));  bidir_switch AB12(.port1(N2),.port2(S3),.enable_dir(N2_S3));  bidir_switch NE12(.port1(N3),.port2(S3),.enable_dir(N3_S3));
                                                                             
bidir_switch N0S4(.port1(N0),.port2(S4),.enable_dir(N0_S4));   bidir_switch N1S4(.port1(N1),.port2(S4),.enable_dir(N1_S4));  bidir_switch AB13(.port1(N2),.port2(S4),.enable_dir(N2_S4));  bidir_switch NE13(.port1(N3),.port2(S4),.enable_dir(N3_S4));
                                                                             
bidir_switch N0S5(.port1(N0),.port2(S5),.enable_dir(N0_S5));   bidir_switch N1S5(.port1(N1),.port2(S5),.enable_dir(N1_S5));  bidir_switch AB14(.port1(N2),.port2(S5),.enable_dir(N2_S5));  bidir_switch NE14(.port1(N3),.port2(S5),.enable_dir(N3_S5));
                                                                             
bidir_switch N0S6(.port1(N0),.port2(S6),.enable_dir(N0_S6));   bidir_switch N1S6(.port1(N1),.port2(S6),.enable_dir(N1_S6));  bidir_switch AB15(.port1(N2),.port2(S6),.enable_dir(N2_S6));  bidir_switch NE15(.port1(N3),.port2(S6),.enable_dir(N3_S6));
                                                                             
bidir_switch N0S7(.port1(N0),.port2(S7),.enable_dir(N0_S7));   bidir_switch N1S7(.port1(N1),.port2(S7),.enable_dir(N1_S7));  bidir_switch AB16(.port1(N2),.port2(S7),.enable_dir(N2_S7));  bidir_switch NE16(.port1(N3),.port2(S7),.enable_dir(N3_S7));
              
bidir_switch N0W0(.port1(N0),.port2(W0),.enable_dir(N0_W0));   bidir_switch N1W0(.port1(N1),.port2(W0),.enable_dir(N1_W0));  bidir_switch AB17(.port1(N2),.port2(W0),.enable_dir(N2_W0));  bidir_switch NE17(.port1(N3),.port2(W0),.enable_dir(N3_W0));
              
bidir_switch N0W1(.port1(N0),.port2(W1),.enable_dir(N0_W1));   bidir_switch N1W1(.port1(N1),.port2(W1),.enable_dir(N1_W1));  bidir_switch AB18(.port1(N2),.port2(W1),.enable_dir(N2_W1));  bidir_switch NE18(.port1(N3),.port2(W1),.enable_dir(N3_W1));
                                                                              
bidir_switch N0W2(.port1(N0),.port2(W2),.enable_dir(N0_W2));   bidir_switch N1W2(.port1(N1),.port2(W2),.enable_dir(N1_W2));  bidir_switch AB19(.port1(N2),.port2(W2),.enable_dir(N2_W2));  bidir_switch NE19(.port1(N3),.port2(W2),.enable_dir(N3_W2));
                                                                              
bidir_switch N0W3(.port1(N0),.port2(W3),.enable_dir(N0_W3));   bidir_switch N1W3(.port1(N1),.port2(W3),.enable_dir(N1_W3));  bidir_switch AB20(.port1(N2),.port2(W3),.enable_dir(N2_W3));  bidir_switch NE20(.port1(N3),.port2(W3),.enable_dir(N3_W3));
                                                                              
bidir_switch N0W4(.port1(N0),.port2(W4),.enable_dir(N0_W4));   bidir_switch N1W4(.port1(N1),.port2(W4),.enable_dir(N1_W4));  bidir_switch AB21(.port1(N2),.port2(W4),.enable_dir(N2_W4));  bidir_switch NE21(.port1(N3),.port2(W4),.enable_dir(N3_W4));
                                                                              
bidir_switch N0W5(.port1(N0),.port2(W5),.enable_dir(N0_W5));   bidir_switch N1W5(.port1(N1),.port2(W5),.enable_dir(N1_W5));  bidir_switch AB22(.port1(N2),.port2(W5),.enable_dir(N2_W5));  bidir_switch NE22(.port1(N3),.port2(W5),.enable_dir(N3_W5));
                                                                              
bidir_switch N0W6(.port1(N0),.port2(W6),.enable_dir(N0_W6));   bidir_switch N1W6(.port1(N1),.port2(W6),.enable_dir(N1_W6));  bidir_switch AB23(.port1(N2),.port2(W6),.enable_dir(N2_W6));  bidir_switch NE23(.port1(N3),.port2(W6),.enable_dir(N3_W6));
                                                                              
bidir_switch N0W7(.port1(N0),.port2(W7),.enable_dir(N0_W7));   bidir_switch N1W7(.port1(N1),.port2(W7),.enable_dir(N1_W7));  bidir_switch AB24(.port1(N2),.port2(W7),.enable_dir(N2_W7));  bidir_switch NE24(.port1(N3),.port2(W7),.enable_dir(N3_W7));






bidir_switch SE1(.port1(N4),.port2(E0),.enable_dir(N4_E0));	   bidir_switch SG1(.port1(N5),.port2(E0),.enable_dir(N5_E0));   bidir_switch SH1(.port1(N6),.port2(E0),.enable_dir(N6_E0));	bidir_switch SI1(.port1(N7),.port2(E0),.enable_dir(N7_E0));
                                                                                                                                                                                                                             
bidir_switch SE2(.port1(N4),.port2(E1),.enable_dir(N4_E1));    bidir_switch SG2(.port1(N5),.port2(E1),.enable_dir(N5_E1));   bidir_switch SH2(.port1(N6),.port2(E1),.enable_dir(N6_E1));    bidir_switch SI2(.port1(N7),.port2(E1),.enable_dir(N7_E1));
                                                                                                                                                                                                                             
bidir_switch SE3(.port1(N4),.port2(E2),.enable_dir(N4_E2));    bidir_switch SG3(.port1(N5),.port2(E2),.enable_dir(N5_E2));   bidir_switch SH3(.port1(N6),.port2(E2),.enable_dir(N6_E2));    bidir_switch SI3(.port1(N7),.port2(E2),.enable_dir(N7_E2));
                                                                                                                                                                                                                            
bidir_switch SE4(.port1(N4),.port2(E3),.enable_dir(N4_E3));    bidir_switch SG4(.port1(N5),.port2(E3),.enable_dir(N5_E3));   bidir_switch SH4(.port1(N6),.port2(E3),.enable_dir(N6_E3));    bidir_switch SI4(.port1(N7),.port2(E3),.enable_dir(N7_E3));
                                                                                                                                                                                                                            
bidir_switch SE5(.port1(N4),.port2(E4),.enable_dir(N4_E4));    bidir_switch SG5(.port1(N5),.port2(E4),.enable_dir(N5_E4));   bidir_switch SH5(.port1(N6),.port2(E4),.enable_dir(N6_E4));    bidir_switch SI5(.port1(N7),.port2(E4),.enable_dir(N7_E4));
                                                                                                                                                                                                                             
bidir_switch SE6(.port1(N4),.port2(E5),.enable_dir(N4_E5));    bidir_switch SG6(.port1(N5),.port2(E5),.enable_dir(N5_E5));   bidir_switch SH6(.port1(N6),.port2(E5),.enable_dir(N6_E5));    bidir_switch SI6(.port1(N7),.port2(E5),.enable_dir(N7_E5));
                                                                                                                                                                                                                             
bidir_switch SE7(.port1(N4),.port2(E6),.enable_dir(N4_E6));    bidir_switch SG7(.port1(N5),.port2(E6),.enable_dir(N5_E6));   bidir_switch SH7(.port1(N6),.port2(E6),.enable_dir(N6_E6));    bidir_switch SI7(.port1(N7),.port2(E6),.enable_dir(N7_E6));
                                                                                                                                                                                                                            
bidir_switch SE8(.port1(N4),.port2(E7),.enable_dir(N4_E7));    bidir_switch SG8(.port1(N5),.port2(E7),.enable_dir(N5_E7));   bidir_switch SH8(.port1(N6),.port2(E7),.enable_dir(N6_E7));    bidir_switch SI8(.port1(N7),.port2(E7),.enable_dir(N7_E7));

bidir_switch SE9(.port1(N4),.port2(S0),.enable_dir(N4_S0));     bidir_switch SG9(.port1(N5),.port2(S0),.enable_dir(N5_S0));   bidir_switch SH9(.port1(N6),.port2(S0),.enable_dir(N6_S0));     bidir_switch SI9(.port1(N7),.port2(S0),.enable_dir(N7_S0));
                                                                                                                                                                                                                      
bidir_switch SE10(.port1(N4),.port2(S1),.enable_dir(N4_S1));   bidir_switch SG10(.port1(N5),.port2(S1),.enable_dir(N5_S1));  bidir_switch SH10(.port1(N6),.port2(S1),.enable_dir(N6_S1));   bidir_switch SI10(.port1(N7),.port2(S1),.enable_dir(N7_S1));
                                                                                                                                                                                                                        
bidir_switch SE11(.port1(N4),.port2(S2),.enable_dir(N4_S2));   bidir_switch SG11(.port1(N5),.port2(S2),.enable_dir(N5_S2));  bidir_switch SH11(.port1(N6),.port2(S2),.enable_dir(N6_S2));   bidir_switch SI11(.port1(N7),.port2(S2),.enable_dir(N7_S2));
                                                                                                                                                                                                                     
bidir_switch SE12(.port1(N4),.port2(S3),.enable_dir(N4_S3));   bidir_switch SG12(.port1(N5),.port2(S3),.enable_dir(N5_S3));  bidir_switch SH12(.port1(N6),.port2(S3),.enable_dir(N6_S3));   bidir_switch SI12(.port1(N7),.port2(S3),.enable_dir(N7_S3));
                                                                                                                                                                                                                        
bidir_switch SE13(.port1(N4),.port2(S4),.enable_dir(N4_S4));   bidir_switch SG13(.port1(N5),.port2(S4),.enable_dir(N5_S4));  bidir_switch SH13(.port1(N6),.port2(S4),.enable_dir(N6_S4));   bidir_switch SI13(.port1(N7),.port2(S4),.enable_dir(N7_S4));
                                                                                                                                                                                                                       
bidir_switch SE14(.port1(N4),.port2(S5),.enable_dir(N4_S5));   bidir_switch SG14(.port1(N5),.port2(S5),.enable_dir(N5_S5));  bidir_switch SH14(.port1(N6),.port2(S5),.enable_dir(N6_S5));   bidir_switch SI14(.port1(N7),.port2(S5),.enable_dir(N7_S5));
                                                                                                                                                                                                                        
bidir_switch SE15(.port1(N4),.port2(S6),.enable_dir(N4_S6));   bidir_switch SG15(.port1(N5),.port2(S6),.enable_dir(N5_S6));  bidir_switch SH15(.port1(N6),.port2(S6),.enable_dir(N6_S6));   bidir_switch SI15(.port1(N7),.port2(S6),.enable_dir(N7_S6));
                                                                                                                                                                                                                      
bidir_switch SE16(.port1(N4),.port2(S7),.enable_dir(N4_S7));   bidir_switch SG16(.port1(N5),.port2(S7),.enable_dir(N5_S7));  bidir_switch SH16(.port1(N6),.port2(S7),.enable_dir(N6_S7));   bidir_switch SI16(.port1(N7),.port2(S7),.enable_dir(N7_S7));
                                                                                                                                                                                                                    
bidir_switch SE17(.port1(N4),.port2(W0),.enable_dir(N4_W0));   bidir_switch SG17(.port1(N5),.port2(W0),.enable_dir(N5_W0));  bidir_switch SH17(.port1(N6),.port2(W0),.enable_dir(N6_W0));   bidir_switch SI17(.port1(N7),.port2(W0),.enable_dir(N7_W0));
                                                                                                                                                                                                                   
bidir_switch SE18(.port1(N4),.port2(W1),.enable_dir(N4_W1));   bidir_switch SG18(.port1(N5),.port2(W1),.enable_dir(N5_W1));  bidir_switch SH18(.port1(N6),.port2(W1),.enable_dir(N6_W1));   bidir_switch SI18(.port1(N7),.port2(W1),.enable_dir(N7_W1));
                                                                                                                                                                                                                      
bidir_switch SE19(.port1(N4),.port2(W2),.enable_dir(N4_W2));   bidir_switch SG19(.port1(N5),.port2(W2),.enable_dir(N5_W2));  bidir_switch SH19(.port1(N6),.port2(W2),.enable_dir(N6_W2));   bidir_switch SI19(.port1(N7),.port2(W2),.enable_dir(N7_W2));
                                                                                                                                                                                                                        
bidir_switch SE20(.port1(N4),.port2(W3),.enable_dir(N4_W3));   bidir_switch SG20(.port1(N5),.port2(W3),.enable_dir(N5_W3));  bidir_switch SH20(.port1(N6),.port2(W3),.enable_dir(N6_W3));   bidir_switch SI20(.port1(N7),.port2(W3),.enable_dir(N7_W3));
                                                                                                                                                                                                                       
bidir_switch SE21(.port1(N4),.port2(W4),.enable_dir(N4_W4));   bidir_switch SG21(.port1(N5),.port2(W4),.enable_dir(N5_W4));  bidir_switch SH21(.port1(N6),.port2(W4),.enable_dir(N6_W4));   bidir_switch SI21(.port1(N7),.port2(W4),.enable_dir(N7_W4));
                                                                                                                                                                                                                      
bidir_switch SE22(.port1(N4),.port2(W5),.enable_dir(N4_W5));   bidir_switch SG22(.port1(N5),.port2(W5),.enable_dir(N5_W5));  bidir_switch SH22(.port1(N6),.port2(W5),.enable_dir(N6_W5));   bidir_switch SI22(.port1(N7),.port2(W5),.enable_dir(N7_W5));
                                                                                                                                                                                                                       
bidir_switch SE23(.port1(N4),.port2(W6),.enable_dir(N4_W6));   bidir_switch SG23(.port1(N5),.port2(W6),.enable_dir(N5_W6));  bidir_switch SH23(.port1(N6),.port2(W6),.enable_dir(N6_W6));   bidir_switch SI23(.port1(N7),.port2(W6),.enable_dir(N7_W6));
                                                                                                                                                                                                                        
bidir_switch SE24(.port1(N4),.port2(W7),.enable_dir(N4_W7));   bidir_switch SG24(.port1(N5),.port2(W7),.enable_dir(N5_W7));  bidir_switch SH24(.port1(N6),.port2(W7),.enable_dir(N6_W7));   bidir_switch SI24(.port1(N7),.port2(W7),.enable_dir(N7_W7));

             

             

bidir_switch SJ1(.port1(E0),.port2(W0),.enable_dir(E0_W0));	  bidir_switch SK1(.port1(E1),.port2(W0),.enable_dir(E1_W0));   bidir_switch SL1(.port1(E2),.port2(W0),.enable_dir(E2_W0));   bidir_switch SM1(.port1(E3),.port2(W0),.enable_dir(E3_W0));

bidir_switch SJ2(.port1(E0),.port2(W1),.enable_dir(E0_W1));   bidir_switch SK2(.port1(E1),.port2(W1),.enable_dir(E1_W1));   bidir_switch SL2(.port1(E2),.port2(W1),.enable_dir(E2_W1));   bidir_switch SM2(.port1(E3),.port2(W1),.enable_dir(E3_W1));

bidir_switch SJ3(.port1(E0),.port2(W2),.enable_dir(E0_W2));   bidir_switch SK3(.port1(E1),.port2(W2),.enable_dir(E1_W2));   bidir_switch SL3(.port1(E2),.port2(W2),.enable_dir(E2_W2));   bidir_switch SM3(.port1(E3),.port2(W2),.enable_dir(E3_W2));

bidir_switch SJ4(.port1(E0),.port2(W3),.enable_dir(E0_W3));   bidir_switch SK4(.port1(E1),.port2(W3),.enable_dir(E1_W3));   bidir_switch SL4(.port1(E2),.port2(W3),.enable_dir(E2_W3));   bidir_switch SM4(.port1(E3),.port2(W3),.enable_dir(E3_W3));

bidir_switch SJ5(.port1(E0),.port2(W4),.enable_dir(E0_W4));   bidir_switch SK5(.port1(E1),.port2(W4),.enable_dir(E1_W4));   bidir_switch SL5(.port1(E2),.port2(W4),.enable_dir(E2_W4));   bidir_switch SM5(.port1(E3),.port2(W4),.enable_dir(E3_W4));

bidir_switch SJ6(.port1(E0),.port2(W5),.enable_dir(E0_W5));   bidir_switch SK6(.port1(E1),.port2(W5),.enable_dir(E1_W5));   bidir_switch SL6(.port1(E2),.port2(W5),.enable_dir(E2_W5));   bidir_switch SM6(.port1(E3),.port2(W5),.enable_dir(E3_W5));

bidir_switch SJ7(.port1(E0),.port2(W6),.enable_dir(E0_W6));   bidir_switch SK7(.port1(E1),.port2(W6),.enable_dir(E1_W6));   bidir_switch SL7(.port1(E2),.port2(W6),.enable_dir(E2_W6));   bidir_switch SM7(.port1(E3),.port2(W6),.enable_dir(E3_W6));

bidir_switch SJ8(.port1(E0),.port2(W7),.enable_dir(E0_W7));   bidir_switch SK8(.port1(E1),.port2(W7),.enable_dir(E1_W7));   bidir_switch SL8(.port1(E2),.port2(W7),.enable_dir(E2_W7));   bidir_switch SM8(.port1(E3),.port2(W7),.enable_dir(E3_W7));

bidir_switch SJ9(.port1(E0),.port2(S0),.enable_dir(E0_S0));   bidir_switch SK9(.port1(E1),.port2(S0),.enable_dir(E1_S0));   bidir_switch SL9(.port1(E2),.port2(S0),.enable_dir(E2_S0));   bidir_switch SM9(.port1(E3),.port2(S0),.enable_dir(E3_S0));

bidir_switch SJ10(.port1(E0),.port2(S1),.enable_dir(E0_S1));  bidir_switch SK10(.port1(E1),.port2(S1),.enable_dir(E1_S1));  bidir_switch SL10(.port1(E2),.port2(S1),.enable_dir(E2_S1));  bidir_switch SM10(.port1(E3),.port2(S1),.enable_dir(E3_S1));

bidir_switch SJ11(.port1(E0),.port2(S2),.enable_dir(E0_S2));  bidir_switch SK11(.port1(E1),.port2(S2),.enable_dir(E1_S2));  bidir_switch SL11(.port1(E2),.port2(S2),.enable_dir(E2_S2));  bidir_switch SM11(.port1(E3),.port2(S2),.enable_dir(E3_S2));

bidir_switch SJ12(.port1(E0),.port2(S3),.enable_dir(E0_S3));  bidir_switch SK12(.port1(E1),.port2(S3),.enable_dir(E1_S3));  bidir_switch SL12(.port1(E2),.port2(S3),.enable_dir(E2_S3));  bidir_switch SM12(.port1(E3),.port2(S3),.enable_dir(E3_S3));

bidir_switch SJ13(.port1(E0),.port2(S4),.enable_dir(E0_S4));  bidir_switch SK13(.port1(E1),.port2(S4),.enable_dir(E1_S4));  bidir_switch SL13(.port1(E2),.port2(S4),.enable_dir(E2_S4));  bidir_switch SM13(.port1(E3),.port2(S4),.enable_dir(E3_S4));

bidir_switch SJ14(.port1(E0),.port2(S5),.enable_dir(E0_S5));  bidir_switch SK14(.port1(E1),.port2(S5),.enable_dir(E1_S5));  bidir_switch SL14(.port1(E2),.port2(S5),.enable_dir(E2_S5));  bidir_switch SM14(.port1(E3),.port2(S5),.enable_dir(E3_S5));

bidir_switch SJ15(.port1(E0),.port2(S6),.enable_dir(E0_S6));  bidir_switch SK15(.port1(E1),.port2(S6),.enable_dir(E1_S6));  bidir_switch SL15(.port1(E2),.port2(S6),.enable_dir(E2_S6));  bidir_switch SM15(.port1(E3),.port2(S6),.enable_dir(E3_S6));

bidir_switch SJ16(.port1(E0),.port2(S7),.enable_dir(E0_S7));  bidir_switch SK16(.port1(E1),.port2(S7),.enable_dir(E1_S7));  bidir_switch SL16(.port1(E2),.port2(S7),.enable_dir(E2_S7));  bidir_switch SM16(.port1(E3),.port2(S7),.enable_dir(E3_S7));

                                                                                                   

                                                                                                    

                                                                                                    

bidir_switch SN1(.port1(E4),.port2(W0),.enable_dir(E4_W0));	   bidir_switch SO1(.port1(E5),.port2(W0),.enable_dir(E5_W0));   bidir_switch SP1(.port1(E6),.port2(W0),.enable_dir(E6_W0));   bidir_switch SQ1(.port1(E7),.port2(W0),.enable_dir(E7_W0));

bidir_switch SN2(.port1(E4),.port2(W1),.enable_dir(E4_W1));    bidir_switch SO2(.port1(E5),.port2(W1),.enable_dir(E5_W1));   bidir_switch SP2(.port1(E6),.port2(W1),.enable_dir(E6_W1));   bidir_switch SQ2(.port1(E7),.port2(W1),.enable_dir(E7_W1));

bidir_switch SN3(.port1(E4),.port2(W2),.enable_dir(E4_W2));    bidir_switch SO3(.port1(E5),.port2(W2),.enable_dir(E5_W2));   bidir_switch SP3(.port1(E6),.port2(W2),.enable_dir(E6_W2));   bidir_switch SQ3(.port1(E7),.port2(W2),.enable_dir(E7_W2));

bidir_switch SN4(.port1(E4),.port2(W3),.enable_dir(E4_W3));    bidir_switch SO4(.port1(E5),.port2(W3),.enable_dir(E5_W3));   bidir_switch SP4(.port1(E6),.port2(W3),.enable_dir(E6_W3));   bidir_switch SQ4(.port1(E7),.port2(W3),.enable_dir(E7_W3));

bidir_switch SN5(.port1(E4),.port2(W4),.enable_dir(E4_W4));    bidir_switch SO5(.port1(E5),.port2(W4),.enable_dir(E5_W4));   bidir_switch SP5(.port1(E6),.port2(W4),.enable_dir(E6_W4));   bidir_switch SQ5(.port1(E7),.port2(W4),.enable_dir(E7_W4));

bidir_switch SN6(.port1(E4),.port2(W5),.enable_dir(E4_W5));    bidir_switch SO6(.port1(E5),.port2(W5),.enable_dir(E5_W5));   bidir_switch SP6(.port1(E6),.port2(W5),.enable_dir(E6_W5));   bidir_switch SQ6(.port1(E7),.port2(W5),.enable_dir(E7_W5));

bidir_switch SN7(.port1(E4),.port2(W6),.enable_dir(E4_W6));    bidir_switch SO7(.port1(E5),.port2(W6),.enable_dir(E5_W6));   bidir_switch SP7(.port1(E6),.port2(W6),.enable_dir(E6_W6));   bidir_switch SQ7(.port1(E7),.port2(W6),.enable_dir(E7_W6));

bidir_switch SN8(.port1(E4),.port2(W7),.enable_dir(E4_W7));    bidir_switch SO8(.port1(E5),.port2(W7),.enable_dir(E5_W7));   bidir_switch SP8(.port1(E6),.port2(W7),.enable_dir(E6_W7));   bidir_switch SQ8(.port1(E7),.port2(W7),.enable_dir(E7_W7));

bidir_switch SN9(.port1(E4),.port2(S0),.enable_dir(E4_S0));    bidir_switch SO9(.port1(E5),.port2(S0),.enable_dir(E5_S0));   bidir_switch SP9(.port1(E6),.port2(S0),.enable_dir(E6_S0));   bidir_switch SQ9(.port1(E7),.port2(S0),.enable_dir(E7_S0));

bidir_switch SN10(.port1(E4),.port2(S1),.enable_dir(E4_S1));   bidir_switch S10(.port1(E5),.port2(S1),.enable_dir(E5_S1));   bidir_switch SP10(.port1(E6),.port2(S1),.enable_dir(E6_S1));  bidir_switch SQ10(.port1(E7),.port2(S1),.enable_dir(E7_S1));

bidir_switch SN11(.port1(E4),.port2(S2),.enable_dir(E4_S2));   bidir_switch S11(.port1(E5),.port2(S2),.enable_dir(E5_S2));   bidir_switch SP11(.port1(E6),.port2(S2),.enable_dir(E6_S2));  bidir_switch SQ11(.port1(E7),.port2(S2),.enable_dir(E7_S2));

bidir_switch SN12(.port1(E4),.port2(S3),.enable_dir(E4_S3));   bidir_switch S12(.port1(E5),.port2(S3),.enable_dir(E5_S3));   bidir_switch SP12(.port1(E6),.port2(S3),.enable_dir(E6_S3));  bidir_switch SQ12(.port1(E7),.port2(S3),.enable_dir(E7_S3));

bidir_switch SN13(.port1(E4),.port2(S4),.enable_dir(E4_S4));   bidir_switch S13(.port1(E5),.port2(S4),.enable_dir(E5_S4));   bidir_switch SP13(.port1(E6),.port2(S4),.enable_dir(E6_S4));  bidir_switch SQ13(.port1(E7),.port2(S4),.enable_dir(E7_S4));

bidir_switch SN14(.port1(E4),.port2(S5),.enable_dir(E4_S5));   bidir_switch S14(.port1(E5),.port2(S5),.enable_dir(E5_S5));   bidir_switch SP14(.port1(E6),.port2(S5),.enable_dir(E6_S5));  bidir_switch SQ14(.port1(E7),.port2(S5),.enable_dir(E7_S5));

bidir_switch SN15(.port1(E4),.port2(S6),.enable_dir(E4_S6));   bidir_switch S15(.port1(E5),.port2(S6),.enable_dir(E5_S6));   bidir_switch SP15(.port1(E6),.port2(S6),.enable_dir(E6_S6));  bidir_switch SQ15(.port1(E7),.port2(S6),.enable_dir(E7_S6));

bidir_switch SN16(.port1(E4),.port2(S7),.enable_dir(E4_S7));   bidir_switch S16(.port1(E5),.port2(S7),.enable_dir(E5_S7));   bidir_switch SP16(.port1(E6),.port2(S7),.enable_dir(E6_S7));  bidir_switch SQ16(.port1(E7),.port2(S7),.enable_dir(E7_S7));

                                                                                                   

bidir_switch SR1(.port1(S0),.port2(W0),.enable_dir(S0_W0));	  bidir_switch SS1(.port1(S1),.port2(W0),.enable_dir(S1_W0));   bidir_switch ST1(.port1(S2),.port2(W0),.enable_dir(S2_W0));   bidir_switch SU1(.port1(S3),.port2(W0),.enable_dir(S3_W0));

bidir_switch SR2(.port1(S0),.port2(W1),.enable_dir(S0_W1));   bidir_switch SS2(.port1(S1),.port2(W1),.enable_dir(S1_W1));   bidir_switch ST2(.port1(S2),.port2(W1),.enable_dir(S2_W1));   bidir_switch SU2(.port1(S3),.port2(W1),.enable_dir(S3_W1));

bidir_switch SR3(.port1(S0),.port2(W2),.enable_dir(S0_W2));   bidir_switch SS3(.port1(S1),.port2(W2),.enable_dir(S1_W2));   bidir_switch ST3(.port1(S2),.port2(W2),.enable_dir(S2_W2));   bidir_switch SU3(.port1(S3),.port2(W2),.enable_dir(S3_W2));

bidir_switch SR4(.port1(S0),.port2(W3),.enable_dir(S0_W3));   bidir_switch SS4(.port1(S1),.port2(W3),.enable_dir(S1_W3));   bidir_switch ST4(.port1(S2),.port2(W3),.enable_dir(S2_W3));   bidir_switch SU4(.port1(S3),.port2(W3),.enable_dir(S3_W3));

bidir_switch SR5(.port1(S0),.port2(W4),.enable_dir(S0_W4));   bidir_switch SS5(.port1(S1),.port2(W4),.enable_dir(S1_W4));   bidir_switch ST5(.port1(S2),.port2(W4),.enable_dir(S2_W4));   bidir_switch SU5(.port1(S3),.port2(W4),.enable_dir(S3_W4));

bidir_switch SR6(.port1(S0),.port2(W5),.enable_dir(S0_W5));   bidir_switch SS6(.port1(S1),.port2(W5),.enable_dir(S1_W5));   bidir_switch ST6(.port1(S2),.port2(W5),.enable_dir(S2_W5));   bidir_switch SU6(.port1(S3),.port2(W5),.enable_dir(S3_W5));

bidir_switch SR7(.port1(S0),.port2(W6),.enable_dir(S0_W6));   bidir_switch SS7(.port1(S1),.port2(W6),.enable_dir(S1_W6));   bidir_switch ST7(.port1(S2),.port2(W6),.enable_dir(S2_W6));   bidir_switch SU7(.port1(S3),.port2(W6),.enable_dir(S3_W6));

bidir_switch SR8(.port1(S0),.port2(W7),.enable_dir(S0_W7));   bidir_switch SS8(.port1(S1),.port2(W7),.enable_dir(S1_W7));   bidir_switch ST8(.port1(S2),.port2(W7),.enable_dir(S2_W7));   bidir_switch SU8(.port1(S3),.port2(W7),.enable_dir(S3_W7));

                                                                                                    

bidir_switch SV1(.port1(S4),.port2(W0),.enable_dir(S4_W0));	  bidir_switch SW1(.port1(S5),.port2(W0),.enable_dir(S5_W0));   bidir_switch SX1(.port1(S6),.port2(W0),.enable_dir(S6_W0));   bidir_switch SY1(.port1(S7),.port2(W0),.enable_dir(S7_W0));

bidir_switch SV2(.port1(S4),.port2(W1),.enable_dir(S4_W1));   bidir_switch SW2(.port1(S5),.port2(W1),.enable_dir(S5_W1));   bidir_switch SX2(.port1(S6),.port2(W1),.enable_dir(S6_W1));   bidir_switch SY2(.port1(S7),.port2(W1),.enable_dir(S7_W1));

bidir_switch SV3(.port1(S4),.port2(W2),.enable_dir(S4_W2));   bidir_switch SW3(.port1(S5),.port2(W2),.enable_dir(S5_W2));   bidir_switch SX3(.port1(S6),.port2(W2),.enable_dir(S6_W2));   bidir_switch SY3(.port1(S7),.port2(W2),.enable_dir(S7_W2));

bidir_switch SV4(.port1(S4),.port2(W3),.enable_dir(S4_W3));   bidir_switch SW4(.port1(S5),.port2(W3),.enable_dir(S5_W3));   bidir_switch SX4(.port1(S6),.port2(W3),.enable_dir(S6_W3));   bidir_switch SY4(.port1(S7),.port2(W3),.enable_dir(S7_W3));

bidir_switch SV5(.port1(S4),.port2(W4),.enable_dir(S4_W4));   bidir_switch SW5(.port1(S5),.port2(W4),.enable_dir(S5_W4));   bidir_switch SX5(.port1(S6),.port2(W4),.enable_dir(S6_W4));   bidir_switch SY5(.port1(S7),.port2(W4),.enable_dir(S7_W4));

bidir_switch SV6(.port1(S4),.port2(W5),.enable_dir(S4_W5));   bidir_switch SW6(.port1(S5),.port2(W5),.enable_dir(S5_W5));   bidir_switch SX6(.port1(S6),.port2(W5),.enable_dir(S6_W5));   bidir_switch SY6(.port1(S7),.port2(W5),.enable_dir(S7_W5));

bidir_switch SV7(.port1(S4),.port2(W6),.enable_dir(S4_W6));   bidir_switch SW7(.port1(S5),.port2(W6),.enable_dir(S5_W6));   bidir_switch SX7(.port1(S6),.port2(W6),.enable_dir(S6_W6));   bidir_switch SY7(.port1(S7),.port2(W6),.enable_dir(S7_W6));

bidir_switch SV8(.port1(S4),.port2(W7),.enable_dir(S4_W7));   bidir_switch SW8(.port1(S5),.port2(W7),.enable_dir(S5_W7));   bidir_switch SX8(.port1(S6),.port2(W7),.enable_dir(S6_W7));   bidir_switch SY8(.port1(S7),.port2(W7),.enable_dir(S7_W7));  


endmodule
