
	
module switch_block_config(bit_in,bit_out,prgm_b,clk,reset,sb_prgm_b,A0_B0,A0_B1,A0_B2,A0_B3,A0_B4,A0_B5,A0_B6,A0_B7,A0_C0,A0_C1,A0_C2,A0_C3,A0_C4,A0_C5,A0_C6,A0_C7,A0_D0,A0_D1,A0_D2,A0_D3,A0_D4,A0_D5,A0_D6,A0_D7,A1_B0,
A1_B1,A1_B2,A1_B3,A1_B4,A1_B5,A1_B6,A1_B7,A1_C0,A1_C1,A1_C2,A1_C3,A1_C4,A1_C5,A1_C6,A1_C7,A1_D0,A1_D1,A1_D2,A1_D3,A1_D4,A1_D5,A1_D6,A1_D7,A2_B0,A2_B1,
A2_B2,A2_B3,A2_B4,A2_B5,A2_B6,A2_B7,A2_C0,A2_C1,A2_C2,A2_C3,A2_C4,A2_C5,A2_C6,A2_C7,A2_D0,A2_D1,A2_D2,A2_D3,A2_D4,A2_D5,A2_D6,A2_D7,A3_B0,A3_B1,A3_B2,
A3_B3,A3_B4,A3_B5,A3_B6,A3_B7,A3_C0,A3_C1,A3_C2,A3_C3,A3_C4,A3_C5,A3_C6,A3_C7,A3_D0,A3_D1,A3_D2,A3_D3,A3_D4,A3_D5,A3_D6,A3_D7,A4_B0,A4_B1,A4_B2,A4_B3,
A4_B4,A4_B5,A4_B6,A4_B7,A4_C0,A4_C1,A4_C2,A4_C3,A4_C4,A4_C5,A4_C6,A4_C7,A4_D0,A4_D1,A4_D2,A4_D3,A4_D4,A4_D5,A4_D6,A4_D7,A5_B0,A5_B1,A5_B2,A5_B3,A5_B4,
A5_B5,A5_B6,A5_B7,A5_C0,A5_C1,A5_C2,A5_C3,A5_C4,A5_C5,A5_C6,A5_C7,A5_D0,A5_D1,A5_D2,A5_D3,A5_D4,A5_D5,A5_D6,A5_D7,A6_B0,A6_B1,A6_B2,A6_B3,A6_B4,A6_B5,
A6_B6,A6_B7,A6_C0,A6_C1,A6_C2,A6_C3,A6_C4,A6_C5,A6_C6,A6_C7,A6_D0,A6_D1,A6_D2,A6_D3,A6_D4,A6_D5,A6_D6,A6_D7,A7_B0,A7_B1,A7_B2,A7_B3,A7_B4,A7_B5,A7_B6,
A7_B7,A7_C0,A7_C1,A7_C2,A7_C3,A7_C4,A7_C5,A7_C6,A7_C7,A7_D0,A7_D1,A7_D2,A7_D3,A7_D4,A7_D5,A7_D6,A7_D7,B0_D0,B0_D1,B0_D2,B0_D3,B0_D4,B0_D5,B0_D6,B0_D7,
B0_C0,B0_C1,B0_C2,B0_C3,B0_C4,B0_C5,B0_C6,B0_C7,B1_D0,B1_D1,B1_D2,B1_D3,B1_D4,B1_D5,B1_D6,B1_D7,B1_C0,B1_C1,B1_C2,B1_C3,B1_C4,B1_C5,B1_C6,B1_C7,B2_D0,
B2_D1,B2_D2,B2_D3,B2_D4,B2_D5,B2_D6,B2_D7,B2_C0,B2_C1,B2_C2,B2_C3,B2_C4,B2_C5,B2_C6,B2_C7,B3_D0,B3_D1,B3_D2,B3_D3,B3_D4,B3_D5,B3_D6,B3_D7,B3_C0,B3_C1,
B3_C2,B3_C3,B3_C4,B3_C5,B3_C6,B3_C7,B4_D0,B4_D1,B4_D2,B4_D3,B4_D4,B4_D5,B4_D6,B4_D7,B4_C0,B4_C1,B4_C2,B4_C3,B4_C4,B4_C5,B4_C6,B4_C7,B5_D0,B5_D1,B5_D2,
B5_D3,B5_D4,B5_D5,B5_D6,B5_D7,B5_C0,B5_C1,B5_C2,B5_C3,B5_C4,B5_C5,B5_C6,B5_C7,B6_D0,B6_D1,B6_D2,B6_D3,B6_D4,B6_D5,B6_D6,B6_D7,B6_C0,B6_C1,B6_C2,B6_C3,
B6_C4,B6_C5,B6_C6,B6_C7,B7_D0,B7_D1,B7_D2,B7_D3,B7_D4,B7_D5,B7_D6,B7_D7,B7_C0,B7_C1,B7_C2,B7_C3,B7_C4,B7_C5,B7_C6,B7_C7,C0_D0,C0_D1,C0_D2,C0_D3,C0_D4,
C0_D5,C0_D6,C0_D7,C1_D0,C1_D1,C1_D2,C1_D3,C1_D4,C1_D5,C1_D6,C1_D7,C2_D0,C2_D1,C2_D2,C2_D3,C2_D4,C2_D5,C2_D6,C2_D7,C3_D0,C3_D1,C3_D2,C3_D3,C3_D4,C3_D5,
C3_D6,C3_D7,C4_D0,C4_D1,C4_D2,C4_D3,C4_D4,C4_D5,C4_D6,C4_D7,C5_D0,C5_D1,C5_D2,C5_D3,C5_D4,C5_D5,C5_D6,C5_D7,C6_D0,C6_D1,C6_D2,C6_D3,C6_D4,C6_D5,C6_D6,
C6_D7,C7_D0,C7_D1,C7_D2,C7_D3,C7_D4,C7_D5,C7_D6,C7_D7);
input bit_in,prgm_b,sb_prgm_b,clk,reset;


output reg A0_B0,A0_B1,A0_B2,A0_B3,A0_B4,A0_B5,A0_B6,A0_B7,A0_C0,A0_C1,A0_C2,A0_C3,A0_C4,A0_C5,A0_C6,A0_C7,A0_D0,A0_D1,A0_D2,A0_D3,A0_D4,A0_D5,A0_D6,A0_D7,A1_B0,
A1_B1,A1_B2,A1_B3,A1_B4,A1_B5,A1_B6,A1_B7,A1_C0,A1_C1,A1_C2,A1_C3,A1_C4,A1_C5,A1_C6,A1_C7,A1_D0,A1_D1,A1_D2,A1_D3,A1_D4,A1_D5,A1_D6,A1_D7,A2_B0,A2_B1,
A2_B2,A2_B3,A2_B4,A2_B5,A2_B6,A2_B7,A2_C0,A2_C1,A2_C2,A2_C3,A2_C4,A2_C5,A2_C6,A2_C7,A2_D0,A2_D1,A2_D2,A2_D3,A2_D4,A2_D5,A2_D6,A2_D7,A3_B0,A3_B1,A3_B2,
A3_B3,A3_B4,A3_B5,A3_B6,A3_B7,A3_C0,A3_C1,A3_C2,A3_C3,A3_C4,A3_C5,A3_C6,A3_C7,A3_D0,A3_D1,A3_D2,A3_D3,A3_D4,A3_D5,A3_D6,A3_D7,A4_B0,A4_B1,A4_B2,A4_B3,
A4_B4,A4_B5,A4_B6,A4_B7,A4_C0,A4_C1,A4_C2,A4_C3,A4_C4,A4_C5,A4_C6,A4_C7,A4_D0,A4_D1,A4_D2,A4_D3,A4_D4,A4_D5,A4_D6,A4_D7,A5_B0,A5_B1,A5_B2,A5_B3,A5_B4,
A5_B5,A5_B6,A5_B7,A5_C0,A5_C1,A5_C2,A5_C3,A5_C4,A5_C5,A5_C6,A5_C7,A5_D0,A5_D1,A5_D2,A5_D3,A5_D4,A5_D5,A5_D6,A5_D7,A6_B0,A6_B1,A6_B2,A6_B3,A6_B4,A6_B5,
A6_B6,A6_B7,A6_C0,A6_C1,A6_C2,A6_C3,A6_C4,A6_C5,A6_C6,A6_C7,A6_D0,A6_D1,A6_D2,A6_D3,A6_D4,A6_D5,A6_D6,A6_D7,A7_B0,A7_B1,A7_B2,A7_B3,A7_B4,A7_B5,A7_B6,
A7_B7,A7_C0,A7_C1,A7_C2,A7_C3,A7_C4,A7_C5,A7_C6,A7_C7,A7_D0,A7_D1,A7_D2,A7_D3,A7_D4,A7_D5,A7_D6,A7_D7,B0_D0,B0_D1,B0_D2,B0_D3,B0_D4,B0_D5,B0_D6,B0_D7,
B0_C0,B0_C1,B0_C2,B0_C3,B0_C4,B0_C5,B0_C6,B0_C7,B1_D0,B1_D1,B1_D2,B1_D3,B1_D4,B1_D5,B1_D6,B1_D7,B1_C0,B1_C1,B1_C2,B1_C3,B1_C4,B1_C5,B1_C6,B1_C7,B2_D0,
B2_D1,B2_D2,B2_D3,B2_D4,B2_D5,B2_D6,B2_D7,B2_C0,B2_C1,B2_C2,B2_C3,B2_C4,B2_C5,B2_C6,B2_C7,B3_D0,B3_D1,B3_D2,B3_D3,B3_D4,B3_D5,B3_D6,B3_D7,B3_C0,B3_C1,
B3_C2,B3_C3,B3_C4,B3_C5,B3_C6,B3_C7,B4_D0,B4_D1,B4_D2,B4_D3,B4_D4,B4_D5,B4_D6,B4_D7,B4_C0,B4_C1,B4_C2,B4_C3,B4_C4,B4_C5,B4_C6,B4_C7,B5_D0,B5_D1,B5_D2,
B5_D3,B5_D4,B5_D5,B5_D6,B5_D7,B5_C0,B5_C1,B5_C2,B5_C3,B5_C4,B5_C5,B5_C6,B5_C7,B6_D0,B6_D1,B6_D2,B6_D3,B6_D4,B6_D5,B6_D6,B6_D7,B6_C0,B6_C1,B6_C2,B6_C3,
B6_C4,B6_C5,B6_C6,B6_C7,B7_D0,B7_D1,B7_D2,B7_D3,B7_D4,B7_D5,B7_D6,B7_D7,B7_C0,B7_C1,B7_C2,B7_C3,B7_C4,B7_C5,B7_C6,B7_C7,C0_D0,C0_D1,C0_D2,C0_D3,C0_D4,
C0_D5,C0_D6,C0_D7,C1_D0,C1_D1,C1_D2,C1_D3,C1_D4,C1_D5,C1_D6,C1_D7,C2_D0,C2_D1,C2_D2,C2_D3,C2_D4,C2_D5,C2_D6,C2_D7,C3_D0,C3_D1,C3_D2,C3_D3,C3_D4,C3_D5,
C3_D6,C3_D7,C4_D0,C4_D1,C4_D2,C4_D3,C4_D4,C4_D5,C4_D6,C4_D7,C5_D0,C5_D1,C5_D2,C5_D3,C5_D4,C5_D5,C5_D6,C5_D7,C6_D0,C6_D1,C6_D2,C6_D3,C6_D4,C6_D5,C6_D6,
C6_D7,C7_D0,C7_D1,C7_D2,C7_D3,C7_D4,C7_D5,C7_D6,C7_D7;


output reg bit_out;
always @ (posedge clk or posedge reset)
begin
if (prgm_b==1'b0 && sb_prgm_b==1'b1) begin
if(reset) begin
A0_B0 <= 0;	    A2_B2 <= 0;    A4_B4 <= 0;   A6_B6 <= 0;   B0_C0 <= 0;    B3_C2 <= 0;   B6_C4 <= 0;   C3_D6 <= 0;
A0_B1 <= 0;     A2_B3 <= 0;    A4_B5 <= 0;   A6_B7 <= 0;   B0_C1 <= 0;    B3_C3 <= 0;   B6_C5 <= 0;   C3_D7 <= 0;
A0_B2 <= 0;     A2_B4 <= 0;    A4_B6 <= 0;   A6_C0 <= 0;   B0_C2 <= 0;    B3_C4 <= 0;   B6_C6 <= 0;   C4_D0 <= 0;
A0_B3 <= 0;     A2_B5 <= 0;    A4_B7 <= 0;   A6_C1 <= 0;   B0_C3 <= 0;    B3_C5 <= 0;   B6_C7 <= 0;   C4_D1 <= 0;
A0_B4 <= 0;     A2_B6 <= 0;    A4_C0 <= 0;   A6_C2 <= 0;   B0_C4 <= 0;    B3_C6 <= 0;   B7_D0 <= 0;   C4_D2 <= 0;
A0_B5 <= 0;     A2_B7 <= 0;    A4_C1 <= 0;   A6_C3 <= 0;   B0_C5 <= 0;    B3_C7 <= 0;   B7_D1 <= 0;   C4_D3 <= 0;
A0_B6 <= 0;     A2_C0 <= 0;    A4_C2 <= 0;   A6_C4 <= 0;   B0_C6 <= 0;    B4_D0 <= 0;   B7_D2 <= 0;   C4_D4 <= 0;
A0_B7 <= 0;     A2_C1 <= 0;    A4_C3 <= 0;   A6_C5 <= 0;   B0_C7 <= 0;    B4_D1 <= 0;   B7_D3 <= 0;   C4_D5 <= 0;
A0_C0 <= 0;     A2_C2 <= 0;    A4_C4 <= 0;   A6_C6 <= 0;   B1_D0 <= 0;    B4_D2 <= 0;   B7_D4 <= 0;   C4_D6 <= 0;
A0_C1 <= 0;     A2_C3 <= 0;    A4_C5 <= 0;   A6_C7 <= 0;   B1_D1 <= 0;    B4_D3 <= 0;   B7_D5 <= 0;   C4_D7 <= 0;
A0_C2 <= 0;     A2_C4 <= 0;    A4_C6 <= 0;   A6_D0 <= 0;   B1_D2 <= 0;    B4_D4 <= 0;   B7_D6 <= 0;   C5_D0 <= 0;
A0_C3 <= 0;     A2_C5 <= 0;    A4_C7 <= 0;   A6_D1 <= 0;   B1_D3 <= 0;    B4_D5 <= 0;   B7_D7 <= 0;   C5_D1 <= 0;
A0_C4 <= 0;     A2_C6 <= 0;    A4_D0 <= 0;   A6_D2 <= 0;   B1_D4 <= 0;    B4_D6 <= 0;   B7_C0 <= 0;   C5_D2 <= 0;
A0_C5 <= 0;     A2_C7 <= 0;    A4_D1 <= 0;   A6_D3 <= 0;   B1_D5 <= 0;    B4_D7 <= 0;   B7_C1 <= 0;   C5_D3 <= 0;
A0_C6 <= 0;     A2_D0 <= 0;    A4_D2 <= 0;   A6_D4 <= 0;   B1_D6 <= 0;    B4_C0 <= 0;   B7_C2 <= 0;   C5_D4 <= 0;
A0_C7 <= 0;     A2_D1 <= 0;    A4_D3 <= 0;   A6_D5 <= 0;   B1_D7 <= 0;    B4_C1 <= 0;   B7_C3 <= 0;   C5_D5 <= 0;
A0_D0 <= 0;     A2_D2 <= 0;    A4_D4 <= 0;   A6_D6 <= 0;   B1_C0 <= 0;    B4_C2 <= 0;   B7_C4 <= 0;   C5_D6 <= 0;
A0_D1 <= 0;     A2_D3 <= 0;    A4_D5 <= 0;   A6_D7 <= 0;   B1_C1 <= 0;    B4_C3 <= 0;   B7_C5 <= 0;   C5_D7 <= 0;
A0_D2 <= 0;     A2_D4 <= 0;    A4_D6 <= 0;   A7_B0 <= 0;   B1_C2 <= 0;    B4_C4 <= 0;   B7_C6 <= 0;   C6_D0 <= 0;
A0_D3 <= 0;     A2_D5 <= 0;    A4_D7 <= 0;   A7_B1 <= 0;   B1_C3 <= 0;    B4_C5 <= 0;   B7_C7 <= 0;   C6_D1 <= 0;
A0_D4 <= 0;     A2_D6 <= 0;    A5_B0 <= 0;   A7_B2 <= 0;   B1_C4 <= 0;    B4_C6 <= 0;   C0_D0 <= 0;   C6_D2 <= 0;
A0_D5 <= 0;     A2_D7 <= 0;    A5_B1 <= 0;   A7_B3 <= 0;   B1_C5 <= 0;    B4_C7 <= 0;   C0_D1 <= 0;   C6_D3 <= 0;
A0_D6 <= 0;     A3_B0 <= 0;    A5_B2 <= 0;   A7_B4 <= 0;   B1_C6 <= 0;    B5_D0 <= 0;   C0_D2 <= 0;   C6_D4 <= 0;
A0_D7 <= 0;     A3_B1 <= 0;    A5_B3 <= 0;   A7_B5 <= 0;   B1_C7 <= 0;    B5_D1 <= 0;   C0_D3 <= 0;   C6_D5 <= 0;
A1_B0 <= 0;     A3_B2 <= 0;    A5_B4 <= 0;   A7_B6 <= 0;   B2_D0 <= 0;    B5_D2 <= 0;   C0_D4 <= 0;   C6_D6 <= 0;
A1_B1 <= 0;     A3_B3 <= 0;    A5_B5 <= 0;   A7_B7 <= 0;   B2_D1 <= 0;    B5_D3 <= 0;   C0_D5 <= 0;   C6_D7 <= 0;
A1_B2 <= 0;     A3_B4 <= 0;    A5_B6 <= 0;   A7_C0 <= 0;   B2_D2 <= 0;    B5_D4 <= 0;   C0_D6 <= 0;   C7_D0 <= 0;
A1_B3 <= 0;     A3_B5 <= 0;    A5_B7 <= 0;   A7_C1 <= 0;   B2_D3 <= 0;    B5_D5 <= 0;   C0_D7 <= 0;   C7_D1 <= 0;
A1_B4 <= 0;     A3_B6 <= 0;    A5_C0 <= 0;   A7_C2 <= 0;   B2_D4 <= 0;    B5_D6 <= 0;   C1_D0 <= 0;   C7_D2 <= 0;
A1_B5 <= 0;     A3_B7 <= 0;    A5_C1 <= 0;   A7_C3 <= 0;   B2_D5 <= 0;    B5_D7 <= 0;   C1_D1 <= 0;   C7_D3 <= 0;
A1_B6 <= 0;     A3_C0 <= 0;    A5_C2 <= 0;   A7_C4 <= 0;   B2_D6 <= 0;    B5_C0 <= 0;   C1_D2 <= 0;   C7_D4 <= 0;
A1_B7 <= 0;     A3_C1 <= 0;    A5_C3 <= 0;   A7_C5 <= 0;   B2_D7 <= 0;    B5_C1 <= 0;   C1_D3 <= 0;   C7_D5 <= 0;
A1_C0 <= 0;     A3_C2 <= 0;    A5_C4 <= 0;   A7_C6 <= 0;   B2_C0 <= 0;    B5_C2 <= 0;   C1_D4 <= 0;   C7_D6 <= 0;
A1_C1 <= 0;     A3_C3 <= 0;    A5_C5 <= 0;   A7_C7 <= 0;   B2_C1 <= 0;    B5_C3 <= 0;   C1_D5 <= 0;   C7_D7 <= 0;
A1_C2 <= 0;     A3_C4 <= 0;    A5_C6 <= 0;   A7_D0 <= 0;   B2_C2 <= 0;    B5_C4 <= 0;   C1_D6 <= 0;   bit_out <= 0;
A1_C3 <= 0;     A3_C5 <= 0;    A5_C7 <= 0;   A7_D1 <= 0;   B2_C3 <= 0;    B5_C5 <= 0;   C1_D7 <= 0;
A1_C4 <= 0;     A3_C6 <= 0;    A5_D0 <= 0;   A7_D2 <= 0;   B2_C4 <= 0;    B5_C6 <= 0;   C2_D0 <= 0;
A1_C5 <= 0;     A3_C7 <= 0;    A5_D1 <= 0;   A7_D3 <= 0;   B2_C5 <= 0;    B5_C7 <= 0;   C2_D1 <= 0;
A1_C6 <= 0;     A3_D0 <= 0;    A5_D2 <= 0;   A7_D4 <= 0;   B2_C6 <= 0;    B6_D0 <= 0;   C2_D2 <= 0;
A1_C7 <= 0;     A3_D1 <= 0;    A5_D3 <= 0;   A7_D5 <= 0;   B2_C7 <= 0;    B6_D1 <= 0;   C2_D3 <= 0;
A1_D0 <= 0;     A3_D2 <= 0;    A5_D4 <= 0;   A7_D6 <= 0;   B3_D0 <= 0;    B6_D2 <= 0;   C2_D4 <= 0;
A1_D1 <= 0;     A3_D3 <= 0;    A5_D5 <= 0;   A7_D7 <= 0;   B3_D1 <= 0;    B6_D3 <= 0;   C2_D5 <= 0;
A1_D2 <= 0;     A3_D4 <= 0;    A5_D6 <= 0;   B0_D0 <= 0;   B3_D2 <= 0;    B6_D4 <= 0;   C2_D6 <= 0;
A1_D3 <= 0;     A3_D5 <= 0;    A5_D7 <= 0;   B0_D1 <= 0;   B3_D3 <= 0;    B6_D5 <= 0;   C2_D7 <= 0;
A1_D4 <= 0;     A3_D6 <= 0;    A6_B0 <= 0;   B0_D2 <= 0;   B3_D4 <= 0;    B6_D6 <= 0;   C3_D0 <= 0;
A1_D5 <= 0;     A3_D7 <= 0;    A6_B1 <= 0;   B0_D3 <= 0;   B3_D5 <= 0;    B6_D7 <= 0;   C3_D1 <= 0;
A1_D6 <= 0;     A4_B0 <= 0;    A6_B2 <= 0;   B0_D4 <= 0;   B3_D6 <= 0;    B6_C0 <= 0;   C3_D2 <= 0;
A1_D7 <= 0;     A4_B1 <= 0;    A6_B3 <= 0;   B0_D5 <= 0;   B3_D7 <= 0;    B6_C1 <= 0;   C3_D3 <= 0;
A2_B0 <= 0;     A4_B2 <= 0;    A6_B4 <= 0;   B0_D6 <= 0;   B3_C0 <= 0;    B6_C2 <= 0;   C3_D4 <= 0;
A2_B1 <= 0;     A4_B3 <= 0;    A6_B5 <= 0;   B0_D7 <= 0;   B3_C1 <= 0;    B6_C3 <= 0;   C3_D5 <= 0;


end
else begin
A0_B0 <= bit_in;	A2_B2 <= A2_B1;    A4_B4 <= A4_B3;   A6_B6 <= A6_B5;   B0_C0 <= B0_D7;    B3_C2 <= B3_C1;   B6_C4 <= B6_C3;   C3_D6 <= C3_D5;
A0_B1 <= A0_B0;     A2_B3 <= A2_B2;    A4_B5 <= A4_B4;   A6_B7 <= A6_B6;   B0_C1 <= B0_C0;    B3_C3 <= B3_C2;   B6_C5 <= B6_C4;   C3_D7 <= C3_D6;
A0_B2 <= A0_B1;     A2_B4 <= A2_B3;    A4_B6 <= A4_B5;   A6_C0 <= A6_B7;   B0_C2 <= B0_C1;    B3_C4 <= B3_C3;   B6_C6 <= B6_C5;   C4_D0 <= C3_D7;
A0_B3 <= A0_B2;     A2_B5 <= A2_B4;    A4_B7 <= A4_B6;   A6_C1 <= A6_C0;   B0_C3 <= B0_C2;    B3_C5 <= B3_C4;   B6_C7 <= B6_C6;   C4_D1 <= C4_D0;
A0_B4 <= A0_B3;     A2_B6 <= A2_B5;    A4_C0 <= A4_B7;   A6_C2 <= A6_C1;   B0_C4 <= B0_C3;    B3_C6 <= B3_C5;   B7_D0 <= B6_C7;   C4_D2 <= C4_D1;
A0_B5 <= A0_B4;     A2_B7 <= A2_B6;    A4_C1 <= A4_C0;   A6_C3 <= A6_C2;   B0_C5 <= B0_C4;    B3_C7 <= B3_C6;   B7_D1 <= B7_D0;   C4_D3 <= C4_D2;
A0_B6 <= A0_B5;     A2_C0 <= A2_B7;    A4_C2 <= A4_C1;   A6_C4 <= A6_C3;   B0_C6 <= B0_C5;    B4_D0 <= B3_C7;   B7_D2 <= B7_D1;   C4_D4 <= C4_D3;
A0_B7 <= A0_B6;     A2_C1 <= A2_C0;    A4_C3 <= A4_C2;   A6_C5 <= A6_C4;   B0_C7 <= B0_C6;    B4_D1 <= B4_D0;   B7_D3 <= B7_D2;   C4_D5 <= C4_D4;
A0_C0 <= A0_B7;     A2_C2 <= A2_C1;    A4_C4 <= A4_C3;   A6_C6 <= A6_C5;   B1_D0 <= B0_C7;    B4_D2 <= B4_D1;   B7_D4 <= B7_D3;   C4_D6 <= C4_D5;
A0_C1 <= A0_C0;     A2_C3 <= A2_C2;    A4_C5 <= A4_C4;   A6_C7 <= A6_C6;   B1_D1 <= B1_D0;    B4_D3 <= B4_D2;   B7_D5 <= B7_D4;   C4_D7 <= C4_D6;
A0_C2 <= A0_C1;     A2_C4 <= A2_C3;    A4_C6 <= A4_C5;   A6_D0 <= A6_C7;   B1_D2 <= B1_D1;    B4_D4 <= B4_D3;   B7_D6 <= B7_D5;   C5_D0 <= C4_D7;
A0_C3 <= A0_C2;     A2_C5 <= A2_C4;    A4_C7 <= A4_C6;   A6_D1 <= A6_D0;   B1_D3 <= B1_D2;    B4_D5 <= B4_D4;   B7_D7 <= B7_D6;   C5_D1 <= C5_D0;
A0_C4 <= A0_C3;     A2_C6 <= A2_C5;    A4_D0 <= A4_C7;   A6_D2 <= A6_D1;   B1_D4 <= B1_D3;    B4_D6 <= B4_D5;   B7_C0 <= B7_D7;   C5_D2 <= C5_D1;
A0_C5 <= A0_C4;     A2_C7 <= A2_C6;    A4_D1 <= A4_D0;   A6_D3 <= A6_D2;   B1_D5 <= B1_D4;    B4_D7 <= B4_D6;   B7_C1 <= B7_C0;   C5_D3 <= C5_D2;
A0_C6 <= A0_C5;     A2_D0 <= A2_C7;    A4_D2 <= A4_D1;   A6_D4 <= A6_D3;   B1_D6 <= B1_D5;    B4_C0 <= B4_D7;   B7_C2 <= B7_C1;   C5_D4 <= C5_D3;
A0_C7 <= A0_C6;     A2_D1 <= A2_D0;    A4_D3 <= A4_D2;   A6_D5 <= A6_D4;   B1_D7 <= B1_D6;    B4_C1 <= B4_C0;   B7_C3 <= B7_C2;   C5_D5 <= C5_D4;
A0_D0 <= A0_C7;     A2_D2 <= A2_D1;    A4_D4 <= A4_D3;   A6_D6 <= A6_D5;   B1_C0 <= B1_D7;    B4_C2 <= B4_C1;   B7_C4 <= B7_C3;   C5_D6 <= C5_D5;
A0_D1 <= A0_D0;     A2_D3 <= A2_D2;    A4_D5 <= A4_D4;   A6_D7 <= A6_D6;   B1_C1 <= B1_C0;    B4_C3 <= B4_C2;   B7_C5 <= B7_C4;   C5_D7 <= C5_D6;
A0_D2 <= A0_D1;     A2_D4 <= A2_D3;    A4_D6 <= A4_D5;   A7_B0 <= A6_D7;   B1_C2 <= B1_C1;    B4_C4 <= B4_C3;   B7_C6 <= B7_C5;   C6_D0 <= C5_D7;
A0_D3 <= A0_D2;     A2_D5 <= A2_D4;    A4_D7 <= A4_D6;   A7_B1 <= A7_B0;   B1_C3 <= B1_C2;    B4_C5 <= B4_C4;   B7_C7 <= B7_C6;   C6_D1 <= C6_D0;
A0_D4 <= A0_D3;     A2_D6 <= A2_D5;    A5_B0 <= A4_D7;   A7_B2 <= A7_B1;   B1_C4 <= B1_C3;    B4_C6 <= B4_C5;   C0_D0 <= B7_C7;   C6_D2 <= C6_D1;
A0_D5 <= A0_D4;     A2_D7 <= A2_D6;    A5_B1 <= A5_B0;   A7_B3 <= A7_B2;   B1_C5 <= B1_C4;    B4_C7 <= B4_C6;   C0_D1 <= C0_D0;   C6_D3 <= C6_D2;
A0_D6 <= A0_D5;     A3_B0 <= A2_D7;    A5_B2 <= A5_B1;   A7_B4 <= A7_B3;   B1_C6 <= B1_C5;    B5_D0 <= B4_C7;   C0_D2 <= C0_D1;   C6_D4 <= C6_D3;
A0_D7 <= A0_D6;     A3_B1 <= A3_B0;    A5_B3 <= A5_B2;   A7_B5 <= A7_B4;   B1_C7 <= B1_C6;    B5_D1 <= B5_D0;   C0_D3 <= C0_D2;   C6_D5 <= C6_D4;
A1_B0 <= A0_D7;     A3_B2 <= A3_B1;    A5_B4 <= A5_B3;   A7_B6 <= A7_B5;   B2_D0 <= B1_C7;    B5_D2 <= B5_D1;   C0_D4 <= C0_D3;   C6_D6 <= C6_D5;
A1_B1 <= A1_B0;     A3_B3 <= A3_B2;    A5_B5 <= A5_B4;   A7_B7 <= A7_B6;   B2_D1 <= B2_D0;    B5_D3 <= B5_D2;   C0_D5 <= C0_D4;   C6_D7 <= C6_D6;
A1_B2 <= A1_B1;     A3_B4 <= A3_B3;    A5_B6 <= A5_B5;   A7_C0 <= A7_B7;   B2_D2 <= B2_D1;    B5_D4 <= B5_D3;   C0_D6 <= C0_D5;   C7_D0 <= C6_D7;
A1_B3 <= A1_B2;     A3_B5 <= A3_B4;    A5_B7 <= A5_B6;   A7_C1 <= A7_C0;   B2_D3 <= B2_D2;    B5_D5 <= B5_D4;   C0_D7 <= C0_D6;   C7_D1 <= C7_D0;
A1_B4 <= A1_B3;     A3_B6 <= A3_B5;    A5_C0 <= A5_B7;   A7_C2 <= A7_C1;   B2_D4 <= B2_D3;    B5_D6 <= B5_D5;   C1_D0 <= C0_D7;   C7_D2 <= C7_D1;
A1_B5 <= A1_B4;     A3_B7 <= A3_B6;    A5_C1 <= A5_C0;   A7_C3 <= A7_C2;   B2_D5 <= B2_D4;    B5_D7 <= B5_D6;   C1_D1 <= C1_D0;   C7_D3 <= C7_D2;
A1_B6 <= A1_B5;     A3_C0 <= A3_B7;    A5_C2 <= A5_C1;   A7_C4 <= A7_C3;   B2_D6 <= B2_D5;    B5_C0 <= B5_D7;   C1_D2 <= C1_D1;   C7_D4 <= C7_D3;
A1_B7 <= A1_B6;     A3_C1 <= A3_C0;    A5_C3 <= A5_C2;   A7_C5 <= A7_C4;   B2_D7 <= B2_D6;    B5_C1 <= B5_C0;   C1_D3 <= C1_D2;   C7_D5 <= C7_D4;
A1_C0 <= A1_B7;     A3_C2 <= A3_C1;    A5_C4 <= A5_C3;   A7_C6 <= A7_C5;   B2_C0 <= B2_D7;    B5_C2 <= B5_C1;   C1_D4 <= C1_D3;   C7_D6 <= C7_D5;
A1_C1 <= A1_C0;     A3_C3 <= A3_C2;    A5_C5 <= A5_C4;   A7_C7 <= A7_C6;   B2_C1 <= B2_C0;    B5_C3 <= B5_C2;   C1_D5 <= C1_D4;   C7_D7 <= C7_D6;
A1_C2 <= A1_C1;     A3_C4 <= A3_C3;    A5_C6 <= A5_C5;   A7_D0 <= A7_C7;   B2_C2 <= B2_C1;    B5_C4 <= B5_C3;   C1_D6 <= C1_D5;   bit_out <= C7_D7;
A1_C3 <= A1_C2;     A3_C5 <= A3_C4;    A5_C7 <= A5_C6;   A7_D1 <= A7_D0;   B2_C3 <= B2_C2;    B5_C5 <= B5_C4;   C1_D7 <= C1_D6;
A1_C4 <= A1_C3;     A3_C6 <= A3_C5;    A5_D0 <= A5_C7;   A7_D2 <= A7_D1;   B2_C4 <= B2_C3;    B5_C6 <= B5_C5;   C2_D0 <= C1_D7;
A1_C5 <= A1_C4;     A3_C7 <= A3_C6;    A5_D1 <= A5_D0;   A7_D3 <= A7_D2;   B2_C5 <= B2_C4;    B5_C7 <= B5_C6;   C2_D1 <= C2_D0;
A1_C6 <= A1_C5;     A3_D0 <= A3_C7;    A5_D2 <= A5_D1;   A7_D4 <= A7_D3;   B2_C6 <= B2_C5;    B6_D0 <= B5_C7;   C2_D2 <= C2_D1;
A1_C7 <= A1_C6;     A3_D1 <= A3_D0;    A5_D3 <= A5_D2;   A7_D5 <= A7_D4;   B2_C7 <= B2_C6;    B6_D1 <= B6_D0;   C2_D3 <= C2_D2;
A1_D0 <= A1_C7;     A3_D2 <= A3_D1;    A5_D4 <= A5_D3;   A7_D6 <= A7_D5;   B3_D0 <= B2_C7;    B6_D2 <= B6_D1;   C2_D4 <= C2_D3;
A1_D1 <= A1_D0;     A3_D3 <= A3_D2;    A5_D5 <= A5_D4;   A7_D7 <= A7_D6;   B3_D1 <= B3_D0;    B6_D3 <= B6_D2;   C2_D5 <= C2_D4;
A1_D2 <= A1_D1;     A3_D4 <= A3_D3;    A5_D6 <= A5_D5;   B0_D0 <= A7_D7;   B3_D2 <= B3_D1;    B6_D4 <= B6_D3;   C2_D6 <= C2_D5;
A1_D3 <= A1_D2;     A3_D5 <= A3_D4;    A5_D7 <= A5_D6;   B0_D1 <= B0_D0;   B3_D3 <= B3_D2;    B6_D5 <= B6_D4;   C2_D7 <= C2_D6;
A1_D4 <= A1_D3;     A3_D6 <= A3_D5;    A6_B0 <= A5_D7;   B0_D2 <= B0_D1;   B3_D4 <= B3_D3;    B6_D6 <= B6_D5;   C3_D0 <= C2_D7;
A1_D5 <= A1_D4;     A3_D7 <= A3_D6;    A6_B1 <= A6_B0;   B0_D3 <= B0_D2;   B3_D5 <= B3_D4;    B6_D7 <= B6_D6;   C3_D1 <= C3_D0;
A1_D6 <= A1_D5;     A4_B0 <= A3_D7;    A6_B2 <= A6_B1;   B0_D4 <= B0_D3;   B3_D6 <= B3_D5;    B6_C0 <= B6_D7;   C3_D2 <= C3_D1;
A1_D7 <= A1_D6;     A4_B1 <= A4_B0;    A6_B3 <= A6_B2;   B0_D5 <= B0_D4;   B3_D7 <= B3_D6;    B6_C1 <= B6_C0;   C3_D3 <= C3_D2;
A2_B0 <= A1_D7;     A4_B2 <= A4_B1;    A6_B4 <= A6_B3;   B0_D6 <= B0_D5;   B3_C0 <= B3_D7;    B6_C2 <= B6_C1;   C3_D4 <= C3_D3;
A2_B1 <= A2_B0;     A4_B3 <= A4_B2;    A6_B5 <= A6_B4;   B0_D7 <= B0_D6;   B3_C1 <= B3_C0;    B6_C3 <= B6_C2;   C3_D5 <= C3_D4;


end
end
end
/*always@(*)

begin
if(prgm_b==1'b1 && sb_prgm_b==1'b0)
	A0_switch=1'b1;     			 C0_switch[1:0]={C0_1,C0_0};
	A1_switch[1:0]={A1_1,A1_0};      C1_switch[1:0]={C1_1,C1_0};
	A2_switch[1:0]={A2_1,A2_0};      C2_switch[1:0]={C2_1,C2_0};
	A3_switch[1:0]={A3_1,A3_0};      C3_switch[1:0]={C3_1,C3_0};
	A4_switch[1:0]={A4_1,A4_0};      C4_switch[1:0]={C4_1,C4_0};
	A5_switch[1:0]={A5_1,A5_0};      C5_switch[1:0]={C5_1,C5_0};
	A6_switch[1:0]={A6_1,A6_0};      C6_switch[1:0]={C6_1,C6_0};
	A7_switch[1:0]={A7_1,A7_0};      C7_switch[1:0]={C7_1,C7_0};

	B0_switch[1:0]={B0_1,B0_0};      D0_switch[1:0]={D0_1,D0_0};
	B1_switch[1:0]={B1_1,B1_0};      D1_switch[1:0]={D1_1,D1_0};
	B2_switch[1:0]={B2_1,B2_0};      D2_switch[1:0]={D2_1,D2_0};
	B3_switch[1:0]={B3_1,B3_0};      D3_switch[1:0]={D3_1,D3_0};
	B4_switch[1:0]={B4_1,B4_0};      D4_switch[1:0]={D4_1,D4_0};
	B5_switch[1:0]={B5_1,B5_0};      D5_switch[1:0]={D5_1,D5_0};
	B6_switch[1:0]={B6_1,B6_0};      D6_switch[1:0]={D6_1,D6_0};
	B7_switch[1:0]={B7_1,B7_0};      D7_switch[1:0]={D7_1,D7_0};
	
end*/
endmodule
	
