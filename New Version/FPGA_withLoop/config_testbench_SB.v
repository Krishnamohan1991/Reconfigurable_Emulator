
module config_testbench_SB(); 

//reg clk,reset,prgm_b,cb_prgm_b;

reg [1535:0] config_stream ;
reg bit_in_SB;

reg sb_prgm_b_in,bit_in,prgm_b,clk,reset,sb_prgm_b;
	//wire prgm_b_out,cb_prgm_b_out_1,prgm_b_out_1,cb_prgm_b_out_2,prgm_b_out_2;

wire sb_prgm_b_out,sb_prgm_b_out_1;

wire [1:0]A0_B0;wire [1:0]A0_B1;wire [1:0]A0_B2;wire [1:0]A0_B3;wire [1:0]A0_B4;wire [1:0]A0_B5;wire [1:0]A0_B6;wire [1:0]A0_B7;wire [1:0]A0_C0;wire [1:0]A0_C1;wire [1:0]A0_C2;wire [1:0]A0_C3;wire [1:0]A0_C4;wire [1:0]A0_C5;wire [1:0]A0_C6;wire [1:0]A0_C7;wire [1:0]A0_D0;wire [1:0]A0_D1;wire [1:0]A0_D2;wire [1:0]A0_D3;wire [1:0]A0_D4;wire [1:0]A0_D5;wire [1:0]A0_D6;wire [1:0]A0_D7;wire [1:0]A1_B0;
wire [1:0]A1_B1;wire [1:0]A1_B2;wire [1:0]A1_B3;wire [1:0]A1_B4;wire [1:0]A1_B5;wire [1:0]A1_B6;wire [1:0]A1_B7;wire [1:0]A1_C0;wire [1:0]A1_C1;wire [1:0]A1_C2;wire [1:0]A1_C3;wire [1:0]A1_C4;wire [1:0]A1_C5;wire [1:0]A1_C6;wire [1:0]A1_C7;wire [1:0]A1_D0;wire [1:0]A1_D1;wire [1:0]A1_D2;wire [1:0]A1_D3;wire [1:0]A1_D4;wire [1:0]A1_D5;wire [1:0]A1_D6;wire [1:0]A1_D7;wire [1:0]A2_B0;wire [1:0]A2_B1;
wire [1:0]A2_B2;wire [1:0]A2_B3;wire [1:0]A2_B4;wire [1:0]A2_B5;wire [1:0]A2_B6;wire [1:0]A2_B7;wire [1:0]A2_C0;wire [1:0]A2_C1;wire [1:0]A2_C2;wire [1:0]A2_C3;wire [1:0]A2_C4;wire [1:0]A2_C5;wire [1:0]A2_C6;wire [1:0]A2_C7;wire [1:0]A2_D0;wire [1:0]A2_D1;wire [1:0]A2_D2;wire [1:0]A2_D3;wire [1:0]A2_D4;wire [1:0]A2_D5;wire [1:0]A2_D6;wire [1:0]A2_D7;wire [1:0]A3_B0;wire [1:0]A3_B1;wire [1:0]A3_B2;
wire [1:0]A3_B3;wire [1:0]A3_B4;wire [1:0]A3_B5;wire [1:0]A3_B6;wire [1:0]A3_B7;wire [1:0]A3_C0;wire [1:0]A3_C1;wire [1:0]A3_C2;wire [1:0]A3_C3;wire [1:0]A3_C4;wire [1:0]A3_C5;wire [1:0]A3_C6;wire [1:0]A3_C7;wire [1:0]A3_D0;wire [1:0]A3_D1;wire [1:0]A3_D2;wire [1:0]A3_D3;wire [1:0]A3_D4;wire [1:0]A3_D5;wire [1:0]A3_D6;wire [1:0]A3_D7;wire [1:0]A4_B0;wire [1:0]A4_B1;wire [1:0]A4_B2;wire [1:0]A4_B3;
wire [1:0]A4_B4;wire [1:0]A4_B5;wire [1:0]A4_B6;wire [1:0]A4_B7;wire [1:0]A4_C0;wire [1:0]A4_C1;wire [1:0]A4_C2;wire [1:0]A4_C3;wire [1:0]A4_C4;wire [1:0]A4_C5;wire [1:0]A4_C6;wire [1:0]A4_C7;wire [1:0]A4_D0;wire [1:0]A4_D1;wire [1:0]A4_D2;wire [1:0]A4_D3;wire [1:0]A4_D4;wire [1:0]A4_D5;wire [1:0]A4_D6;wire [1:0]A4_D7;wire [1:0]A5_B0;wire [1:0]A5_B1;wire [1:0]A5_B2;wire [1:0]A5_B3;wire [1:0]A5_B4;
wire [1:0]A5_B5;wire [1:0]A5_B6;wire [1:0]A5_B7;wire [1:0]A5_C0;wire [1:0]A5_C1;wire [1:0]A5_C2;wire [1:0]A5_C3;wire [1:0]A5_C4;wire [1:0]A5_C5;wire [1:0]A5_C6;wire [1:0]A5_C7;wire [1:0]A5_D0;wire [1:0]A5_D1;wire [1:0]A5_D2;wire [1:0]A5_D3;wire [1:0]A5_D4;wire [1:0]A5_D5;wire [1:0]A5_D6;wire [1:0]A5_D7;wire [1:0]A6_B0;wire [1:0]A6_B1;wire [1:0]A6_B2;wire [1:0]A6_B3;wire [1:0]A6_B4;wire [1:0]A6_B5;
wire [1:0]A6_B6;wire [1:0]A6_B7;wire [1:0]A6_C0;wire [1:0]A6_C1;wire [1:0]A6_C2;wire [1:0]A6_C3;wire [1:0]A6_C4;wire [1:0]A6_C5;wire [1:0]A6_C6;wire [1:0]A6_C7;wire [1:0]A6_D0;wire [1:0]A6_D1;wire [1:0]A6_D2;wire [1:0]A6_D3;wire [1:0]A6_D4;wire [1:0]A6_D5;wire [1:0]A6_D6;wire [1:0]A6_D7;wire [1:0]A7_B0;wire [1:0]A7_B1;wire [1:0]A7_B2;wire [1:0]A7_B3;wire [1:0]A7_B4;wire [1:0]A7_B5;wire [1:0]A7_B6;
wire [1:0]A7_B7;wire [1:0]A7_C0;wire [1:0]A7_C1;wire [1:0]A7_C2;wire [1:0]A7_C3;wire [1:0]A7_C4;wire [1:0]A7_C5;wire [1:0]A7_C6;wire [1:0]A7_C7;wire [1:0]A7_D0;wire [1:0]A7_D1;wire [1:0]A7_D2;wire [1:0]A7_D3;wire [1:0]A7_D4;wire [1:0]A7_D5;wire [1:0]A7_D6;wire [1:0]A7_D7;wire [1:0]B0_D0;wire [1:0]B0_D1;wire [1:0]B0_D2;wire [1:0]B0_D3;wire [1:0]B0_D4;wire [1:0]B0_D5;wire [1:0]B0_D6;wire [1:0]B0_D7;
wire [1:0]B0_C0;wire [1:0]B0_C1;wire [1:0]B0_C2;wire [1:0]B0_C3;wire [1:0]B0_C4;wire [1:0]B0_C5;wire [1:0]B0_C6;wire [1:0]B0_C7;wire [1:0]B1_D0;wire [1:0]B1_D1;wire [1:0]B1_D2;wire [1:0]B1_D3;wire [1:0]B1_D4;wire [1:0]B1_D5;wire [1:0]B1_D6;wire [1:0]B1_D7;wire [1:0]B1_C0;wire [1:0]B1_C1;wire [1:0]B1_C2;wire [1:0]B1_C3;wire [1:0]B1_C4;wire [1:0]B1_C5;wire [1:0]B1_C6;wire [1:0]B1_C7;wire [1:0]B2_D0;
wire [1:0]B2_D1;wire [1:0]B2_D2;wire [1:0]B2_D3;wire [1:0]B2_D4;wire [1:0]B2_D5;wire [1:0]B2_D6;wire [1:0]B2_D7;wire [1:0]B2_C0;wire [1:0]B2_C1;wire [1:0]B2_C2;wire [1:0]B2_C3;wire [1:0]B2_C4;wire [1:0]B2_C5;wire [1:0]B2_C6;wire [1:0]B2_C7;wire [1:0]B3_D0;wire [1:0]B3_D1;wire [1:0]B3_D2;wire [1:0]B3_D3;wire [1:0]B3_D4;wire [1:0]B3_D5;wire [1:0]B3_D6;wire [1:0]B3_D7;wire [1:0]B3_C0;wire [1:0]B3_C1;
wire [1:0]B3_C2;wire [1:0]B3_C3;wire [1:0]B3_C4;wire [1:0]B3_C5;wire [1:0]B3_C6;wire [1:0]B3_C7;wire [1:0]B4_D0;wire [1:0]B4_D1;wire [1:0]B4_D2;wire [1:0]B4_D3;wire [1:0]B4_D4;wire [1:0]B4_D5;wire [1:0]B4_D6;wire [1:0]B4_D7;wire [1:0]B4_C0;wire [1:0]B4_C1;wire [1:0]B4_C2;wire [1:0]B4_C3;wire [1:0]B4_C4;wire [1:0]B4_C5;wire [1:0]B4_C6;wire [1:0]B4_C7;wire [1:0]B5_D0;wire [1:0]B5_D1;wire [1:0]B5_D2;
wire [1:0]B5_D3;wire [1:0]B5_D4;wire [1:0]B5_D5;wire [1:0]B5_D6;wire [1:0]B5_D7;wire [1:0]B5_C0;wire [1:0]B5_C1;wire [1:0]B5_C2;wire [1:0]B5_C3;wire [1:0]B5_C4;wire [1:0]B5_C5;wire [1:0]B5_C6;wire [1:0]B5_C7;wire [1:0]B6_D0;wire [1:0]B6_D1;wire [1:0]B6_D2;wire [1:0]B6_D3;wire [1:0]B6_D4;wire [1:0]B6_D5;wire [1:0]B6_D6;wire [1:0]B6_D7;wire [1:0]B6_C0;wire [1:0]B6_C1;wire [1:0]B6_C2;wire [1:0]B6_C3;
wire [1:0]B6_C4;wire [1:0]B6_C5;wire [1:0]B6_C6;wire [1:0]B6_C7;wire [1:0]B7_D0;wire [1:0]B7_D1;wire [1:0]B7_D2;wire [1:0]B7_D3;wire [1:0]B7_D4;wire [1:0]B7_D5;wire [1:0]B7_D6;wire [1:0]B7_D7;wire [1:0]B7_C0;wire [1:0]B7_C1;wire [1:0]B7_C2;wire [1:0]B7_C3;wire [1:0]B7_C4;wire [1:0]B7_C5;wire [1:0]B7_C6;wire [1:0]B7_C7;wire [1:0]C0_D0;wire [1:0]C0_D1;wire [1:0]C0_D2;wire [1:0]C0_D3;wire [1:0]C0_D4;
wire [1:0]C0_D5;wire [1:0]C0_D6;wire [1:0]C0_D7;wire [1:0]C1_D0;wire [1:0]C1_D1;wire [1:0]C1_D2;wire [1:0]C1_D3;wire [1:0]C1_D4;wire [1:0]C1_D5;wire [1:0]C1_D6;wire [1:0]C1_D7;wire [1:0]C2_D0;wire [1:0]C2_D1;wire [1:0]C2_D2;wire [1:0]C2_D3;wire [1:0]C2_D4;wire [1:0]C2_D5;wire [1:0]C2_D6;wire [1:0]C2_D7;wire [1:0]C3_D0;wire [1:0]C3_D1;wire [1:0]C3_D2;wire [1:0]C3_D3;wire [1:0]C3_D4;wire [1:0]C3_D5;
wire [1:0]C3_D6;wire [1:0]C3_D7;wire [1:0]C4_D0;wire [1:0]C4_D1;wire [1:0]C4_D2;wire [1:0]C4_D3;wire [1:0]C4_D4;wire [1:0]C4_D5;wire [1:0]C4_D6;wire [1:0]C4_D7;wire [1:0]C5_D0;wire [1:0]C5_D1;wire [1:0]C5_D2;wire [1:0]C5_D3;wire [1:0]C5_D4;wire [1:0]C5_D5;wire [1:0]C5_D6;wire [1:0]C5_D7;wire [1:0]C6_D0;wire [1:0]C6_D1;wire [1:0]C6_D2;wire [1:0]C6_D3;wire [1:0]C6_D4;wire [1:0]C6_D5;wire [1:0]C6_D6;
wire [1:0]C6_D7;wire [1:0]C7_D0;wire [1:0]C7_D1;wire [1:0]C7_D2;wire [1:0]C7_D3;wire [1:0]C7_D4;wire [1:0]C7_D5;wire [1:0]C7_D6;wire [1:0]C7_D7;

wire [1:0]A0_B0_1;wire [1:0]A0_B1_1;wire [1:0]A0_B2_1;wire [1:0]A0_B3_1;wire [1:0]A0_B4_1;wire [1:0]A0_B5_1;wire [1:0]A0_B6_1;wire [1:0]A0_B7_1;wire [1:0]A0_C0_1;wire [1:0]A0_C1_1;wire [1:0]A0_C2_1;wire [1:0]A0_C3_1;wire [1:0]A0_C4_1;wire [1:0]A0_C5_1;wire [1:0]A0_C6_1;wire [1:0]A0_C7_1;wire [1:0]A0_D0_1;wire [1:0]A0_D1_1;wire [1:0]A0_D2_1;wire [1:0]A0_D3_1;wire [1:0]A0_D4_1;wire [1:0]A0_D5_1;wire [1:0]A0_D6_1;wire [1:0]A0_D7_1;wire [1:0]A1_B0_1;
wire [1:0]A1_B1_1;wire [1:0]A1_B2_1;wire [1:0]A1_B3_1;wire [1:0]A1_B4_1;wire [1:0]A1_B5_1;wire [1:0]A1_B6_1;wire [1:0]A1_B7_1;wire [1:0]A1_C0_1;wire [1:0]A1_C1_1;wire [1:0]A1_C2_1;wire [1:0]A1_C3_1;wire [1:0]A1_C4_1;wire [1:0]A1_C5_1;wire [1:0]A1_C6_1;wire [1:0]A1_C7_1;wire [1:0]A1_D0_1;wire [1:0]A1_D1_1;wire [1:0]A1_D2_1;wire [1:0]A1_D3_1;wire [1:0]A1_D4_1;wire [1:0]A1_D5_1;wire [1:0]A1_D6_1;wire [1:0]A1_D7_1;wire [1:0]A2_B0_1;wire [1:0]A2_B1_1;
wire [1:0]A2_B2_1;wire [1:0]A2_B3_1;wire [1:0]A2_B4_1;wire [1:0]A2_B5_1;wire [1:0]A2_B6_1;wire [1:0]A2_B7_1;wire [1:0]A2_C0_1;wire [1:0]A2_C1_1;wire [1:0]A2_C2_1;wire [1:0]A2_C3_1;wire [1:0]A2_C4_1;wire [1:0]A2_C5_1;wire [1:0]A2_C6_1;wire [1:0]A2_C7_1;wire [1:0]A2_D0_1;wire [1:0]A2_D1_1;wire [1:0]A2_D2_1;wire [1:0]A2_D3_1;wire [1:0]A2_D4_1;wire [1:0]A2_D5_1;wire [1:0]A2_D6_1;wire [1:0]A2_D7_1;wire [1:0]A3_B0_1;wire [1:0]A3_B1_1;wire [1:0]A3_B2_1;
wire [1:0]A3_B3_1;wire [1:0]A3_B4_1;wire [1:0]A3_B5_1;wire [1:0]A3_B6_1;wire [1:0]A3_B7_1;wire [1:0]A3_C0_1;wire [1:0]A3_C1_1;wire [1:0]A3_C2_1;wire [1:0]A3_C3_1;wire [1:0]A3_C4_1;wire [1:0]A3_C5_1;wire [1:0]A3_C6_1;wire [1:0]A3_C7_1;wire [1:0]A3_D0_1;wire [1:0]A3_D1_1;wire [1:0]A3_D2_1;wire [1:0]A3_D3_1;wire [1:0]A3_D4_1;wire [1:0]A3_D5_1;wire [1:0]A3_D6_1;wire [1:0]A3_D7_1;wire [1:0]A4_B0_1;wire [1:0]A4_B1_1;wire [1:0]A4_B2_1;wire [1:0]A4_B3_1;
wire [1:0]A4_B4_1;wire [1:0]A4_B5_1;wire [1:0]A4_B6_1;wire [1:0]A4_B7_1;wire [1:0]A4_C0_1;wire [1:0]A4_C1_1;wire [1:0]A4_C2_1;wire [1:0]A4_C3_1;wire [1:0]A4_C4_1;wire [1:0]A4_C5_1;wire [1:0]A4_C6_1;wire [1:0]A4_C7_1;wire [1:0]A4_D0_1;wire [1:0]A4_D1_1;wire [1:0]A4_D2_1;wire [1:0]A4_D3_1;wire [1:0]A4_D4_1;wire [1:0]A4_D5_1;wire [1:0]A4_D6_1;wire [1:0]A4_D7_1;wire [1:0]A5_B0_1;wire [1:0]A5_B1_1;wire [1:0]A5_B2_1;wire [1:0]A5_B3_1;wire [1:0]A5_B4_1;
wire [1:0]A5_B5_1;wire [1:0]A5_B6_1;wire [1:0]A5_B7_1;wire [1:0]A5_C0_1;wire [1:0]A5_C1_1;wire [1:0]A5_C2_1;wire [1:0]A5_C3_1;wire [1:0]A5_C4_1;wire [1:0]A5_C5_1;wire [1:0]A5_C6_1;wire [1:0]A5_C7_1;wire [1:0]A5_D0_1;wire [1:0]A5_D1_1;wire [1:0]A5_D2_1;wire [1:0]A5_D3_1;wire [1:0]A5_D4_1;wire [1:0]A5_D5_1;wire [1:0]A5_D6_1;wire [1:0]A5_D7_1;wire [1:0]A6_B0_1;wire [1:0]A6_B1_1;wire [1:0]A6_B2_1;wire [1:0]A6_B3_1;wire [1:0]A6_B4_1;wire [1:0]A6_B5_1;
wire [1:0]A6_B6_1;wire [1:0]A6_B7_1;wire [1:0]A6_C0_1;wire [1:0]A6_C1_1;wire [1:0]A6_C2_1;wire [1:0]A6_C3_1;wire [1:0]A6_C4_1;wire [1:0]A6_C5_1;wire [1:0]A6_C6_1;wire [1:0]A6_C7_1;wire [1:0]A6_D0_1;wire [1:0]A6_D1_1;wire [1:0]A6_D2_1;wire [1:0]A6_D3_1;wire [1:0]A6_D4_1;wire [1:0]A6_D5_1;wire [1:0]A6_D6_1;wire [1:0]A6_D7_1;wire [1:0]A7_B0_1;wire [1:0]A7_B1_1;wire [1:0]A7_B2_1;wire [1:0]A7_B3_1;wire [1:0]A7_B4_1;wire [1:0]A7_B5_1;wire [1:0]A7_B6_1;
wire [1:0]A7_B7_1;wire [1:0]A7_C0_1;wire [1:0]A7_C1_1;wire [1:0]A7_C2_1;wire [1:0]A7_C3_1;wire [1:0]A7_C4_1;wire [1:0]A7_C5_1;wire [1:0]A7_C6_1;wire [1:0]A7_C7_1;wire [1:0]A7_D0_1;wire [1:0]A7_D1_1;wire [1:0]A7_D2_1;wire [1:0]A7_D3_1;wire [1:0]A7_D4_1;wire [1:0]A7_D5_1;wire [1:0]A7_D6_1;wire [1:0]A7_D7_1;wire [1:0]B0_D0_1;wire [1:0]B0_D1_1;wire [1:0]B0_D2_1;wire [1:0]B0_D3_1;wire [1:0]B0_D4_1;wire [1:0]B0_D5_1;wire [1:0]B0_D6_1;wire [1:0]B0_D7_1;
wire [1:0]B0_C0_1;wire [1:0]B0_C1_1;wire [1:0]B0_C2_1;wire [1:0]B0_C3_1;wire [1:0]B0_C4_1;wire [1:0]B0_C5_1;wire [1:0]B0_C6_1;wire [1:0]B0_C7_1;wire [1:0]B1_D0_1;wire [1:0]B1_D1_1;wire [1:0]B1_D2_1;wire [1:0]B1_D3_1;wire [1:0]B1_D4_1;wire [1:0]B1_D5_1;wire [1:0]B1_D6_1;wire [1:0]B1_D7_1;wire [1:0]B1_C0_1;wire [1:0]B1_C1_1;wire [1:0]B1_C2_1;wire [1:0]B1_C3_1;wire [1:0]B1_C4_1;wire [1:0]B1_C5_1;wire [1:0]B1_C6_1;wire [1:0]B1_C7_1;wire [1:0]B2_D0_1;
wire [1:0]B2_D1_1;wire [1:0]B2_D2_1;wire [1:0]B2_D3_1;wire [1:0]B2_D4_1;wire [1:0]B2_D5_1;wire [1:0]B2_D6_1;wire [1:0]B2_D7_1;wire [1:0]B2_C0_1;wire [1:0]B2_C1_1;wire [1:0]B2_C2_1;wire [1:0]B2_C3_1;wire [1:0]B2_C4_1;wire [1:0]B2_C5_1;wire [1:0]B2_C6_1;wire [1:0]B2_C7_1;wire [1:0]B3_D0_1;wire [1:0]B3_D1_1;wire [1:0]B3_D2_1;wire [1:0]B3_D3_1;wire [1:0]B3_D4_1;wire [1:0]B3_D5_1;wire [1:0]B3_D6_1;wire [1:0]B3_D7_1;wire [1:0]B3_C0_1;wire [1:0]B3_C1_1;
wire [1:0]B3_C2_1;wire [1:0]B3_C3_1;wire [1:0]B3_C4_1;wire [1:0]B3_C5_1;wire [1:0]B3_C6_1;wire [1:0]B3_C7_1;wire [1:0]B4_D0_1;wire [1:0]B4_D1_1;wire [1:0]B4_D2_1;wire [1:0]B4_D3_1;wire [1:0]B4_D4_1;wire [1:0]B4_D5_1;wire [1:0]B4_D6_1;wire [1:0]B4_D7_1;wire [1:0]B4_C0_1;wire [1:0]B4_C1_1;wire [1:0]B4_C2_1;wire [1:0]B4_C3_1;wire [1:0]B4_C4_1;wire [1:0]B4_C5_1;wire [1:0]B4_C6_1;wire [1:0]B4_C7_1;wire [1:0]B5_D0_1;wire [1:0]B5_D1_1;wire [1:0]B5_D2_1;
wire [1:0]B5_D3_1;wire [1:0]B5_D4_1;wire [1:0]B5_D5_1;wire [1:0]B5_D6_1;wire [1:0]B5_D7_1;wire [1:0]B5_C0_1;wire [1:0]B5_C1_1;wire [1:0]B5_C2_1;wire [1:0]B5_C3_1;wire [1:0]B5_C4_1;wire [1:0]B5_C5_1;wire [1:0]B5_C6_1;wire [1:0]B5_C7_1;wire [1:0]B6_D0_1;wire [1:0]B6_D1_1;wire [1:0]B6_D2_1;wire [1:0]B6_D3_1;wire [1:0]B6_D4_1;wire [1:0]B6_D5_1;wire [1:0]B6_D6_1;wire [1:0]B6_D7_1;wire [1:0]B6_C0_1;wire [1:0]B6_C1_1;wire [1:0]B6_C2_1;wire [1:0]B6_C3_1;
wire [1:0]B6_C4_1;wire [1:0]B6_C5_1;wire [1:0]B6_C6_1;wire [1:0]B6_C7_1;wire [1:0]B7_D0_1;wire [1:0]B7_D1_1;wire [1:0]B7_D2_1;wire [1:0]B7_D3_1;wire [1:0]B7_D4_1;wire [1:0]B7_D5_1;wire [1:0]B7_D6_1;wire [1:0]B7_D7_1;wire [1:0]B7_C0_1;wire [1:0]B7_C1_1;wire [1:0]B7_C2_1;wire [1:0]B7_C3_1;wire [1:0]B7_C4_1;wire [1:0]B7_C5_1;wire [1:0]B7_C6_1;wire [1:0]B7_C7_1;wire [1:0]C0_D0_1;wire [1:0]C0_D1_1;wire [1:0]C0_D2_1;wire [1:0]C0_D3_1;wire [1:0]C0_D4_1;
wire [1:0]C0_D5_1;wire [1:0]C0_D6_1;wire [1:0]C0_D7_1;wire [1:0]C1_D0_1;wire [1:0]C1_D1_1;wire [1:0]C1_D2_1;wire [1:0]C1_D3_1;wire [1:0]C1_D4_1;wire [1:0]C1_D5_1;wire [1:0]C1_D6_1;wire [1:0]C1_D7_1;wire [1:0]C2_D0_1;wire [1:0]C2_D1_1;wire [1:0]C2_D2_1;wire [1:0]C2_D3_1;wire [1:0]C2_D4_1;wire [1:0]C2_D5_1;wire [1:0]C2_D6_1;wire [1:0]C2_D7_1;wire [1:0]C3_D0_1;wire [1:0]C3_D1_1;wire [1:0]C3_D2_1;wire [1:0]C3_D3_1;wire [1:0]C3_D4_1;wire [1:0]C3_D5_1;
wire [1:0]C3_D6_1;wire [1:0]C3_D7_1;wire [1:0]C4_D0_1;wire [1:0]C4_D1_1;wire [1:0]C4_D2_1;wire [1:0]C4_D3_1;wire [1:0]C4_D4_1;wire [1:0]C4_D5_1;wire [1:0]C4_D6_1;wire [1:0]C4_D7_1;wire [1:0]C5_D0_1;wire [1:0]C5_D1_1;wire [1:0]C5_D2_1;wire [1:0]C5_D3_1;wire [1:0]C5_D4_1;wire [1:0]C5_D5_1;wire [1:0]C5_D6_1;wire [1:0]C5_D7_1;wire [1:0]C6_D0_1;wire [1:0]C6_D1_1;wire [1:0]C6_D2_1;wire [1:0]C6_D3_1;wire [1:0]C6_D4_1;wire [1:0]C6_D5_1;wire [1:0]C6_D6_1;
wire [1:0]C6_D7_1;wire [1:0]C7_D0_1;wire [1:0]C7_D1_1;wire [1:0]C7_D2_1;wire [1:0]C7_D3_1;wire [1:0]C7_D4_1;wire [1:0]C7_D5_1;wire [1:0]C7_D6_1;wire [1:0]C7_D7_1;


integer counter,lut_count;

SB_config_behav SB1(.bit_in(bit_in_SB),.prgm_b(prgm_b),.clk(clk),.reset(reset),.sb_prgm_b(sb_prgm_b),.A0_B0(A0_B0),.A0_B1(A0_B1),.A0_B2(A0_B2),
	.A0_B3(A0_B3),.A0_B4(A0_B4),.A0_B5(A0_B5),.A0_B6(A0_B6),.A0_B7(A0_B7),.A0_C0(A0_C0),.A0_C1(A0_C1),.A0_C2(A0_C2),.A0_C3(A0_C3),.A0_C4(A0_C4),
    .A0_C5(A0_C5),.A0_C6(A0_C6),.A0_C7(A0_C7),.A0_D0(A0_D0),.A0_D1(A0_D1),.A0_D2(A0_D2),.A0_D3(A0_D3),.A0_D4(A0_D4),.A0_D5(A0_D5),.A0_D6(A0_D6),
    .A0_D7(A0_D7),.A1_B0(A1_B0),.A1_B1(A1_B1),.A1_B2(A1_B2),.A1_B3(A1_B3),.A1_B4(A1_B3),.A1_B5(A1_B5),.A1_B6(A1_B6),.A1_B7(A1_B7),.A1_C0(A1_C0),
    .A1_C1(A1_C1),.A1_C2(A1_C2),.A1_C3(A1_C3),.A1_C4(A1_C4),.A1_C5(A1_C5),.A1_C6(A1_C6),.A1_C7(A1_C7),.A1_D0(A1_D0),.A1_D1(A1_D1),.A1_D2(A1_D2),
    .A1_D3(A1_D3),.A1_D4(A1_D4),.A1_D5(A1_D5),.A1_D6(A1_D6),.A1_D7(A1_D7),.A2_B0(A2_B0),.A2_B1(A2_B1),.A2_B2(A2_B2),.A2_B3(A2_B3),.A2_B4(A2_B4),
    .A2_B5(A2_B4),.A2_B6(A2_B6),.A2_B7(A2_B7),.A2_C0(A2_C0),.A2_C1(A2_C1),.A2_C2(A2_C2),.A2_C3(A2_C3),.A2_C4(A2_C4),.A2_C5(A2_C5),.A2_C6(A2_C6),
    .A2_C7(A2_C7),.A2_D0(A2_D0),.A2_D1(A2_D1),.A2_D2(A2_D2),.A2_D3(A2_D3),.A2_D4(A2_D4),.A2_D5(A2_D5),.A2_D6(A2_D6),.A2_D7(A2_D7),.A3_B0(A3_B0),
    .A3_B1(A3_B1),.A3_B2(A3_B2),.A3_B3(A3_B3),.A3_B4(A3_B4),.A3_B5(A3_B5),.A3_B6(A3_B5),.A3_B7(A3_B7),.A3_C0(A3_C0),.A3_C1(A3_C1),.A3_C2(A3_C2),
    .A3_C3(A3_C3),.A3_C4(A3_C4),.A3_C5(A3_C5),.A3_C6(A3_C6),.A3_C7(A3_C7),.A3_D0(A3_D0),.A3_D1(A3_D1),.A3_D2(A3_D2),.A3_D3(A3_D3),.A3_D4(A3_D4),
    .A3_D5(A3_D5),.A3_D6(A3_D6),.A3_D7(A3_D7),.A4_B0(A4_B0),.A4_B1(A4_B1),.A4_B2(A4_B2),.A4_B3(A4_B3),
	.A4_B4(A4_B4),.A4_B5(A4_B5),.A4_B6(A4_B6),.A4_B7(A4_B6),.A4_C0(A4_C0),.A4_C1(A4_C1),.A4_C2(A4_C2),.A4_C3(A4_C3),.A4_C4(A4_C4),.A4_C5(A4_C5),
	.A4_C6(A4_C6),.A4_C7(A4_C7),.A4_D0(A4_D0),.A4_D1(A4_D1),.A4_D2(A4_D2),.A4_D3(A4_D3),.A4_D4(A4_D4),.A4_D5(A4_D5),.A4_D6(A4_D6),.A4_D7(A4_D7),
	.A5_B0(A5_B0),.A5_B1(A5_B1),.A5_B2(A5_B2),.A5_B3(A5_B3),.A5_B4(A5_B4),.A5_B5(A5_B5),.A5_B6(A5_B6),.A5_B7(A5_B7),.A5_C0(A5_B7),.A5_C1(A5_C1),
	.A5_C2(A5_C2),.A5_C3(A5_C3),.A5_C4(A5_C4),.A5_C5(A5_C5),.A5_C6(A5_C6),.A5_C7(A5_C7),.A5_D0(A5_D0),.A5_D1(A5_D1),.A5_D2(A5_D2),.A5_D3(A5_D3),
	.A5_D4(A5_D4),.A5_D5(A5_D5),.A5_D6(A5_D6),.A5_D7(A5_D7),.A6_B0(A6_B0),.A6_B1(A6_B1),.A6_B2(A6_B2),.A6_B3(A6_B3),.A6_B4(A6_B4),.A6_B5(A6_B5),
	.A6_B6(A6_B6),.A6_B7(A6_B7),.A6_C0(A6_C0),.A6_C1(A6_C0),.A6_C2(A6_C2),.A6_C3(A6_C3),.A6_C4(A6_C4),.A6_C5(A6_C5),.A6_C6(A6_C6),.A6_C7(A6_C7),
	.A6_D0(A6_D0),.A6_D1(A6_D1),.A6_D2(A6_D2),.A6_D3(A6_D3),.A6_D4(A6_D4),.A6_D5(A6_D5),.A6_D6(A6_D6),.A6_D7(A6_D7),.A7_B0(A7_B0),.A7_B1(A7_B1),
	.A7_B2(A7_B2),.A7_B3(A7_B3),.A7_B4(A7_B4),.A7_B5(A7_B5),.A7_B6(A7_B6),.A7_B7(A7_B7),.A7_C0(A7_C0),.A7_C1(A7_C1),.A7_C2(A7_C1),.A7_C3(A7_C3),
	.A7_C4(A7_C4),.A7_C5(A7_C5),.A7_C6(A7_C6),.A7_C7(A7_C7),.A7_D0(A7_D0),.A7_D1(A7_D1),.A7_D2(A7_D2),.A7_D3(A7_D3),.A7_D4(A7_D4),.A7_D5(A7_D5),
	.A7_D6(A7_D6),.A7_D7(A7_D7),.B0_D0(B0_D0),.B0_D1(B0_D1),.B0_D2(B0_D2),.B0_D3(B0_D3),.B0_D4(B0_D4),.B0_D5(B0_D5),.B0_D6(B0_D6),.B0_D7(B0_D7),
	.B0_C0(B0_C0),.B0_C1(B0_C1),.B0_C2(B0_C2),.B0_C3(B0_C2),.B0_C4(B0_C4),.B0_C5(B0_C5),.B0_C6(B0_C6),.B0_C7(B0_C7),.B1_D0(B1_D0),.B1_D1(B1_D1),
	.B1_D2(B1_D2),.B1_D3(B1_D3),.B1_D4(B1_D4),.B1_D5(B1_D5),.B1_D6(B1_D6),.B1_D7(B1_D7),.B1_C0(B1_C0),.B1_C1(B1_C1),.B1_C2(B1_C2),.B1_C3(B1_C3),
	.B1_C4(B1_C4),.B1_C5(B1_C5),.B1_C6(B1_C6),.B1_C7(B1_C7),.B2_D0(B2_D0),.B2_D1(B2_D1),.B2_D2(B2_D2),.B2_D3(B2_D3),.B2_D4(B2_D3),.B2_D5(B2_D5),
	.B2_D6(B2_D6),.B2_D7(B2_D7),.B2_C0(B2_C0),.B2_C1(B2_C1),.B2_C2(B2_C2),.B2_C3(B2_C3),.B2_C4(B2_C4),.B2_C5(B2_C5),.B2_C6(B2_C6),.B2_C7(B2_C7),
	.B3_D0(B3_D0),.B3_D1(B3_D1),.B3_D2(B3_D2),.B3_D3(B3_D3),.B3_D4(B3_D4),.B3_D5(B3_D5),.B3_D6(B3_D6),.B3_D7(B3_D7),.B3_C0(B3_C0),.B3_C1(B3_C1),
	.B3_C2(B3_C2),.B3_C3(B3_C3),.B3_C4(B3_C4),.B3_C5(B3_C4),.B3_C6(B3_C6),.B3_C7(B3_C7),.B4_D0(B4_D0),.B4_D1(B4_D1),.B4_D2(B4_D2),.B4_D3(B4_D3),
	.B4_D4(B4_D4),.B4_D5(B4_D5),.B4_D6(B4_D6),.B4_D7(B4_D7),.B4_C0(B4_C0),.B4_C1(B4_C1),.B4_C2(B4_C2),.B4_C3(B4_C3),.B4_C4(B4_C4),.B4_C5(B4_C5),
	.B4_C6(B4_C6),.B4_C7(B4_C7),.B5_D0(B5_D0),.B5_D1(B5_D1),.B5_D2(B5_D2),.B5_D3(B5_D3),.B5_D4(B5_D4),.B5_D5(B5_D5),.B5_D6(B5_D5),.B5_D7(B5_D7),
	.B5_C0(B5_C0),.B5_C1(B5_C1),.B5_C2(B5_C2),.B5_C3(B5_C3),.B5_C4(B5_C4),.B5_C5(B5_C5),.B5_C6(B5_C6),.B5_C7(B5_C7),.B6_D0(B6_D0),.B6_D1(B6_D1),
	.B6_D2(B6_D2),.B6_D3(B6_D3),.B6_D4(B6_D4),.B6_D5(B6_D5),.B6_D6(B6_D6),.B6_D7(B6_D7),.B6_C0(B6_C0),.B6_C1(B6_C1),.B6_C2(B6_C2),.B6_C3(B6_C3),
	.B6_C4(B6_C4),.B6_C5(B6_C5),.B6_C6(B6_C6),.B6_C7(B6_C6),.B7_D0(B7_D0),.B7_D1(B7_D1),.B7_D2(B7_D2),.B7_D3(B7_D3),.B7_D4(B7_D4),.B7_D5(B7_D5),
	.B7_D6(B7_D6),.B7_D7(B7_D7),.B7_C0(B7_C0),.B7_C1(B7_C1),.B7_C2(B7_C2),.B7_C3(B7_C3),.B7_C4(B7_C4),.B7_C5(B7_C5),.B7_C6(B7_C6),.B7_C7(B7_C7),
	.C0_D0(C0_D0),.C0_D1(C0_D1),.C0_D2(C0_D2),.C0_D3(C0_D3),.C0_D4(C0_D4),.C0_D5(C0_D5),.C0_D6(C0_D6),.C0_D7(C0_D7),.C1_D0(C0_D7),.C1_D1(C1_D1),
	.C1_D2(C1_D2),.C1_D3(C1_D3),.C1_D4(C1_D4),.C1_D5(C1_D5),.C1_D6(C1_D6),.C1_D7(C1_D7),.C2_D0(C2_D0),.C2_D1(C2_D1),.C2_D2(C2_D2),.C2_D3(C2_D3),
	.C2_D4(C2_D4),.C2_D5(C2_D5),.C2_D6(C2_D6),.C2_D7(C2_D7),.C3_D0(C3_D0),.C3_D1(C3_D1),.C3_D2(C3_D2),.C3_D3(C3_D3),.C3_D4(C3_D4),.C3_D5(C3_D5),
	.C3_D6(C3_D6),.C3_D7(C3_D7),.C4_D0(C4_D0),.C4_D1(C4_D0),.C4_D2(C4_D2),.C4_D3(C4_D3),.C4_D4(C4_D4),.C4_D5(C4_D5),.C4_D6(C4_D6),.C4_D7(C4_D7),
	.C5_D0(C5_D0),.C5_D1(C5_D1),.C5_D2(C5_D2),.C5_D3(C5_D3),.C5_D4(C5_D4),.C5_D5(C5_D5),.C5_D6(C5_D6),.C5_D7(C5_D7),.C6_D0(C6_D0),.C6_D1(C6_D1),
	.C6_D2(C6_D2),.C6_D3(C6_D3),.C6_D4(C6_D4),.C6_D5(C6_D5),.C6_D6(C6_D6),.C6_D7(C6_D7),.C7_D0(C7_D0),.C7_D1(C7_D1),.C7_D2(C7_D1),.C7_D3(C7_D3),
	.C7_D4(C7_D4),.C7_D5(C7_D5),.C7_D6(C7_D6),.C7_D7(C7_D7),.sb_prgm_b_in(sb_prgm_b_in),.sb_prgm_b_out(sb_prgm_b_out));

SB_config_behav SB2(.bit_in(bit_in_SB),.prgm_b(prgm_b),.clk(clk),.reset(reset),.sb_prgm_b(sb_prgm_b),.A0_B0(A0_B0_1),.A0_B1(A0_B1_1),.A0_B2(A0_B2_1),
	.A0_B3(A0_B3_1),.A0_B4(A0_B4_1),.A0_B5(A0_B5_1),.A0_B6(A0_B6_1),.A0_B7(A0_B7_1),.A0_C0(A0_C0_1),.A0_C1(A0_C1_1),.A0_C2(A0_C2_1),.A0_C3(A0_C3_1),.A0_C4(A0_C4_1),
    .A0_C5(A0_C5_1),.A0_C6(A0_C6_1),.A0_C7(A0_C7_1),.A0_D0(A0_D0_1),.A0_D1(A0_D1_1),.A0_D2(A0_D2_1),.A0_D3(A0_D3_1),.A0_D4(A0_D4_1),.A0_D5(A0_D5_1),.A0_D6(A0_D6_1),
    .A0_D7(A0_D7_1),.A1_B0(A1_B0_1),.A1_B1(A1_B1_1),.A1_B2(A1_B2_1),.A1_B3(A1_B3_1),.A1_B4(A1_B3_1),.A1_B5(A1_B5_1),.A1_B6(A1_B6_1),.A1_B7(A1_B7_1),.A1_C0(A1_C0_1),
    .A1_C1(A1_C1_1),.A1_C2(A1_C2_1),.A1_C3(A1_C3_1),.A1_C4(A1_C4_1),.A1_C5(A1_C5_1),.A1_C6(A1_C6_1),.A1_C7(A1_C7_1),.A1_D0(A1_D0_1),.A1_D1(A1_D1_1),.A1_D2(A1_D2_1),
    .A1_D3(A1_D3_1),.A1_D4(A1_D4_1),.A1_D5(A1_D5_1),.A1_D6(A1_D6_1),.A1_D7(A1_D7_1),.A2_B0(A2_B0_1),.A2_B1(A2_B1_1),.A2_B2(A2_B2_1),.A2_B3(A2_B3_1),.A2_B4(A2_B4_1),
    .A2_B5(A2_B4_1),.A2_B6(A2_B6_1),.A2_B7(A2_B7_1),.A2_C0(A2_C0_1),.A2_C1(A2_C1_1),.A2_C2(A2_C2_1),.A2_C3(A2_C3_1),.A2_C4(A2_C4_1),.A2_C5(A2_C5_1),.A2_C6(A2_C6_1),
    .A2_C7(A2_C7_1),.A2_D0(A2_D0_1),.A2_D1(A2_D1_1),.A2_D2(A2_D2_1),.A2_D3(A2_D3_1),.A2_D4(A2_D4_1),.A2_D5(A2_D5_1),.A2_D6(A2_D6_1),.A2_D7(A2_D7_1),.A3_B0(A3_B0_1),
    .A3_B1(A3_B1_1),.A3_B2(A3_B2_1),.A3_B3(A3_B3_1),.A3_B4(A3_B4_1),.A3_B5(A3_B5_1),.A3_B6(A3_B5_1),.A3_B7(A3_B7_1),.A3_C0(A3_C0_1),.A3_C1(A3_C1_1),.A3_C2(A3_C2_1),
    .A3_C3(A3_C3_1),.A3_C4(A3_C4_1),.A3_C5(A3_C5_1),.A3_C6(A3_C6_1),.A3_C7(A3_C7_1),.A3_D0(A3_D0_1),.A3_D1(A3_D1_1),.A3_D2(A3_D2_1),.A3_D3(A3_D3_1),.A3_D4(A3_D4_1),
    .A3_D5(A3_D5_1),.A3_D6(A3_D6_1),.A3_D7(A3_D7_1),.A4_B0(A4_B0_1),.A4_B1(A4_B1_1),.A4_B2(A4_B2_1),.A4_B3(A4_B3_1),
	.A4_B4(A4_B4_1),.A4_B5(A4_B5_1),.A4_B6(A4_B6_1),.A4_B7(A4_B6_1),.A4_C0(A4_C0_1),.A4_C1(A4_C1_1),.A4_C2(A4_C2_1),.A4_C3(A4_C3_1),.A4_C4(A4_C4_1),.A4_C5(A4_C5_1),
	.A4_C6(A4_C6_1),.A4_C7(A4_C7_1),.A4_D0(A4_D0_1),.A4_D1(A4_D1_1),.A4_D2(A4_D2_1),.A4_D3(A4_D3_1),.A4_D4(A4_D4_1),.A4_D5(A4_D5_1),.A4_D6(A4_D6_1),.A4_D7(A4_D7_1),
	.A5_B0(A5_B0_1),.A5_B1(A5_B1_1),.A5_B2(A5_B2_1),.A5_B3(A5_B3_1),.A5_B4(A5_B4_1),.A5_B5(A5_B5_1),.A5_B6(A5_B6_1),.A5_B7(A5_B7_1),.A5_C0(A5_B7_1),.A5_C1(A5_C1_1),
	.A5_C2(A5_C2_1),.A5_C3(A5_C3_1),.A5_C4(A5_C4_1),.A5_C5(A5_C5_1),.A5_C6(A5_C6_1),.A5_C7(A5_C7_1),.A5_D0(A5_D0_1),.A5_D1(A5_D1_1),.A5_D2(A5_D2_1),.A5_D3(A5_D3_1),
	.A5_D4(A5_D4_1),.A5_D5(A5_D5_1),.A5_D6(A5_D6_1),.A5_D7(A5_D7_1),.A6_B0(A6_B0_1),.A6_B1(A6_B1_1),.A6_B2(A6_B2_1),.A6_B3(A6_B3_1),.A6_B4(A6_B4_1),.A6_B5(A6_B5_1),
	.A6_B6(A6_B6_1),.A6_B7(A6_B7_1),.A6_C0(A6_C0_1),.A6_C1(A6_C0_1),.A6_C2(A6_C2_1),.A6_C3(A6_C3_1),.A6_C4(A6_C4_1),.A6_C5(A6_C5_1),.A6_C6(A6_C6_1),.A6_C7(A6_C7_1),
	.A6_D0(A6_D0_1),.A6_D1(A6_D1_1),.A6_D2(A6_D2_1),.A6_D3(A6_D3_1),.A6_D4(A6_D4_1),.A6_D5(A6_D5_1),.A6_D6(A6_D6_1),.A6_D7(A6_D7_1),.A7_B0(A7_B0_1),.A7_B1(A7_B1_1),
	.A7_B2(A7_B2_1),.A7_B3(A7_B3_1),.A7_B4(A7_B4_1),.A7_B5(A7_B5_1),.A7_B6(A7_B6_1),.A7_B7(A7_B7_1),.A7_C0(A7_C0_1),.A7_C1(A7_C1_1),.A7_C2(A7_C1_1),.A7_C3(A7_C3_1),
	.A7_C4(A7_C4_1),.A7_C5(A7_C5_1),.A7_C6(A7_C6_1),.A7_C7(A7_C7_1),.A7_D0(A7_D0_1),.A7_D1(A7_D1_1),.A7_D2(A7_D2_1),.A7_D3(A7_D3_1),.A7_D4(A7_D4_1),.A7_D5(A7_D5_1),
	.A7_D6(A7_D6_1),.A7_D7(A7_D7_1),.B0_D0(B0_D0_1),.B0_D1(B0_D1_1),.B0_D2(B0_D2_1),.B0_D3(B0_D3_1),.B0_D4(B0_D4_1),.B0_D5(B0_D5_1),.B0_D6(B0_D6_1),.B0_D7(B0_D7_1),
	.B0_C0(B0_C0_1),.B0_C1(B0_C1_1),.B0_C2(B0_C2_1),.B0_C3(B0_C2_1),.B0_C4(B0_C4_1),.B0_C5(B0_C5_1),.B0_C6(B0_C6_1),.B0_C7(B0_C7_1),.B1_D0(B1_D0_1),.B1_D1(B1_D1_1),
	.B1_D2(B1_D2_1),.B1_D3(B1_D3_1),.B1_D4(B1_D4_1),.B1_D5(B1_D5_1),.B1_D6(B1_D6_1),.B1_D7(B1_D7_1),.B1_C0(B1_C0_1),.B1_C1(B1_C1_1),.B1_C2(B1_C2_1),.B1_C3(B1_C3_1),
	.B1_C4(B1_C4_1),.B1_C5(B1_C5_1),.B1_C6(B1_C6_1),.B1_C7(B1_C7_1),.B2_D0(B2_D0_1),.B2_D1(B2_D1_1),.B2_D2(B2_D2_1),.B2_D3(B2_D3_1),.B2_D4(B2_D3_1),.B2_D5(B2_D5_1),
	.B2_D6(B2_D6_1),.B2_D7(B2_D7_1),.B2_C0(B2_C0_1),.B2_C1(B2_C1_1),.B2_C2(B2_C2_1),.B2_C3(B2_C3_1),.B2_C4(B2_C4_1),.B2_C5(B2_C5_1),.B2_C6(B2_C6_1),.B2_C7(B2_C7_1),
	.B3_D0(B3_D0_1),.B3_D1(B3_D1_1),.B3_D2(B3_D2_1),.B3_D3(B3_D3_1),.B3_D4(B3_D4_1),.B3_D5(B3_D5_1),.B3_D6(B3_D6_1),.B3_D7(B3_D7_1),.B3_C0(B3_C0_1),.B3_C1(B3_C1_1),
	.B3_C2(B3_C2_1),.B3_C3(B3_C3_1),.B3_C4(B3_C4_1),.B3_C5(B3_C4_1),.B3_C6(B3_C6_1),.B3_C7(B3_C7_1),.B4_D0(B4_D0_1),.B4_D1(B4_D1_1),.B4_D2(B4_D2_1),.B4_D3(B4_D3_1),
	.B4_D4(B4_D4_1),.B4_D5(B4_D5_1),.B4_D6(B4_D6_1),.B4_D7(B4_D7_1),.B4_C0(B4_C0_1),.B4_C1(B4_C1_1),.B4_C2(B4_C2_1),.B4_C3(B4_C3_1),.B4_C4(B4_C4_1),.B4_C5(B4_C5_1),
	.B4_C6(B4_C6_1),.B4_C7(B4_C7_1),.B5_D0(B5_D0_1),.B5_D1(B5_D1_1),.B5_D2(B5_D2_1),.B5_D3(B5_D3_1),.B5_D4(B5_D4_1),.B5_D5(B5_D5_1),.B5_D6(B5_D5_1),.B5_D7(B5_D7_1),
	.B5_C0(B5_C0_1),.B5_C1(B5_C1_1),.B5_C2(B5_C2_1),.B5_C3(B5_C3_1),.B5_C4(B5_C4_1),.B5_C5(B5_C5_1),.B5_C6(B5_C6_1),.B5_C7(B5_C7_1),.B6_D0(B6_D0_1),.B6_D1(B6_D1_1),
	.B6_D2(B6_D2_1),.B6_D3(B6_D3_1),.B6_D4(B6_D4_1),.B6_D5(B6_D5_1),.B6_D6(B6_D6_1),.B6_D7(B6_D7_1),.B6_C0(B6_C0_1),.B6_C1(B6_C1_1),.B6_C2(B6_C2_1),.B6_C3(B6_C3_1),
	.B6_C4(B6_C4_1),.B6_C5(B6_C5_1),.B6_C6(B6_C6_1),.B6_C7(B6_C6_1),.B7_D0(B7_D0_1),.B7_D1(B7_D1_1),.B7_D2(B7_D2_1),.B7_D3(B7_D3_1),.B7_D4(B7_D4_1),.B7_D5(B7_D5_1),
	.B7_D6(B7_D6_1),.B7_D7(B7_D7_1),.B7_C0(B7_C0_1),.B7_C1(B7_C1_1),.B7_C2(B7_C2_1),.B7_C3(B7_C3_1),.B7_C4(B7_C4_1),.B7_C5(B7_C5_1),.B7_C6(B7_C6_1),.B7_C7(B7_C7_1),
	.C0_D0(C0_D0_1),.C0_D1(C0_D1_1),.C0_D2(C0_D2_1),.C0_D3(C0_D3_1),.C0_D4(C0_D4_1),.C0_D5(C0_D5_1),.C0_D6(C0_D6_1),.C0_D7(C0_D7_1),.C1_D0(C0_D7_1),.C1_D1(C1_D1_1),
	.C1_D2(C1_D2_1),.C1_D3(C1_D3_1),.C1_D4(C1_D4_1),.C1_D5(C1_D5_1),.C1_D6(C1_D6_1),.C1_D7(C1_D7_1),.C2_D0(C2_D0_1),.C2_D1(C2_D1_1),.C2_D2(C2_D2_1),.C2_D3(C2_D3_1),
	.C2_D4(C2_D4_1),.C2_D5(C2_D5_1),.C2_D6(C2_D6_1),.C2_D7(C2_D7_1),.C3_D0(C3_D0_1),.C3_D1(C3_D1_1),.C3_D2(C3_D2_1),.C3_D3(C3_D3_1),.C3_D4(C3_D4_1),.C3_D5(C3_D5_1),
	.C3_D6(C3_D6_1),.C3_D7(C3_D7_1),.C4_D0(C4_D0_1),.C4_D1(C4_D0_1),.C4_D2(C4_D2_1),.C4_D3(C4_D3_1),.C4_D4(C4_D4_1),.C4_D5(C4_D5_1),.C4_D6(C4_D6_1),.C4_D7(C4_D7_1),
	.C5_D0(C5_D0_1),.C5_D1(C5_D1_1),.C5_D2(C5_D2_1),.C5_D3(C5_D3_1),.C5_D4(C5_D4_1),.C5_D5(C5_D5_1),.C5_D6(C5_D6_1),.C5_D7(C5_D7_1),.C6_D0(C6_D0_1),.C6_D1(C6_D1_1),
	.C6_D2(C6_D2_1),.C6_D3(C6_D3_1),.C6_D4(C6_D4_1),.C6_D5(C6_D5_1),.C6_D6(C6_D6_1),.C6_D7(C6_D7_1),.C7_D0(C7_D0_1),.C7_D1(C7_D1_1),.C7_D2(C7_D1_1),.C7_D3(C7_D3_1),
	.C7_D4(C7_D4_1),.C7_D5(C7_D5_1),.C7_D6(C7_D6_1),.C7_D7(C7_D7_1),.sb_prgm_b_in(sb_prgm_b_out),.sb_prgm_b_out(sb_prgm_b_out_1));


/*test_config TC1(.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.prgm_b_in(prgm_b_out),.cb_prgm_b_in(cb_prgm_b_out),.prgm_b_out(prgm_b_out_1),.cb_prgm_b_out(cb_prgm_b_out_1),
.x1_G0(x1_G0_1),.x2_G0(x2_G0_1),.x3_G0(x3_G0_1),.x4_G0(x4_G0_1),.x5_G0(x5_G0_1),.x6_G0(x6_G0_1),.x7_G0(x7_G0_1),.x8_G0(x8_G0_1),.x9_G0(x9_G0_1),
.q1_G0(q1_G0_1),.q2_G0(q2_G0_1),.q3_G0(q3_G0_1),.q4_G0(q4_G0_1),.x1_G1(x1_G1_1),.x2_G1(x2_G1_1),.x3_G1(x3_G1_1),.x4_G1(x4_G1_1),.x5_G1(x5_G1_1),
.x6_G1(x6_G1_1),.x7_G1(x7_G1_1),.x8_G1(x8_G1_1),.x9_G1(x9_G1_1),.q1_G1(q1_G1_1),.q2_G1(q2_G1_1),.q3_G1(q3_G1_1),.q4_G1(q4_G1_1),.cb_prgm_b(cb_prgm_b));

test_config TC2(.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.prgm_b_in(prgm_b_out_1),.cb_prgm_b_in(cb_prgm_b_out_1),.prgm_b_out(prgm_b_out_2),.cb_prgm_b_out(cb_prgm_b_out_2),
.x1_G0(x1_G0_2),.x2_G0(x2_G0_2),.x3_G0(x3_G0_2),.x4_G0(x4_G0_2),.x5_G0(x5_G0_2),.x6_G0(x6_G0_2),.x7_G0(x7_G0_2),.x8_G0(x8_G0_2),.x9_G0(x9_G0_2),
.q1_G0(q1_G0_2),.q2_G0(q2_G0_2),.q3_G0(q3_G0_2),.q4_G0(q4_G0_2),.x1_G1(x1_G1_2),.x2_G1(x2_G1_2),.x3_G1(x3_G1_2),.x4_G1(x4_G1_2),.x5_G1(x5_G1_2),
.x6_G1(x6_G1_2),.x7_G1(x7_G1_2),.x8_G1(x8_G1_2),.x9_G1(x9_G1_2),.q1_G1(q1_G1_2),.q2_G1(q2_G1_2),.q3_G1(q3_G1_2),.q4_G1(q4_G1_2),.cb_prgm_b(cb_prgm_b));
*/

initial begin

config_stream[1535:0]= 1536'b110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011_110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011;
clk = 1'b0;
 reset=1'b0;
 
 prgm_b=1'b1;   //indicates start of bit_stream----active low
 sb_prgm_b=1'b0;

 fork
 #1 reset=1'b1;
 #1 prgm_b=1'b0;
 #1 sb_prgm_b=1'b1;
  #1 sb_prgm_b_in=1'b1;
 #1 counter=0;lut_count=0;
 #1 reset=1'b1;
 #2 reset=1'b0;
 join
end


always@(posedge clk or posedge reset)
begin 

if(prgm_b!=1'b1 && sb_prgm_b!=1'b0) begin

	
	
	
	if((counter == 769) && sb_prgm_b!=1'b0) //(no of bits required for one SB +1 = 769)
	begin
	    
		lut_count=lut_count+1;
		
		counter=0;
		if(lut_count==2)
		begin
			
			sb_prgm_b=1'b0;
			//sb_prgm_b_in=1'b1;
			
		end
	end 
	bit_in_SB <= config_stream[0];
	config_stream <=config_stream>>1;
	counter=counter+1;//if endsj
end 

end //always block ends

initial begin

forever #5 clk=!clk;
end

initial
	begin 

#6350;               //time=5 seconds


reset=1'b0;
//switch=0;
#6360;



#20500 $finish;
	end

initial begin
    $dumpfile("test.vcd");

    $dumpvars(0,config_testbench_SB);
   $timeformat(-9, 1, " ns", 6);
$monitor("At t=%t prgm_b=%b reset=%b lut_count=%d bit_in_SB=%b counter=%d",$time,prgm_b,reset,lut_count,bit_in_SB,counter);
end

//Stimulus

endmodule