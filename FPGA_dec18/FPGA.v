module FPGA(V00_0,V00_1,V00_2,V00_3,V00_4,V00_5,V00_6,V00_7,V01_0,V01_1,V01_2,V01_3,V01_4,V01_5,V01_6,V01_7,
	    V02_0,V02_1,V02_2,V02_3,V02_4,V02_5,V02_6,V02_7,V03_0,V03_1,V03_2,V03_3,V03_4,V03_5,V03_6,V03_7,V04_0,V04_1,V04_2,V04_3,V04_4,V04_5,V04_6,V04_7,	  
       H10_0,H10_1,H10_2,H10_3,H10_4,H10_5,H10_6,H10_7,H11_0,H11_1,H11_2,H11_3,H11_4,H11_5,H11_6,H11_7,
       H20_0,H20_1,H20_2,H20_3,H20_4,H20_5,H20_6,H20_7,H21_0,H21_1,H21_2,H21_3,H21_4,H21_5,H21_6,H21_7,
       H30_0,H30_1,H30_2,H30_3,H30_4,H30_5,H30_6,H30_7,H31_0,H31_1,H31_2,H31_3,H31_4,H31_5,H31_6,H31_7,
       H40_0,H40_1,H40_2,H40_3,H40_4,H40_5,H40_6,H40_7,H41_0,H41_1,H41_2,H41_3,H41_4,H41_5,H41_6,H41_7,
	   H50_0,H50_1,H50_2,H50_3,H50_4,H50_5,H50_6,H50_7,H51_0,H51_1,H51_2,H51_3,H51_4,H51_5,H51_6,H51_7,
       V60_0,V60_1,V60_2,V60_3,V60_4,V60_5,V60_6,V60_7,V61_0,V61_1,V61_2,V61_3,V61_4,V61_5,V61_6,V61_7,
	   V62_0,V62_1,V62_2,V62_3,V62_4,V62_5,V62_6,V62_7,V63_0,V63_1,V63_2,V63_3,V63_4,V63_5,V63_6,V63_7,V64_0,V64_1,V64_2,V64_3,V64_4,V64_5,V64_6,V64_7,            
       clk,reset,GWE,prgm_b,CLB_prgm_b,cb_prgm_b,sb_prgm_b,io_prgm_b,bit_in_CLB,bit_in_CB,bit_in_SB,bit_in_IO,
       cb_prgm_b_in,cb_prgm_b_out,sb_prgm_b_in,sb_prgm_b_out,CLB_prgm_b_in,CLB_prgm_b_out,io_prgm_b_in,io_prgm_b_out);

input clk,reset,prgm_b,bit_in_CLB,bit_in_CB,CLB_prgm_b,CLB_prgm_b_in,cb_prgm_b,cb_prgm_b_in,sb_prgm_b_in,io_prgm_b_in,bit_in_SB,
	io_prgm_b,sb_prgm_b,bit_in_IO,GWE;

inout V00_0,V00_1,V00_2,V00_3,V00_4,V00_5,V00_6,V00_7,V01_0,V01_1,V01_2,V01_3,V01_4,V01_5,V01_6,V01_7,
	    V02_0,V02_1,V02_2,V02_3,V02_4,V02_5,V02_6,V02_7,V03_0,V03_1,V03_2,V03_3,V03_4,V03_5,V03_6,V03_7,V04_0,V04_1,V04_2,V04_3,V04_4,V04_5,V04_6,V04_7,
	   V60_0,V60_1,V60_2,V60_3,V60_4,V60_5,V60_6,V60_7,V61_0,V61_1,V61_2,V61_3,V61_4,V61_5,V61_6,V61_7,
	   V62_0,V62_1,V62_2,V62_3,V62_4,V62_5,V62_6,V62_7,V63_0,V63_1,V63_2,V63_3,V63_4,V63_5,V63_6,V63_7,V64_0,V64_1,V64_2,V64_3,V64_4,V64_5,V64_6,V64_7,
       H10_0,H10_1,H10_2,H10_3,H10_4,H10_5,H10_6,H10_7,H11_0,H11_1,H11_2,H11_3,H11_4,H11_5,H11_6,H11_7,
       H20_0,H20_1,H20_2,H20_3,H20_4,H20_5,H20_6,H20_7,H21_0,H21_1,H21_2,H21_3,H21_4,H21_5,H21_6,H21_7,
       H30_0,H30_1,H30_2,H30_3,H30_4,H30_5,H30_6,H30_7,H31_0,H31_1,H31_2,H31_3,H31_4,H31_5,H31_6,H31_7,
       H40_0,H40_1,H40_2,H40_3,H40_4,H40_5,H40_6,H40_7,H41_0,H41_1,H41_2,H41_3,H41_4,H41_5,H41_6,H41_7,
	   H50_0,H50_1,H50_2,H50_3,H50_4,H50_5,H50_6,H50_7,H51_0,H51_1,H51_2,H51_3,H51_4,H51_5,H51_6,H51_7;

//ADD to module port list
output CLB_prgm_b_out,cb_prgm_b_out,io_prgm_b_out,sb_prgm_b_out;

//DEcide on this ....how to send write signals

input CLB00_LUT0_WE,CLB00_LUT1_WE,CLB00_LUT2_WE,CLB00_LUT3_WE,CLB00_LUT4_WE,CLB00_LUT5_WE,CLB00_LUT6_WE,CLB00_LUT7_WE;
input CLB01_LUT0_WE,CLB01_LUT1_WE,CLB01_LUT2_WE,CLB01_LUT3_WE,CLB01_LUT4_WE,CLB01_LUT5_WE,CLB01_LUT6_WE,CLB01_LUT7_WE;
input CLB02_LUT0_WE,CLB02_LUT1_WE,CLB02_LUT2_WE,CLB02_LUT3_WE,CLB02_LUT4_WE,CLB02_LUT5_WE,CLB02_LUT6_WE,CLB02_LUT7_WE;
input CLB03_LUT0_WE,CLB03_LUT1_WE,CLB03_LUT2_WE,CLB03_LUT3_WE,CLB03_LUT4_WE,CLB03_LUT5_WE,CLB03_LUT6_WE,CLB03_LUT7_WE;

input CLB10_LUT0_WE,CLB10_LUT1_WE,CLB10_LUT2_WE,CLB10_LUT3_WE,CLB10_LUT4_WE,CLB10_LUT5_WE,CLB10_LUT6_WE,CLB10_LUT7_WE;
input CLB11_LUT0_WE,CLB11_LUT1_WE,CLB11_LUT2_WE,CLB11_LUT3_WE,CLB11_LUT4_WE,CLB11_LUT5_WE,CLB11_LUT6_WE,CLB11_LUT7_WE;
input CLB12_LUT0_WE,CLB12_LUT1_WE,CLB12_LUT2_WE,CLB12_LUT3_WE,CLB12_LUT4_WE,CLB12_LUT5_WE,CLB12_LUT6_WE,CLB12_LUT7_WE;
input CLB13_LUT0_WE,CLB13_LUT1_WE,CLB13_LUT2_WE,CLB13_LUT3_WE,CLB13_LUT4_WE,CLB13_LUT5_WE,CLB13_LUT6_WE,CLB13_LUT7_WE;

input CLB20_LUT0_WE,CLB20_LUT1_WE,CLB20_LUT2_WE,CLB20_LUT3_WE,CLB20_LUT4_WE,CLB20_LUT5_WE,CLB20_LUT6_WE,CLB20_LUT7_WE;
input CLB21_LUT0_WE,CLB21_LUT1_WE,CLB21_LUT2_WE,CLB21_LUT3_WE,CLB21_LUT4_WE,CLB21_LUT5_WE,CLB21_LUT6_WE,CLB21_LUT7_WE;
input CLB22_LUT0_WE,CLB22_LUT1_WE,CLB22_LUT2_WE,CLB22_LUT3_WE,CLB22_LUT4_WE,CLB22_LUT5_WE,CLB22_LUT6_WE,CLB22_LUT7_WE;
input CLB23_LUT0_WE,CLB23_LUT1_WE,CLB23_LUT2_WE,CLB23_LUT3_WE,CLB23_LUT4_WE,CLB23_LUT5_WE,CLB23_LUT6_WE,CLB23_LUT7_WE;

input CLB30_LUT0_WE,CLB30_LUT1_WE,CLB30_LUT2_WE,CLB30_LUT3_WE,CLB30_LUT4_WE,CLB30_LUT5_WE,CLB30_LUT6_WE,CLB30_LUT7_WE;
input CLB31_LUT0_WE,CLB31_LUT1_WE,CLB31_LUT2_WE,CLB31_LUT3_WE,CLB31_LUT4_WE,CLB31_LUT5_WE,CLB31_LUT6_WE,CLB31_LUT7_WE;
input CLB32_LUT0_WE,CLB32_LUT1_WE,CLB32_LUT2_WE,CLB32_LUT3_WE,CLB32_LUT4_WE,CLB32_LUT5_WE,CLB32_LUT6_WE,CLB32_LUT7_WE;
input CLB33_LUT0_WE,CLB33_LUT1_WE,CLB33_LUT2_WE,CLB33_LUT3_WE,CLB33_LUT4_WE,CLB33_LUT5_WE,CLB33_LUT6_WE,CLB33_LUT7_WE;

value carry_chain1(.in(0),.out(carry_in_10_1));  
value carry_chain2(.in(0),.out(carry_in_10_2));
value carry_chain3(.in(0),.out(carry_in_11_1));  
value carry_chain4(.in(0),.out(carry_in_11_2));

//carry chain wires

wire carry_chain_in_0,carry_chain_in_1,carry_chain_in_2,carry_chain_in_3;
wire carry_chain_out_0,carry_chain_out_1,carry_chain_out_2,carry_chain_out_3;

wire CLB10_carry_out,CLB20_carry_out,CLB30_carry_out,CLB11_carry_out,CLB21_carry_out,CLB31_carry_out;
wire CLB12_carry_out,CLB22_carry_out,CLB32_carry_out,CLB13_carry_out,CLB23_carry_out,CLB33_carry_out;

//CLB configuration signals
wire CLB00_prgm_b_out,CLB01_prgm_b_out,CLB02_prgm_b_out,CLB03_prgm_b_out;
wire CLB10_prgm_b_out,CLB11_prgm_b_out,CLB12_prgm_b_out,CLB13_prgm_b_out;
wire CLB20_prgm_b_out,CLB21_prgm_b_out,CLB22_prgm_b_out,CLB23_prgm_b_out;
wire CLB30_prgm_b_out,CLB31_prgm_b_out,CLB32_prgm_b_out,CLB33_prgm_b_out;


wire cb_prgm_b_out_00_0,cb_prgm_b_out_00_1,cb_prgm_b_out_00_2,cb_prgm_b_out_00_3;
wire cb_prgm_b_out_01_0,cb_prgm_b_out_01_1,cb_prgm_b_out_01_2,cb_prgm_b_out_01_3;
wire cb_prgm_b_out_10_0,cb_prgm_b_out_10_1,cb_prgm_b_out_10_2,cb_prgm_b_out_10_3;
wire cb_prgm_b_out_11_0,cb_prgm_b_out_11_1,cb_prgm_b_out_11_2,cb_prgm_b_out_11_3;


wire sb_prgm_b_out_SB00,sb_prgm_b_out_SB01,sb_prgm_b_out_SB02,
sb_prgm_b_out_SB10,sb_prgm_b_out_SB11,sb_prgm_b_out_SB12,
sb_prgm_b_out_SB20,sb_prgm_b_out_SB21,sb_prgm_b_out_SB22;

//wires between switch blocks

//West to East

wire SB00_SB01_0,SB00_SB01_1,SB00_SB01_2,SB00_SB01_3,SB00_SB01_4,SB00_SB01_5,SB00_SB01_6,SB00_SB01_7;
wire SB01_SB02_0,SB01_SB02_1,SB01_SB02_2,SB01_SB02_3,SB01_SB02_4,SB01_SB02_5,SB01_SB02_6,SB01_SB02_7;
wire SB02_SB03_0,SB02_SB03_1,SB02_SB03_2,SB02_SB03_3,SB02_SB03_4,SB02_SB03_5,SB02_SB03_6,SB02_SB03_7;
wire SB03_SB04_0,SB03_SB04_1,SB03_SB04_2,SB03_SB04_3,SB03_SB04_4,SB03_SB04_5,SB03_SB04_6,SB03_SB04_7;

wire SB10_SB11_0,SB10_SB11_1,SB10_SB11_2,SB10_SB11_3,SB10_SB11_4,SB10_SB11_5,SB10_SB11_6,SB10_SB11_7;
wire SB11_SB12_0,SB11_SB12_1,SB11_SB12_2,SB11_SB12_3,SB11_SB12_4,SB11_SB12_5,SB11_SB12_6,SB11_SB12_7;
wire SB12_SB13_0,SB12_SB13_1,SB12_SB13_2,SB12_SB13_3,SB12_SB13_4,SB12_SB13_5,SB12_SB13_6,SB12_SB13_7;
wire SB13_SB14_0,SB13_SB14_1,SB13_SB14_2,SB13_SB14_3,SB13_SB14_4,SB13_SB14_5,SB13_SB14_6,SB13_SB14_7;

wire SB20_SB21_0,SB20_SB21_1,SB20_SB21_2,SB20_SB21_3,SB20_SB21_4,SB20_SB21_5,SB20_SB21_6,SB20_SB21_7;
wire SB21_SB22_0,SB21_SB22_1,SB21_SB22_2,SB21_SB22_3,SB21_SB22_4,SB21_SB22_5,SB21_SB22_6,SB21_SB22_7;
wire SB22_SB23_0,SB22_SB23_1,SB22_SB23_2,SB22_SB23_3,SB22_SB23_4,SB22_SB23_5,SB22_SB23_6,SB22_SB23_7;
wire SB23_SB24_0,SB23_SB24_1,SB23_SB24_2,SB23_SB24_3,SB23_SB24_4,SB23_SB24_5,SB23_SB24_6,SB23_SB24_7;

wire SB30_SB31_0,SB30_SB31_1,SB30_SB31_2,SB30_SB31_3,SB30_SB31_4,SB30_SB31_5,SB30_SB31_6,SB30_SB31_7;
wire SB31_SB32_0,SB31_SB32_1,SB31_SB32_2,SB31_SB32_3,SB31_SB32_4,SB31_SB32_5,SB31_SB32_6,SB31_SB32_7;
wire SB32_SB33_0,SB32_SB33_1,SB32_SB33_2,SB32_SB33_3,SB32_SB33_4,SB32_SB33_5,SB32_SB33_6,SB32_SB33_7;
wire SB33_SB34_0,SB33_SB34_1,SB33_SB34_2,SB33_SB34_3,SB33_SB34_4,SB33_SB34_5,SB33_SB34_6,SB33_SB34_7;

wire SB40_SB41_0,SB40_SB41_1,SB40_SB41_2,SB40_SB41_3,SB40_SB41_4,SB40_SB41_5,SB40_SB41_6,SB40_SB41_7;
wire SB41_SB42_0,SB41_SB42_1,SB41_SB42_2,SB41_SB42_3,SB41_SB42_4,SB41_SB42_5,SB41_SB42_6,SB41_SB42_7;
wire SB42_SB43_0,SB42_SB43_1,SB42_SB43_2,SB42_SB43_3,SB42_SB43_4,SB42_SB43_5,SB42_SB43_6,SB42_SB43_7;
wire SB43_SB44_0,SB43_SB44_1,SB43_SB44_2,SB43_SB44_3,SB43_SB44_4,SB43_SB44_5,SB43_SB44_6,SB43_SB44_7;

//North to South
wire SB00_SB10_0,SB00_SB10_1,SB00_SB10_2,SB00_SB10_3,SB00_SB10_4,SB00_SB10_5,SB00_SB10_6,SB00_SB10_7;
wire SB01_SB11_0,SB01_SB11_1,SB01_SB11_2,SB01_SB11_3,SB01_SB11_4,SB01_SB11_5,SB01_SB11_6,SB01_SB11_7;
wire SB02_SB12_0,SB02_SB12_1,SB02_SB12_2,SB02_SB12_3,SB02_SB12_4,SB02_SB12_5,SB02_SB12_6,SB02_SB12_7;
wire SB03_SB13_0,SB03_SB13_1,SB03_SB13_2,SB03_SB13_3,SB03_SB13_4,SB03_SB13_5,SB03_SB13_6,SB03_SB13_7;
wire SB04_SB14_0,SB04_SB14_1,SB04_SB14_2,SB04_SB14_3,SB04_SB14_4,SB04_SB14_5,SB04_SB14_6,SB04_SB14_7;

wire SB10_SB20_0,SB10_SB20_1,SB10_SB20_2,SB10_SB20_3,SB10_SB20_4,SB10_SB20_5,SB10_SB20_6,SB10_SB20_7;
wire SB11_SB21_0,SB11_SB21_1,SB11_SB21_2,SB11_SB21_3,SB11_SB21_4,SB11_SB21_5,SB11_SB21_6,SB11_SB21_7;
wire SB12_SB22_0,SB12_SB22_1,SB12_SB22_2,SB12_SB22_3,SB12_SB22_4,SB12_SB22_5,SB12_SB22_6,SB12_SB22_7;
wire SB13_SB23_0,SB13_SB23_1,SB13_SB23_2,SB13_SB23_3,SB13_SB23_4,SB13_SB23_5,SB13_SB23_6,SB13_SB23_7;
wire SB14_SB24_0,SB14_SB24_1,SB14_SB24_2,SB14_SB24_3,SB14_SB24_4,SB14_SB24_5,SB14_SB24_6,SB14_SB24_7;

wire SB20_SB30_0,SB20_SB30_1,SB20_SB30_2,SB20_SB30_3,SB20_SB30_4,SB20_SB30_5,SB20_SB30_6,SB20_SB30_7;
wire SB21_SB31_0,SB21_SB31_1,SB21_SB31_2,SB21_SB31_3,SB21_SB31_4,SB21_SB31_5,SB21_SB31_6,SB21_SB31_7;
wire SB22_SB32_0,SB22_SB32_1,SB22_SB32_2,SB22_SB32_3,SB22_SB32_4,SB22_SB32_5,SB22_SB32_6,SB22_SB32_7;
wire SB23_SB33_0,SB23_SB33_1,SB23_SB33_2,SB23_SB33_3,SB23_SB33_4,SB23_SB33_5,SB23_SB33_6,SB23_SB33_7;
wire SB24_SB34_0,SB24_SB34_1,SB24_SB34_2,SB24_SB34_3,SB24_SB34_4,SB24_SB34_5,SB24_SB34_6,SB24_SB34_7;

wire SB30_SB40_0,SB30_SB40_1,SB30_SB40_2,SB30_SB40_3,SB30_SB40_4,SB30_SB40_5,SB30_SB40_6,SB30_SB40_7;
wire SB31_SB41_0,SB31_SB41_1,SB31_SB41_2,SB31_SB41_3,SB31_SB41_4,SB31_SB41_5,SB31_SB41_6,SB31_SB41_7;
wire SB32_SB42_0,SB32_SB42_1,SB32_SB42_2,SB32_SB42_3,SB32_SB42_4,SB32_SB42_5,SB32_SB42_6,SB32_SB42_7;
wire SB33_SB43_0,SB33_SB43_1,SB33_SB43_2,SB33_SB43_3,SB33_SB43_4,SB33_SB43_5,SB33_SB43_6,SB33_SB43_7;
wire SB34_SB44_0,SB34_SB44_1,SB34_SB44_2,SB34_SB44_3,SB34_SB44_4,SB34_SB44_5,SB34_SB44_6,SB34_SB44_7;

//

//IO block to SB wires

//North

wire IO00_SB00_0,IO00_SB00_1,IO00_SB00_2,IO00_SB00_3,IO00_SB00_4,IO00_SB00_5,IO00_SB00_6,IO00_SB00_7;
wire IO01_SB01_0,IO01_SB01_1,IO01_SB01_2,IO01_SB01_3,IO01_SB01_4,IO01_SB01_5,IO01_SB01_6,IO01_SB01_7;
wire IO02_SB02_0,IO02_SB02_1,IO02_SB02_2,IO02_SB02_3,IO02_SB02_4,IO02_SB02_5,IO02_SB02_6,IO02_SB02_7;
wire IO03_SB03_0,IO03_SB03_1,IO03_SB03_2,IO03_SB03_3,IO03_SB03_4,IO03_SB03_5,IO03_SB03_6,IO03_SB03_7;
wire IO04_SB04_0,IO04_SB04_1,IO04_SB04_2,IO04_SB04_3,IO04_SB04_4,IO04_SB04_5,IO04_SB04_6,IO04_SB04_7;

//South

wire IO60_SB40_0,IO60_SB40_1,IO60_SB40_2,IO60_SB40_3,IO60_SB40_4,IO60_SB40_5,IO60_SB40_6,IO60_SB40_7;
wire IO61_SB41_0,IO61_SB41_1,IO61_SB41_2,IO61_SB41_3,IO61_SB41_4,IO61_SB41_5,IO61_SB41_6,IO61_SB41_7;
wire IO62_SB42_0,IO62_SB42_1,IO62_SB42_2,IO62_SB42_3,IO62_SB42_4,IO62_SB42_5,IO62_SB42_6,IO62_SB42_7;
wire IO63_SB43_0,IO63_SB43_1,IO63_SB43_2,IO63_SB43_3,IO63_SB43_4,IO63_SB43_5,IO63_SB43_6,IO63_SB43_7;
wire IO64_SB44_0,IO64_SB44_1,IO64_SB44_2,IO64_SB44_3,IO64_SB44_4,IO64_SB44_5,IO64_SB44_6,IO64_SB44_7;


//West

wire IO10_SB00_0,IO10_SB00_1,IO10_SB00_2,IO10_SB00_3,IO10_SB00_4,IO10_SB00_5,IO10_SB00_6,IO10_SB00_7;
wire IO20_SB10_0,IO20_SB10_1,IO20_SB10_2,IO20_SB10_3,IO20_SB10_4,IO20_SB10_5,IO20_SB10_6,IO20_SB10_7;
wire IO30_SB20_0,IO30_SB20_1,IO30_SB20_2,IO30_SB20_3,IO30_SB20_4,IO30_SB20_5,IO30_SB20_6,IO30_SB20_7;
wire IO40_SB30_0,IO40_SB30_1,IO40_SB30_2,IO40_SB30_3,IO40_SB30_4,IO40_SB30_5,IO40_SB30_6,IO40_SB30_7;
wire IO50_SB40_0,IO50_SB40_1,IO50_SB40_2,IO50_SB40_3,IO50_SB40_4,IO50_SB40_5,IO50_SB40_6,IO50_SB40_7;

//East

wire IO11_SB04_0,IO11_SB04_1,IO11_SB04_2,IO11_SB04_3,IO11_SB04_4,IO11_SB04_5,IO11_SB04_6,IO11_SB04_7;
wire IO21_SB14_0,IO21_SB14_1,IO21_SB14_2,IO21_SB14_3,IO21_SB14_4,IO21_SB14_5,IO21_SB14_6,IO21_SB14_7;
wire IO31_SB24_0,IO31_SB24_1,IO31_SB24_2,IO31_SB24_3,IO31_SB24_4,IO31_SB24_5,IO31_SB24_6,IO31_SB24_7;
wire IO41_SB34_0,IO41_SB34_1,IO41_SB34_2,IO41_SB34_3,IO41_SB34_4,IO41_SB34_5,IO41_SB34_6,IO41_SB34_7;
wire IO51_SB44_0,IO51_SB44_1,IO51_SB44_2,IO51_SB44_3,IO51_SB44_4,IO51_SB44_5,IO51_SB44_6,IO51_SB44_7;

wire io_prgm_b_out_00,io_prgm_b_out_01,io_prgm_b_out_02,io_prgm_b_out_03,io_prgm_b_out_04;
wire io_prgm_b_out_10,io_prgm_b_out_11,io_prgm_b_out_20,io_prgm_b_out_21;
wire io_prgm_b_out_30,io_prgm_b_out_31,io_prgm_b_out_40,io_prgm_b_out_41,io_prgm_b_out_50,io_prgm_b_out_51;
wire io_prgm_b_out_60,io_prgm_b_out_61,io_prgm_b_out_62,io_prgm_b_out_63;



//IO BLOCKS
IO_block IO00(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_in),.io_prgm_b_out(io_prgm_b_out_00),
	.G0(V00_0),.G1(V00_1),.G2(V00_2),.G3(V00_3),.G4(V00_4),.G5(V00_5),.G6(V00_6),.G7(V00_0),
	.S0(IO00_SB00_0),.S1(IO00_SB00_1),.S2(IO00_SB00_2),.S3(IO00_SB00_3),.S4(IO00_SB00_4),.S5(IO00_SB00_5),.S6(IO00_SB00_6),.S7(IO00_SB00_7));

IO_block IO01(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_00),.io_prgm_b_out(io_prgm_b_out_01),
	.G0(V01_0),.G1(V01_1),.G2(V01_2),.G3(V01_3),.G4(V01_4),.G5(V01_5),.G6(V01_6),.G7(V01_0),
	.S0(IO01_SB01_0),.S1(IO01_SB01_1),.S2(IO01_SB01_2),.S3(IO01_SB01_3),.S4(IO01_SB01_4),.S5(IO01_SB01_5),.S6(IO01_SB01_6),.S7(IO01_SB01_7));

IO_block IO02(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_01),.io_prgm_b_out(io_prgm_b_out_02),
	.G0(V02_0),.G1(V02_1),.G2(V02_2),.G3(V02_3),.G4(V02_4),.G5(V02_5),.G6(V02_6),.G7(V02_0),
	.S0(IO02_SB02_0),.S1(IO02_SB02_1),.S2(IO02_SB02_2),.S3(IO02_SB02_3),.S4(IO02_SB02_4),.S5(IO02_SB02_5),.S6(IO02_SB02_6),.S7(IO02_SB02_7));

IO_block IO03(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_02),.io_prgm_b_out(io_prgm_b_out_03),
	.G0(V03_0),.G1(V03_1),.G2(V03_2),.G3(V03_3),.G4(V03_4),.G5(V03_5),.G6(V03_6),.G7(V03_0),
	.S0(IO03_SB03_0),.S1(IO03_SB03_1),.S2(IO03_SB03_2),.S3(IO03_SB03_3),.S4(IO03_SB03_4),.S5(IO03_SB03_5),.S6(IO03_SB03_6),.S7(IO03_SB03_7));

IO_block IO04(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_03),.io_prgm_b_out(io_prgm_b_out_04),
	.G0(V04_0),.G1(V04_1),.G2(V04_2),.G3(V04_3),.G4(V04_4),.G5(V04_5),.G6(V04_6),.G7(V04_0),
	.S0(IO04_SB04_0),.S1(IO04_SB04_1),.S2(IO04_SB04_2),.S3(IO04_SB04_3),.S4(IO04_SB04_4),.S5(IO04_SB04_5),.S6(IO04_SB04_6),.S7(IO04_SB04_7));

IO_block IO05(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_04),.io_prgm_b_out(io_prgm_b_out_05),
	.G0(V05_0),.G1(V05_1),.G2(V05_2),.G3(V05_3),.G4(V05_4),.G5(V05_5),.G6(V05_6),.G7(V05_0),
	.S0(IO05_SB05_0),.S1(IO05_SB05_1),.S2(IO05_SB05_2),.S3(IO05_SB05_3),.S4(IO05_SB05_4),.S5(IO05_SB05_5),.S6(IO05_SB05_6),.S7(IO05_SB05_7));



IO_block IO10(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_05),.io_prgm_b_out(io_prgm_b_out_10),
	.G0(H10_0),.G1(H10_1),.G2(H10_2),.G3(H10_3),.G4(H10_4),.G5(H10_5),.G6(H10_6),.G7(H10_0),
	.S0(IO10_SB00_0),.S1(IO10_SB00_1),.S2(IO10_SB00_2),.S3(IO10_SB00_3),.S4(IO10_SB00_4),.S5(IO10_SB00_5),.S6(IO10_SB00_6),.S7(IO10_SB00_7));

IO_block IO11(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_10),.io_prgm_b_out(io_prgm_b_out_11),
	.G0(H11_0),.G1(H11_1),.G2(H11_2),.G3(H11_3),.G4(H11_4),.G5(H11_5),.G6(H11_6),.G7(H11_0),
	.S0(IO11_SB04_0),.S1(IO11_SB04_1),.S2(IO11_SB04_2),.S3(IO11_SB04_3),.S4(IO11_SB04_4),.S5(IO11_SB04_5),.S6(IO11_SB04_6),.S7(IO11_SB04_7));


IO_block IO20(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_11),.io_prgm_b_out(io_prgm_b_out_20),
	.G0(H20_0),.G1(H20_1),.G2(H20_2),.G3(H20_3),.G4(H20_4),.G5(H20_5),.G6(H20_6),.G7(H20_7),
	.S0(IO20_SB10_0),.S1(IO20_SB10_1),.S2(IO20_SB10_2),.S3(IO20_SB10_3),.S4(IO20_SB10_4),.S5(IO20_SB10_5),.S6(IO20_SB10_6),.S7(IO20_SB10_7));

IO_block IO21(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_20),.io_prgm_b_out(io_prgm_b_out_21),
	.G0(H21_0),.G1(H21_1),.G2(H21_2),.G3(H21_3),.G4(H21_4),.G5(H21_5),.G6(H21_6),.G7(H21_0),
	.S0(IO21_SB14_0),.S1(IO21_SB14_1),.S2(IO21_SB14_2),.S3(IO21_SB14_3),.S4(IO21_SB14_4),.S5(IO21_SB14_5),.S6(IO21_SB14_6),.S7(IO21_SB14_7));



IO_block IO30(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_21),.io_prgm_b_out(io_prgm_b_out_30),
	.G0(H30_0),.G1(H30_1),.G2(H30_2),.G3(H30_3),.G4(H30_4),.G5(H30_5),.G6(H30_6),.G7(H30_0),
	.S0(IO30_SB20_0),.S1(IO30_SB20_1),.S2(IO30_SB20_2),.S3(IO30_SB20_3),.S4(IO30_SB20_4),.S5(IO30_SB20_5),.S6(IO30_SB20_6),.S7(IO30_SB20_7));

IO_block IO31(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_30),.io_prgm_b_out(io_prgm_b_out_31),
	.G0(H31_0),.G1(H31_1),.G2(H31_2),.G3(H31_3),.G4(H31_4),.G5(H31_5),.G6(H31_6),.G7(H31_0),
	.S0(IO31_SB24_0),.S1(IO31_SB24_1),.S2(IO31_SB24_2),.S3(IO31_SB24_3),.S4(IO31_SB24_4),.S5(IO31_SB24_5),.S6(IO31_SB24_6),.S7(IO31_SB24_7));


IO_block IO40(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_31),.io_prgm_b_out(io_prgm_b_out_40),
	.G0(H40_0),.G1(H40_1),.G2(H40_2),.G3(H40_3),.G4(H40_4),.G5(H40_5),.G6(H40_6),.G7(H40_7),
	.S0(IO40_SB30_0),.S1(IO40_SB30_1),.S2(IO40_SB30_2),.S3(IO40_SB30_3),.S4(IO40_SB30_4),.S5(IO40_SB30_5),.S6(IO40_SB30_6),.S7(IO40_SB30_7));

IO_block IO41(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_40),.io_prgm_b_out(io_prgm_b_out_41),
	.G0(H41_0),.G1(H41_1),.G2(H41_2),.G3(H41_3),.G4(H41_4),.G5(H41_5),.G6(H41_6),.G7(H41_7),
	.S0(IO41_SB34_0),.S1(IO41_SB34_1),.S2(IO41_SB34_2),.S3(IO41_SB34_3),.S4(IO41_SB34_4),.S5(IO41_SB34_5),.S6(IO41_SB34_6),.S7(IO41_SB34_7));


IO_block IO50(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_41),.io_prgm_b_out(io_prgm_b_out_50),
	.G0(H50_0),.G1(H50_1),.G2(H50_2),.G3(H50_3),.G4(H50_4),.G5(H50_5),.G6(H50_6),.G7(H50_7),
	.S0(IO50_SB40_0),.S1(IO50_SB40_1),.S2(IO50_SB40_2),.S3(IO50_SB40_3),.S4(IO50_SB40_4),.S5(IO50_SB40_5),.S6(IO50_SB40_6),.S7(IO50_SB40_7));

IO_block IO51(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_50),.io_prgm_b_out(io_prgm_b_out_51),
	.G0(H51_0),.G1(H51_1),.G2(H51_2),.G3(H51_3),.G4(H51_4),.G5(H51_5),.G6(H51_6),.G7(H51_7),
	.S0(IO51_SB44_0),.S1(IO51_SB44_1),.S2(IO51_SB44_2),.S3(IO51_SB44_3),.S4(IO51_SB44_4),.S5(IO51_SB44_5),.S6(IO51_SB44_6),.S7(IO51_SB44_7));



IO_block IO60(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_51),.io_prgm_b_out(io_prgm_b_out_60),
	.G0(V60_0),.G1(V60_1),.G2(V60_2),.G3(V60_3),.G4(V60_4),.G5(V60_5),.G6(V60_6),.G7(V60_0),
	.S0(IO60_SB40_0),.S1(IO60_SB40_1),.S2(IO60_SB40_2),.S3(IO60_SB40_3),.S4(IO60_SB40_4),.S5(IO60_SB40_5),.S6(IO60_SB40_6),.S7(IO60_SB40_7));

IO_block IO61(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_60),.io_prgm_b_out(io_prgm_b_out_61),
	.G0(V61_0),.G1(V61_1),.G2(V61_2),.G3(V61_3),.G4(V61_4),.G5(V61_5),.G6(V61_6),.G7(V61_0),
	.S0(IO61_SB41_0),.S1(IO61_SB41_1),.S2(IO61_SB41_2),.S3(IO61_SB41_3),.S4(IO61_SB41_4),.S5(IO61_SB41_5),.S6(IO61_SB41_6),.S7(IO61_SB41_7));

IO_block IO62(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_61),.io_prgm_b_out(io_prgm_b_out_62),
	.G0(V62_0),.G1(V62_1),.G2(V62_2),.G3(V62_3),.G4(V62_4),.G5(V62_5),.G6(V62_6),.G7(V62_0),
	.S0(IO62_SB42_0),.S1(IO62_SB42_1),.S2(IO62_SB42_2),.S3(IO62_SB42_3),.S4(IO62_SB42_4),.S5(IO62_SB42_5),.S6(IO62_SB42_6),.S7(IO62_SB42_7));

IO_block IO63(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_62),.io_prgm_b_out(io_prgm_b_out_63),
	.G0(V63_0),.G1(V63_1),.G2(V63_2),.G3(V63_3),.G4(V63_4),.G5(V63_5),.G6(V63_6),.G7(V63_0),
	.S0(IO63_SB43_0),.S1(IO63_SB43_1),.S2(IO63_SB43_2),.S3(IO63_SB43_3),.S4(IO63_SB43_4),.S5(IO63_SB43_5),.S6(IO63_SB43_6),.S7(IO63_SB43_7));

IO_block IO64(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_63),.io_prgm_b_out(io_prgm_b_out),
	.G0(V64_0),.G1(V64_1),.G2(V64_2),.G3(V64_3),.G4(V64_4),.G5(V64_5),.G6(V64_6),.G7(V64_0),
	.S0(IO64_SB44_0),.S1(IO64_SB44_1),.S2(IO64_SB44_2),.S3(IO64_SB44_3),.S4(IO64_SB44_4),.S5(IO64_SB44_5),.S6(IO64_SB44_6),.S7(IO64_SB44_7));
//

//Connection Blocks

wire CB00_N_prgm_b_out,CB00_E_prgm_b_out,CB00_S_prgm_b_out,CB00_W_prgm_b_out;
wire CB01_N_prgm_b_out,CB01_E_prgm_b_out,CB01_S_prgm_b_out,CB01_W_prgm_b_out;
wire CB02_N_prgm_b_out,CB02_E_prgm_b_out,CB02_S_prgm_b_out,CB02_W_prgm_b_out;
wire CB03_N_prgm_b_out,CB03_E_prgm_b_out,CB03_S_prgm_b_out,CB03_W_prgm_b_out;

wire CB10_N_prgm_b_out,CB10_E_prgm_b_out,CB10_S_prgm_b_out,CB10_W_prgm_b_out;
wire CB11_N_prgm_b_out,CB11_E_prgm_b_out,CB11_S_prgm_b_out,CB11_W_prgm_b_out;
wire CB12_N_prgm_b_out,CB12_E_prgm_b_out,CB12_S_prgm_b_out,CB12_W_prgm_b_out;
wire CB13_N_prgm_b_out,CB13_E_prgm_b_out,CB13_S_prgm_b_out,CB13_W_prgm_b_out;

wire CB20_N_prgm_b_out,CB20_E_prgm_b_out,CB20_S_prgm_b_out,CB20_W_prgm_b_out;
wire CB21_N_prgm_b_out,CB21_E_prgm_b_out,CB21_S_prgm_b_out,CB21_W_prgm_b_out;
wire CB22_N_prgm_b_out,CB22_E_prgm_b_out,CB22_S_prgm_b_out,CB22_W_prgm_b_out;
wire CB23_N_prgm_b_out,CB23_E_prgm_b_out,CB23_S_prgm_b_out,CB23_W_prgm_b_out;

wire CB30_N_prgm_b_out,CB30_E_prgm_b_out,CB30_S_prgm_b_out,CB30_W_prgm_b_out;
wire CB31_N_prgm_b_out,CB31_E_prgm_b_out,CB31_S_prgm_b_out,CB31_W_prgm_b_out;
wire CB32_N_prgm_b_out,CB32_E_prgm_b_out,CB32_S_prgm_b_out,CB32_W_prgm_b_out;
wire CB33_N_prgm_b_out,CB33_E_prgm_b_out,CB33_S_prgm_b_out;


//CLB00
 CB CB00_N(.x1(CLB00_I12),.x2(CLB00_I13),.x3(CLB00_I14),.x4(CLB00_I15),.q1(CLB00_Q6),.q2(CLB00_Q7),.Rq1(CLB00_RQ6),.Rq2(CLB00_RQ7),.Cy1(CLB00_CYO6),.Cy2(CLB00_CYO7),
 	.G0(SB00_SB01_0),.G1(SB00_SB01_1),.G2(SB00_SB01_2),.G3(SB00_SB01_3),.G4(SB00_SB01_4),.G5(SB00_SB01_5),.G6(SB00_SB01_6),.G7(SB00_SB01_7),
 	.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB00_N_prgm_b_out),.cb_prgm_b_in(cb_prgm_b_in));

CB CB00_E(.x1(CLB00_I4),.x2(CLB00_I5),.x3(CLB00_I6),.x4(CLB00_I7),.q1(CLB00_Q2),.q2(CLB00_Q3),.Rq1(CLB00_RQ2),.Rq2(CLB00_RQ3),.Cy1(CLB00_CYO2),.Cy2(CLB00_CYO3),
   .G0(SB01_SB11_0),.G1(SB01_SB11_1),.G2(SB01_SB11_2),.G3(SB01_SB11_3),.G4(SB01_SB11_4),.G5(SB01_SB11_5),.G6(SB01_SB11_6),.G7(SB01_SB11_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB00_E_prgm_b_out),.cb_prgm_b_in(CB00_N_prgm_b_out));

CB CB00_S(.x1(CLB00_I8),.x2(CLB00_I9),.x3(CLB00_I10),.x4(CLB00_I11),.q1(CLB00_Q4),.q2(CLB00_Q5),.Rq1(CLB00_RQ4),.Rq2(CLB00_RQ5),.Cy1(CLB00_CYO4),.Cy2(CLB00_CYO5),
   .G0(SB10_SB11_0),.G1(SB10_SB11_1),.G2(SB10_SB11_2),.G3(SB10_SB11_3),.G4(SB10_SB11_4),.G5(SB10_SB11_5),.G6(SB10_SB11_6),.G7(SB10_SB11_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB00_S_prgm_b_out),.cb_prgm_b_in(CB00_E_prgm_b_out));

CB CB00_W(.x1(CLB00_I0),.x2(CLB00_I1),.x3(CLB00_I2),.x4(CLB00_I3),.q1(CLB00_Q0),.q2(CLB00_Q1),.Rq1(CLB00_RQ0),.Rq2(CLB00_RQ1),.Cy1(CLB00_CYO0),.Cy2(CLB00_CYO1),
   .G0(SB00_SB10_0),.G1(SB00_SB10_1),.G2(SB00_SB10_2),.G3(SB00_SB10_3),.G4(SB00_SB10_4),.G5(SB00_SB10_5),.G6(SB00_SB10_6),.G7(SB00_SB10_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB00_W_prgm_b_out),.cb_prgm_b_in(CB00_S_prgm_b_out));

//CLB01
 CB CB01_N(.x1(CLB01_I12),.x2(CLB01_I13),.x3(CLB01_I14),.x4(CLB01_I15),.q1(CLB01_Q6),.q2(CLB01_Q7),.Rq1(CLB01_RQ6),.Rq2(CLB01_RQ7),.Cy1(CLB01_CYO6),.Cy2(CLB01_CYO7),
 	.G0(SB01_SB02_0),.G1(SB01_SB02_1),.G2(SB01_SB02_2),.G3(SB01_SB02_3),.G4(SB01_SB02_4),.G5(SB01_SB02_5),.G6(SB01_SB02_6),.G7(SB01_SB02_7),
 	.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB01_N_prgm_b_out),.cb_prgm_b_in(CB00_W_prgm_b_out));

CB CB01_E(.x1(CLB01_I4),.x2(CLB01_I5),.x3(CLB01_I6),.x4(CLB01_I7),.q1(CLB01_Q2),.q2(CLB01_Q3),.Rq1(CLB01_RQ2),.Rq2(CLB01_RQ3),.Cy1(CLB01_CYO2),.Cy2(CLB01_CYO3),
   .G0(SB02_SB12_0),.G1(SB02_SB12_1),.G2(SB02_SB12_2),.G3(SB02_SB12_3),.G4(SB02_SB12_4),.G5(SB02_SB12_5),.G6(SB02_SB12_6),.G7(SB02_SB12_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB01_E_prgm_b_out),.cb_prgm_b_in(CB01_N_prgm_b_out));

CB CB01_S(.x1(CLB01_I8),.x2(CLB01_I9),.x3(CLB01_I10),.x4(CLB01_I11),.q1(CLB01_Q4),.q2(CLB01_Q5),.Rq1(CLB01_RQ4),.Rq2(CLB01_RQ5),.Cy1(CLB01_CYO4),.Cy2(CLB01_CYO5),
   .G0(SB11_SB12_0),.G1(SB11_SB12_1),.G2(SB11_SB12_2),.G3(SB11_SB12_3),.G4(SB11_SB12_4),.G5(SB11_SB12_5),.G6(SB11_SB12_6),.G7(SB11_SB12_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB01_S_prgm_b_out),.cb_prgm_b_in(CB01_E_prgm_b_out));

CB CB01_W(.x1(CLB01_I0),.x2(CLB01_I1),.x3(CLB01_I2),.x4(CLB01_I3),.q1(CLB01_Q0),.q2(CLB01_Q1),.Rq1(CLB01_RQ0),.Rq2(CLB01_RQ1),.Cy1(CLB01_CYO0),.Cy2(CLB01_CYO1),
   .G0(SB01_SB11_0),.G1(SB01_SB11_1),.G2(SB01_SB11_2),.G3(SB01_SB11_3),.G4(SB01_SB11_4),.G5(SB01_SB11_5),.G6(SB01_SB11_6),.G7(SB01_SB11_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB01_W_prgm_b_out),.cb_prgm_b_in(CB01_S_prgm_b_out));


//CLB02
CB CB02_N(.x1(CLB02_I12),.x2(CLB02_I13),.x3(CLB02_I14),.x4(CLB02_I15),.q1(CLB02_Q6),.q2(CLB02_Q7),.Rq1(CLB03_CY6),.Rq2(CLB03_CY7),.Cy1(CLB02_CYO6),.Cy2(CLB02_CYO7),
 	.G0(SB02_SB03_0),.G1(SB02_SB03_1),.G2(SB02_SB03_2),.G3(SB02_SB03_3),.G4(SB02_SB03_4),.G5(SB02_SB03_5),.G6(SB02_SB03_6),.G7(SB02_SB03_7),
 	.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB02_N_prgm_b_out),.cb_prgm_b_in(CB01_W_prgm_b_out));

CB CB02_E(.x1(CLB02_I4),.x2(CLB02_I5),.x3(CLB02_I6),.x4(CLB02_I7),.q1(CLB02_Q2),.q2(CLB02_Q3),.Rq1(CLB03_CY2),.Rq2(CLB03_CY3),.Cy1(CLB02_CYO2),.Cy2(CLB02_CYO3),
   .G0(SB03_SB13_0),.G1(SB03_SB13_1),.G2(SB03_SB13_2),.G3(SB03_SB13_3),.G4(SB03_SB13_4),.G5(SB03_SB13_5),.G6(SB03_SB13_6),.G7(SB03_SB13_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB02_E_prgm_b_out),.cb_prgm_b_in(CB02_N_prgm_b_out));

CB CB02_S(.x1(CLB02_I8),.x2(CLB02_I9),.x3(CLB02_I10),.x4(CLB02_I11),.q1(CLB02_Q4),.q2(CLB02_Q5),.Rq1(CLB03_CY4),.Rq2(CLB03_CY5),.Cy1(CLB02_CYO4),.Cy2(CLB02_CYO5),
   .G0(SB12_SB13_0),.G1(SB12_SB13_1),.G2(SB12_SB13_2),.G3(SB12_SB13_3),.G4(SB12_SB13_4),.G5(SB12_SB13_5),.G6(SB12_SB13_6),.G7(SB12_SB13_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB02_S_prgm_b_out),.cb_prgm_b_in(CB02_E_prgm_b_out));

CB CB02_W(.x1(CLB02_I0),.x2(CLB02_I1),.x3(CLB02_I2),.x4(CLB02_I3),.q1(CLB02_Q0),.q2(CLB02_Q1),.Rq1(CLB03_CY0),.Rq2(CLB03_CY1),.Cy1(CLB02_CYO0),.Cy2(CLB02_CYO1),
   .G0(SB02_SB12_0),.G1(SB02_SB12_1),.G2(SB02_SB12_2),.G3(SB02_SB12_3),.G4(SB02_SB12_4),.G5(SB02_SB12_5),.G6(SB02_SB12_6),.G7(SB02_SB12_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB02_W_prgm_b_out),.cb_prgm_b_in(CB02_S_prgm_b_out));

//CLB03

CB CB03_N(.x1(CLB03_I12),.x2(CLB03_I13),.x3(CLB03_I14),.x4(CLB03_I15),.q1(CLB03_Q6),.q2(CLB03_Q7),.Rq1(CLB03_RQ6),.Rq2(CLB03_RQ7),.Cy1(CLB03_CYO6),.Cy2(CLB03_CYO7),
 	.G0(SB03_SB04_0),.G1(SB03_SB04_1),.G2(SB03_SB04_2),.G3(SB03_SB04_3),.G4(SB03_SB04_4),.G5(SB03_SB04_5),.G6(SB03_SB04_6),.G7(SB03_SB04_7),
 	.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB03_N_prgm_b_out),.cb_prgm_b_in(CB02_W_prgm_b_out));

CB CB03_E(.x1(CLB03_I4),.x2(CLB03_I5),.x3(CLB03_I6),.x4(CLB03_I7),.q1(CLB03_Q2),.q2(CLB03_Q3),.Rq1(CLB03_RQ2),.Rq2(CLB03_RQ3),.Cy1(CLB03_CYO2),.Cy2(CLB03_CYO3),
   .G0(SB04_SB14_0),.G1(SB04_SB14_1),.G2(SB04_SB14_2),.G3(SB04_SB14_3),.G4(SB04_SB14_4),.G5(SB04_SB14_5),.G6(SB04_SB14_6),.G7(SB04_SB14_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB03_E_prgm_b_out),.cb_prgm_b_in(CB03_N_prgm_b_out));

CB CB03_S(.x1(CLB03_I8),.x2(CLB03_I9),.x3(CLB03_I10),.x4(CLB03_I11),.q1(CLB03_Q4),.q2(CLB03_Q5),.Rq1(CLB03_RQ4),.Rq2(CLB03_RQ5),.Cy1(CLB03_CYO4),.Cy2(CLB03_CYO5),
   .G0(SB13_SB14_0),.G1(SB13_SB14_1),.G2(SB13_SB14_2),.G3(SB13_SB14_3),.G4(SB13_SB14_4),.G5(SB13_SB14_5),.G6(SB13_SB14_6),.G7(SB13_SB14_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB03_S_prgm_b_out),.cb_prgm_b_in(CB03_E_prgm_b_out));

CB CB03_W(.x1(CLB03_I0),.x2(CLB03_I1),.x3(CLB03_I2),.x4(CLB03_I3),.q1(CLB03_Q0),.q2(CLB03_Q1),.Rq1(CLB03_RQ0),.Rq2(CLB03_RQ1),.Cy1(CLB03_CYO0),.Cy2(CLB03_CYO1),
   .G0(SB03_SB13_0),.G1(SB03_SB13_1),.G2(SB03_SB13_2),.G3(SB03_SB13_3),.G4(SB03_SB13_4),.G5(SB03_SB13_5),.G6(SB03_SB13_6),.G7(SB03_SB13_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB03_W_prgm_b_out),.cb_prgm_b_in(CB03_S_prgm_b_out));

//CLB10

CB CB10_N(.x1(CLB10_I12),.x2(CLB10_I13),.x3(CLB10_I14),.x4(CLB10_I15),.q1(CLB10_Q6),.q2(CLB10_Q7),.Rq1(CLB10_RQ6),.Rq2(CLB10_RQ7),.Cy1(CLB10_CYO6),.Cy2(CLB10_CYO7),
 	.G0(SB10_SB11_0),.G1(SB10_SB11_1),.G2(SB10_SB11_2),.G3(SB10_SB11_3),.G4(SB10_SB11_4),.G5(SB10_SB11_5),.G6(SB10_SB11_6),.G7(SB10_SB11_7),
 	.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB10_N_prgm_b_out),.cb_prgm_b_in(CB03_W_prgm_b_out));

CB CB10_E(.x1(CLB10_I4),.x2(CLB10_I5),.x3(CLB10_I6),.x4(CLB10_I7),.q1(CLB10_Q2),.q2(CLB10_Q3),.Rq1(CLB10_RQ2),.Rq2(CLB10_RQ3),.Cy1(CLB10_CYO2),.Cy2(CLB10_CYO3),
   .G0(SB11_SB21_0),.G1(SB11_SB21_1),.G2(SB11_SB21_2),.G3(SB11_SB21_3),.G4(SB11_SB21_4),.G5(SB11_SB21_5),.G6(SB11_SB21_6),.G7(SB11_SB21_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB10_E_prgm_b_out),.cb_prgm_b_in(CB10_N_prgm_b_out));

CB CB10_S(.x1(CLB10_I8),.x2(CLB10_I9),.x3(CLB10_I10),.x4(CLB10_I11),.q1(CLB10_Q4),.q2(CLB10_Q5),.Rq1(CLB10_RQ4),.Rq2(CLB10_RQ5),.Cy1(CLB10_CYO4),.Cy2(CLB10_CYO5),
   .G0(SB20_SB21_0),.G1(SB20_SB21_1),.G2(SB20_SB21_2),.G3(SB20_SB21_3),.G4(SB20_SB21_4),.G5(SB20_SB21_5),.G6(SB20_SB21_6),.G7(SB20_SB21_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB10_S_prgm_b_out),.cb_prgm_b_in(CB10_E_prgm_b_out));

CB CB10_W(.x1(CLB10_I0),.x2(CLB10_I1),.x3(CLB10_I2),.x4(CLB10_I3),.q1(CLB10_Q0),.q2(CLB10_Q1),.Rq1(CLB10_RQ0),.Rq2(CLB10_RQ1),.Cy1(CLB10_CYO0),.Cy2(CLB10_CYO1),
   .G0(SB10_SB20_0),.G1(SB10_SB20_1),.G2(SB10_SB20_2),.G3(SB10_SB20_3),.G4(SB10_SB20_4),.G5(SB10_SB20_5),.G6(SB10_SB20_6),.G7(SB10_SB20_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB10_W_prgm_b_out),.cb_prgm_b_in(CB10_S_prgm_b_out));

//CLB11

CB CB11_N(.x1(CLB11_I12),.x2(CLB11_I13),.x3(CLB11_I14),.x4(CLB11_I15),.q1(CLB11_Q6),.q2(CLB11_Q7),.Rq1(CLB11_RQ6),.Rq2(CLB11_RQ7),.Cy1(CLB11_CYO6),.Cy2(CLB11_CYO7),
 	.G0(SB11_SB12_0),.G1(SB11_SB12_1),.G2(SB11_SB12_2),.G3(SB11_SB12_3),.G4(SB11_SB12_4),.G5(SB11_SB12_5),.G6(SB11_SB12_6),.G7(SB11_SB12_7),
 	.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB11_N_prgm_b_out),.cb_prgm_b_in(CB10_W_prgm_b_out));

CB CB11_E(.x1(CLB11_I4),.x2(CLB11_I5),.x3(CLB11_I6),.x4(CLB11_I7),.q1(CLB11_Q2),.q2(CLB11_Q3),.Rq1(CLB11_RQ2),.Rq2(CLB11_RQ3),.Cy1(CLB11_CYO2),.Cy2(CLB11_CYO3),
   .G0(SB12_SB22_0),.G1(SB12_SB22_1),.G2(SB12_SB22_2),.G3(SB12_SB22_3),.G4(SB12_SB22_4),.G5(SB12_SB22_5),.G6(SB12_SB22_6),.G7(SB12_SB22_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB11_E_prgm_b_out),.cb_prgm_b_in(CB11_N_prgm_b_out));

CB CB11_S(.x1(CLB11_I8),.x2(CLB11_I9),.x3(CLB11_I10),.x4(CLB11_I11),.q1(CLB11_Q4),.q2(CLB11_Q5),.Rq1(CLB11_RQ4),.Rq2(CLB11_RQ5),.Cy1(CLB11_CYO4),.Cy2(CLB11_CYO5),
   .G0(SB21_SB22_0),.G1(SB21_SB22_1),.G2(SB21_SB22_2),.G3(SB21_SB22_3),.G4(SB21_SB22_4),.G5(SB21_SB22_5),.G6(SB21_SB22_6),.G7(SB21_SB22_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB11_S_prgm_b_out),.cb_prgm_b_in(CB11_E_prgm_b_out));

CB CB11_W(.x1(CLB11_I0),.x2(CLB11_I1),.x3(CLB11_I2),.x4(CLB11_I3),.q1(CLB11_Q0),.q2(CLB11_Q1),.Rq1(CLB11_RQ0),.Rq2(CLB11_RQ1),.Cy1(CLB11_CYO0),.Cy2(CLB11_CYO1),
   .G0(SB11_SB21_0),.G1(SB11_SB21_1),.G2(SB11_SB21_2),.G3(SB11_SB21_3),.G4(SB11_SB21_4),.G5(SB11_SB21_5),.G6(SB11_SB21_6),.G7(SB11_SB21_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB11_W_prgm_b_out),.cb_prgm_b_in(CB11_S_prgm_b_out));

//CLB12

CB CB12_N(.x1(CLB12_I12),.x2(CLB12_I13),.x3(CLB12_I14),.x4(CLB12_I15),.q1(CLB12_Q6),.q2(CLB12_Q7),.Rq1(CLB12_RQ6),.Rq2(CLB12_RQ7),.Cy1(CLB12_CYO6),.Cy2(CLB12_CYO7),
 	.G0(SB12_SB13_0),.G1(SB12_SB13_1),.G2(SB12_SB13_2),.G3(SB12_SB13_3),.G4(SB12_SB13_4),.G5(SB12_SB13_5),.G6(SB12_SB13_6),.G7(SB12_SB13_7),
 	.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB12_N_prgm_b_out),.cb_prgm_b_in(CB11_W_prgm_b_out));

CB CB12_E(.x1(CLB12_I4),.x2(CLB12_I5),.x3(CLB12_I6),.x4(CLB12_I7),.q1(CLB12_Q2),.q2(CLB12_Q3),.Rq1(CLB12_RQ2),.Rq2(CLB12_RQ3),.Cy1(CLB12_CYO2),.Cy2(CLB12_CYO3),
   .G0(SB13_SB23_0),.G1(SB13_SB23_1),.G2(SB13_SB23_2),.G3(SB13_SB23_3),.G4(SB13_SB23_4),.G5(SB13_SB23_5),.G6(SB13_SB23_6),.G7(SB13_SB23_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB12_E_prgm_b_out),.cb_prgm_b_in(CB12_N_prgm_b_out));

CB CB12_S(.x1(CLB12_I8),.x2(CLB12_I9),.x3(CLB12_I10),.x4(CLB12_I11),.q1(CLB12_Q4),.q2(CLB12_Q5),.Rq1(CLB12_RQ4),.Rq2(CLB12_RQ5),.Cy1(CLB12_CYO4),.Cy2(CLB12_CYO5),
   .G0(SB22_SB23_0),.G1(SB22_SB23_1),.G2(SB22_SB23_2),.G3(SB22_SB23_3),.G4(SB22_SB23_4),.G5(SB22_SB23_5),.G6(SB22_SB23_6),.G7(SB22_SB23_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB12_S_prgm_b_out),.cb_prgm_b_in(CB12_E_prgm_b_out));

CB CB12_W(.x1(CLB12_I0),.x2(CLB12_I1),.x3(CLB12_I2),.x4(CLB12_I3),.q1(CLB12_Q0),.q2(CLB12_Q1),.Rq1(CLB12_RQ0),.Rq2(CLB12_RQ1),.Cy1(CLB12_CYO0),.Cy2(CLB12_CYO1),
   .G0(SB12_SB22_0),.G1(SB12_SB22_1),.G2(SB12_SB22_2),.G3(SB12_SB22_3),.G4(SB12_SB22_4),.G5(SB12_SB22_5),.G6(SB12_SB22_6),.G7(SB12_SB22_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB12_W_prgm_b_out),.cb_prgm_b_in(CB12_S_prgm_b_out));

//CLB13

CB CB13_N(.x1(CLB13_I12),.x2(CLB13_I13),.x3(CLB13_I14),.x4(CLB13_I15),.q1(CLB13_Q6),.q2(CLB13_Q7),.Rq1(CLB13_RQ6),.Rq2(CLB13_RQ7),.Cy1(CLB13_CYO6),.Cy2(CLB13_CYO7),
 	.G0(SB13_SB14_0),.G1(SB13_SB14_1),.G2(SB13_SB14_2),.G3(SB13_SB14_3),.G4(SB13_SB14_4),.G5(SB13_SB14_5),.G6(SB13_SB14_6),.G7(SB13_SB14_7),
 	.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB13_N_prgm_b_out),.cb_prgm_b_in(CB12_W_prgm_b_out));

CB CB13_E(.x1(CLB13_I4),.x2(CLB13_I5),.x3(CLB13_I6),.x4(CLB13_I7),.q1(CLB13_Q2),.q2(CLB13_Q3),.Rq1(CLB13_RQ2),.Rq2(CLB13_RQ3),.Cy1(CLB13_CYO2),.Cy2(CLB13_CYO3),
   .G0(SB14_SB24_0),.G1(SB14_SB24_1),.G2(SB14_SB24_2),.G3(SB14_SB24_3),.G4(SB14_SB24_4),.G5(SB14_SB24_5),.G6(SB14_SB24_6),.G7(SB14_SB24_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB13_E_prgm_b_out),.cb_prgm_b_in(CB13_N_prgm_b_out));

CB CB13_S(.x1(CLB13_I8),.x2(CLB13_I9),.x3(CLB13_I10),.x4(CLB13_I11),.q1(CLB13_Q4),.q2(CLB13_Q5),.Rq1(CLB13_RQ4),.Rq2(CLB13_RQ5),.Cy1(CLB13_CYO4),.Cy2(CLB13_CYO5),
   .G0(SB23_SB24_0),.G1(SB23_SB24_1),.G2(SB23_SB24_2),.G3(SB23_SB24_3),.G4(SB23_SB24_4),.G5(SB23_SB24_5),.G6(SB23_SB24_6),.G7(SB23_SB24_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB13_S_prgm_b_out),.cb_prgm_b_in(CB13_E_prgm_b_out));

CB CB13_W(.x1(CLB13_I0),.x2(CLB13_I1),.x3(CLB13_I2),.x4(CLB13_I3),.q1(CLB13_Q0),.q2(CLB13_Q1),.Rq1(CLB13_RQ0),.Rq2(CLB13_RQ1),.Cy1(CLB13_CYO0),.Cy2(CLB13_CYO1),
   .G0(SB13_SB23_0),.G1(SB13_SB23_1),.G2(SB13_SB23_2),.G3(SB13_SB23_3),.G4(SB13_SB23_4),.G5(SB13_SB23_5),.G6(SB13_SB23_6),.G7(SB13_SB23_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB13_W_prgm_b_out),.cb_prgm_b_in(CB13_S_prgm_b_out));

//CLB20

CB CB20_N(.x1(CLB20_I12),.x2(CLB20_I13),.x3(CLB20_I20),.x4(CLB20_I15),.q1(CLB20_Q6),.q2(CLB20_Q7),.Rq1(CLB20_RQ6),.Rq2(CLB20_RQ7),.Cy1(CLB20_CYO6),.Cy2(CLB20_CYO7),
 	.G0(SB20_SB21_0),.G1(SB20_SB21_1),.G2(SB20_SB21_2),.G3(SB20_SB21_3),.G4(SB20_SB21_4),.G5(SB20_SB21_5),.G6(SB20_SB21_6),.G7(SB20_SB21_7),
 	.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB20_N_prgm_b_out),.cb_prgm_b_in(CB13_W_prgm_b_out));

CB CB20_E(.x1(CLB20_I4),.x2(CLB20_I5),.x3(CLB20_I6),.x4(CLB20_I7),.q1(CLB20_Q2),.q2(CLB20_Q3),.Rq1(CLB20_RQ2),.Rq2(CLB20_RQ3),.Cy1(CLB20_CYO2),.Cy2(CLB20_CYO3),
   .G0(SB21_SB31_0),.G1(SB21_SB31_1),.G2(SB21_SB31_2),.G3(SB21_SB31_3),.G4(SB21_SB31_4),.G5(SB21_SB31_5),.G6(SB21_SB31_6),.G7(SB21_SB31_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB20_E_prgm_b_out),.cb_prgm_b_in(CB20_N_prgm_b_out));

CB CB20_S(.x1(CLB20_I8),.x2(CLB20_I9),.x3(CLB20_I10),.x4(CLB20_I11),.q1(CLB20_Q4),.q2(CLB20_Q5),.Rq1(CLB20_RQ4),.Rq2(CLB20_RQ5),.Cy1(CLB20_CYO4),.Cy2(CLB20_CYO5),
   .G0(SB30_SB31_0),.G1(SB30_SB31_1),.G2(SB30_SB31_2),.G3(SB30_SB31_3),.G4(SB30_SB31_4),.G5(SB30_SB31_5),.G6(SB30_SB31_6),.G7(SB30_SB31_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB20_S_prgm_b_out),.cb_prgm_b_in(CB20_E_prgm_b_out));

CB CB20_W(.x1(CLB20_I0),.x2(CLB20_I1),.x3(CLB20_I2),.x4(CLB20_I3),.q1(CLB20_Q0),.q2(CLB20_Q1),.Rq1(CLB20_RQ0),.Rq2(CLB20_RQ1),.Cy1(CLB20_CYO0),.Cy2(CLB20_CYO1),
   .G0(SB20_SB30_0),.G1(SB20_SB30_1),.G2(SB20_SB30_2),.G3(SB20_SB30_3),.G4(SB20_SB30_4),.G5(SB20_SB30_5),.G6(SB20_SB30_6),.G7(SB20_SB30_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB20_W_prgm_b_out),.cb_prgm_b_in(CB20_S_prgm_b_out));

//CLB21


CB CB21_N(.x1(CLB21_I12),.x2(CLB21_I13),.x3(CLB21_I21),.x4(CLB21_I15),.q1(CLB21_Q6),.q2(CLB21_Q7),.Rq1(CLB21_RQ6),.Rq2(CLB21_RQ7),.Cy1(CLB21_CYO6),.Cy2(CLB21_CYO7),
 	.G0(SB21_SB22_0),.G1(SB21_SB22_1),.G2(SB21_SB22_2),.G3(SB21_SB22_3),.G4(SB21_SB22_4),.G5(SB21_SB22_5),.G6(SB21_SB22_6),.G7(SB21_SB22_7),
 	.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB21_N_prgm_b_out),.cb_prgm_b_in(CB20_W_prgm_b_out));

CB CB21_E(.x1(CLB21_I4),.x2(CLB21_I5),.x3(CLB21_I6),.x4(CLB21_I7),.q1(CLB21_Q2),.q2(CLB21_Q3),.Rq1(CLB21_RQ2),.Rq2(CLB21_RQ3),.Cy1(CLB21_CYO2),.Cy2(CLB21_CYO3),
   .G0(SB22_SB32_0),.G1(SB22_SB32_1),.G2(SB22_SB32_2),.G3(SB22_SB32_3),.G4(SB22_SB32_4),.G5(SB22_SB32_5),.G6(SB22_SB32_6),.G7(SB22_SB32_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB21_E_prgm_b_out),.cb_prgm_b_in(CB21_N_prgm_b_out));

CB CB21_S(.x1(CLB21_I8),.x2(CLB21_I9),.x3(CLB21_I10),.x4(CLB21_I11),.q1(CLB21_Q4),.q2(CLB21_Q5),.Rq1(CLB21_RQ4),.Rq2(CLB21_RQ5),.Cy1(CLB21_CYO4),.Cy2(CLB21_CYO5),
   .G0(SB31_SB32_0),.G1(SB31_SB32_1),.G2(SB31_SB32_2),.G3(SB31_SB32_3),.G4(SB31_SB32_4),.G5(SB31_SB32_5),.G6(SB31_SB32_6),.G7(SB31_SB32_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB21_S_prgm_b_out),.cb_prgm_b_in(CB21_E_prgm_b_out));

CB CB21_W(.x1(CLB21_I0),.x2(CLB21_I1),.x3(CLB21_I2),.x4(CLB21_I3),.q1(CLB21_Q0),.q2(CLB21_Q1),.Rq1(CLB21_RQ0),.Rq2(CLB21_RQ1),.Cy1(CLB21_CYO0),.Cy2(CLB21_CYO1),
   .G0(SB21_SB31_0),.G1(SB21_SB31_1),.G2(SB21_SB31_2),.G3(SB21_SB31_3),.G4(SB21_SB31_4),.G5(SB21_SB31_5),.G6(SB21_SB31_6),.G7(SB21_SB31_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB21_W_prgm_b_out),.cb_prgm_b_in(CB21_S_prgm_b_out));

//CLB22

CB CB22_N(.x1(CLB22_I12),.x2(CLB22_I13),.x3(CLB22_I21),.x4(CLB22_I15),.q1(CLB22_Q6),.q2(CLB22_Q7),.Rq1(CLB22_RQ6),.Rq2(CLB22_RQ7),.Cy1(CLB22_CYO6),.Cy2(CLB22_CYO7),
 	.G0(SB22_SB23_0),.G1(SB22_SB23_1),.G2(SB22_SB23_2),.G3(SB22_SB23_3),.G4(SB22_SB23_4),.G5(SB22_SB23_5),.G6(SB22_SB23_6),.G7(SB22_SB23_7),
 	.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB22_N_prgm_b_out),.cb_prgm_b_in(CB21_W_prgm_b_out));

CB CB22_E(.x1(CLB22_I4),.x2(CLB22_I5),.x3(CLB22_I6),.x4(CLB22_I7),.q1(CLB22_Q2),.q2(CLB22_Q3),.Rq1(CLB22_RQ2),.Rq2(CLB22_RQ3),.Cy1(CLB22_CYO2),.Cy2(CLB22_CYO3),
   .G0(SB23_SB33_0),.G1(SB23_SB33_1),.G2(SB23_SB33_2),.G3(SB23_SB33_3),.G4(SB23_SB33_4),.G5(SB23_SB33_5),.G6(SB23_SB33_6),.G7(SB23_SB33_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB22_E_prgm_b_out),.cb_prgm_b_in(CB22_N_prgm_b_out));

CB CB22_S(.x1(CLB22_I8),.x2(CLB22_I9),.x3(CLB22_I10),.x4(CLB22_I11),.q1(CLB22_Q4),.q2(CLB22_Q5),.Rq1(CLB22_RQ4),.Rq2(CLB22_RQ5),.Cy1(CLB22_CYO4),.Cy2(CLB22_CYO5),
   .G0(SB32_SB33_0),.G1(SB32_SB33_1),.G2(SB32_SB33_2),.G3(SB32_SB33_3),.G4(SB32_SB33_4),.G5(SB32_SB33_5),.G6(SB32_SB33_6),.G7(SB32_SB33_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB22_S_prgm_b_out),.cb_prgm_b_in(CB22_E_prgm_b_out));

CB CB22_W(.x1(CLB22_I0),.x2(CLB22_I1),.x3(CLB22_I2),.x4(CLB22_I3),.q1(CLB22_Q0),.q2(CLB22_Q1),.Rq1(CLB22_RQ0),.Rq2(CLB22_RQ1),.Cy1(CLB22_CYO0),.Cy2(CLB22_CYO1),
   .G0(SB22_SB32_0),.G1(SB22_SB32_1),.G2(SB22_SB32_2),.G3(SB22_SB32_3),.G4(SB22_SB32_4),.G5(SB22_SB32_5),.G6(SB22_SB32_6),.G7(SB22_SB32_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB22_W_prgm_b_out),.cb_prgm_b_in(CB22_S_prgm_b_out));

//CLB23

CB CB23_N(.x1(CLB23_I12),.x2(CLB23_I13),.x3(CLB23_I21),.x4(CLB23_I15),.q1(CLB23_Q6),.q2(CLB23_Q7),.Rq1(CLB23_RQ6),.Rq2(CLB23_RQ7),.Cy1(CLB23_CYO6),.Cy2(CLB23_CYO7),
 	.G0(SB23_SB24_0),.G1(SB23_SB24_1),.G2(SB23_SB24_2),.G3(SB23_SB24_3),.G4(SB23_SB24_4),.G5(SB23_SB24_5),.G6(SB23_SB24_6),.G7(SB23_SB24_7),
 	.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB23_N_prgm_b_out),.cb_prgm_b_in(CB22_W_prgm_b_out));

CB CB23_E(.x1(CLB23_I4),.x2(CLB23_I5),.x3(CLB23_I6),.x4(CLB23_I7),.q1(CLB23_Q2),.q2(CLB23_Q3),.Rq1(CLB23_RQ2),.Rq2(CLB23_RQ3),.Cy1(CLB23_CYO2),.Cy2(CLB23_CYO3),
   .G0(SB24_SB34_0),.G1(SB24_SB34_1),.G2(SB24_SB34_2),.G3(SB24_SB34_3),.G4(SB24_SB34_4),.G5(SB24_SB34_5),.G6(SB24_SB34_6),.G7(SB24_SB34_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB23_E_prgm_b_out),.cb_prgm_b_in(CB23_N_prgm_b_in));

CB CB23_S(.x1(CLB23_I8),.x2(CLB23_I9),.x3(CLB23_I10),.x4(CLB23_I11),.q1(CLB23_Q4),.q2(CLB23_Q5),.Rq1(CLB23_RQ4),.Rq2(CLB23_RQ5),.Cy1(CLB23_CYO4),.Cy2(CLB23_CYO5),
   .G0(SB33_SB34_0),.G1(SB33_SB34_1),.G2(SB33_SB34_2),.G3(SB33_SB34_3),.G4(SB33_SB34_4),.G5(SB33_SB34_5),.G6(SB33_SB34_6),.G7(SB33_SB34_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB23_S_prgm_b_out),.cb_prgm_b_in(CB23_E_prgm_b_out));

CB CB23_W(.x1(CLB23_I0),.x2(CLB23_I1),.x3(CLB23_I2),.x4(CLB23_I3),.q1(CLB23_Q0),.q2(CLB23_Q1),.Rq1(CLB23_RQ0),.Rq2(CLB23_RQ1),.Cy1(CLB23_CYO0),.Cy2(CLB23_CYO1),
   .G0(SB23_SB33_0),.G1(SB23_SB33_1),.G2(SB23_SB33_2),.G3(SB23_SB33_3),.G4(SB23_SB33_4),.G5(SB23_SB33_5),.G6(SB23_SB33_6),.G7(SB23_SB33_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB23_W_prgm_b_out),.cb_prgm_b_in(CB23_S_prgm_b_out));

//CLB30

CB CB30_N(.x1(CLB30_I12),.x2(CLB30_I13),.x3(CLB30_I21),.x4(CLB30_I15),.q1(CLB30_Q6),.q2(CLB30_Q7),.Rq1(CLB30_RQ6),.Rq2(CLB30_RQ7),.Cy1(CLB30_CYO6),.Cy2(CLB30_CYO7),
 	.G0(SB30_SB31_0),.G1(SB30_SB31_1),.G2(SB30_SB31_2),.G3(SB30_SB31_3),.G4(SB30_SB31_4),.G5(SB30_SB31_5),.G6(SB30_SB31_6),.G7(SB30_SB31_7),
 	.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB30_N_prgm_b_out),.cb_prgm_b_in(CB23_W_prgm_b_out));

CB CB30_E(.x1(CLB30_I4),.x2(CLB30_I5),.x3(CLB30_I6),.x4(CLB30_I7),.q1(CLB30_Q2),.q2(CLB30_Q3),.Rq1(CLB30_RQ2),.Rq2(CLB30_RQ3),.Cy1(CLB30_CYO2),.Cy2(CLB30_CYO3),
   .G0(SB31_SB41_0),.G1(SB31_SB41_1),.G2(SB31_SB41_2),.G3(SB31_SB41_3),.G4(SB31_SB41_4),.G5(SB31_SB41_5),.G6(SB31_SB41_6),.G7(SB31_SB41_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB30_E_prgm_b_out),.cb_prgm_b_in(CB30_N_prgm_b_out));

CB CB30_S(.x1(CLB30_I8),.x2(CLB30_I9),.x3(CLB30_I10),.x4(CLB30_I11),.q1(CLB30_Q4),.q2(CLB30_Q5),.Rq1(CLB30_RQ4),.Rq2(CLB30_RQ5),.Cy1(CLB30_CYO4),.Cy2(CLB30_CYO5),
   .G0(SB40_SB41_0),.G1(SB40_SB41_1),.G2(SB40_SB41_2),.G3(SB40_SB41_3),.G4(SB40_SB41_4),.G5(SB40_SB41_5),.G6(SB40_SB41_6),.G7(SB40_SB41_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB30_S_prgm_b_out),.cb_prgm_b_in(CB30_E_prgm_b_out));

CB CB30_W(.x1(CLB30_I0),.x2(CLB30_I1),.x3(CLB30_I2),.x4(CLB30_I3),.q1(CLB30_Q0),.q2(CLB30_Q1),.Rq1(CLB30_RQ0),.Rq2(CLB30_RQ1),.Cy1(CLB30_CYO0),.Cy2(CLB30_CYO1),
   .G0(SB30_SB40_0),.G1(SB30_SB40_1),.G2(SB30_SB40_2),.G3(SB30_SB40_3),.G4(SB30_SB40_4),.G5(SB30_SB40_5),.G6(SB30_SB40_6),.G7(SB30_SB40_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB30_W_prgm_b_out),.cb_prgm_b_in(CB30_S_prgm_b_out));

//CLB31

CB CB31_N(.x1(CLB31_I12),.x2(CLB31_I13),.x3(CLB31_I21),.x4(CLB31_I15),.q1(CLB31_Q6),.q2(CLB31_Q7),.Rq1(CLB31_RQ6),.Rq2(CLB31_RQ7),.Cy1(CLB31_CYO6),.Cy2(CLB31_CYO7),
 	.G0(SB31_SB32_0),.G1(SB31_SB32_1),.G2(SB31_SB32_2),.G3(SB31_SB32_3),.G4(SB31_SB32_4),.G5(SB31_SB32_5),.G6(SB31_SB32_6),.G7(SB31_SB32_7),
 	.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB31_N_prgm_b_out),.cb_prgm_b_in(CB30_W_prgm_b_out));

CB CB31_E(.x1(CLB31_I4),.x2(CLB31_I5),.x3(CLB31_I6),.x4(CLB31_I7),.q1(CLB31_Q2),.q2(CLB31_Q3),.Rq1(CLB31_RQ2),.Rq2(CLB31_RQ3),.Cy1(CLB31_CYO2),.Cy2(CLB31_CYO3),
   .G0(SB32_SB42_0),.G1(SB32_SB42_1),.G2(SB32_SB42_2),.G3(SB32_SB42_3),.G4(SB32_SB42_4),.G5(SB32_SB42_5),.G6(SB32_SB42_6),.G7(SB32_SB42_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB31_E_prgm_b_out),.cb_prgm_b_in(CB31_N_prgm_b_out));

CB CB31_S(.x1(CLB31_I8),.x2(CLB31_I9),.x3(CLB31_I10),.x4(CLB31_I11),.q1(CLB31_Q4),.q2(CLB31_Q5),.Rq1(CLB31_RQ4),.Rq2(CLB31_RQ5),.Cy1(CLB31_CYO4),.Cy2(CLB31_CYO5),
   .G0(SB41_SB42_0),.G1(SB41_SB42_1),.G2(SB41_SB42_2),.G3(SB41_SB42_3),.G4(SB41_SB42_4),.G5(SB41_SB42_5),.G6(SB41_SB42_6),.G7(SB41_SB42_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB31_S_prgm_b_out),.cb_prgm_b_in(CB31_E_prgm_b_out));

CB CB31_W(.x1(CLB31_I0),.x2(CLB31_I1),.x3(CLB31_I2),.x4(CLB31_I3),.q1(CLB31_Q0),.q2(CLB31_Q1),.Rq1(CLB31_RQ0),.Rq2(CLB31_RQ1),.Cy1(CLB31_CYO0),.Cy2(CLB31_CYO1),
   .G0(SB31_SB41_0),.G1(SB31_SB41_1),.G2(SB31_SB41_2),.G3(SB31_SB41_3),.G4(SB31_SB41_4),.G5(SB31_SB41_5),.G6(SB31_SB41_6),.G7(SB31_SB41_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB31_W_prgm_b_out),.cb_prgm_b_in(CB31_S_prgm_b_out));

//CLB32

CB CB32_N(.x1(CLB32_I12),.x2(CLB32_I13),.x3(CLB32_I21),.x4(CLB32_I15),.q1(CLB32_Q6),.q2(CLB32_Q7),.Rq1(CLB32_RQ6),.Rq2(CLB32_RQ7),.Cy1(CLB32_CYO6),.Cy2(CLB32_CYO7),
 	.G0(SB32_SB33_0),.G1(SB32_SB33_1),.G2(SB32_SB33_2),.G3(SB32_SB33_3),.G4(SB32_SB33_4),.G5(SB32_SB33_5),.G6(SB32_SB33_6),.G7(SB32_SB33_7),
 	.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB32_N_prgm_b_out),.cb_prgm_b_in(CB31_W_prgm_b_out));

CB CB32_E(.x1(CLB32_I4),.x2(CLB32_I5),.x3(CLB32_I6),.x4(CLB32_I7),.q1(CLB32_Q2),.q2(CLB32_Q3),.Rq1(CLB32_RQ2),.Rq2(CLB32_RQ3),.Cy1(CLB32_CYO2),.Cy2(CLB32_CYO3),
   .G0(SB33_SB43_0),.G1(SB33_SB43_1),.G2(SB33_SB43_2),.G3(SB33_SB43_3),.G4(SB33_SB43_4),.G5(SB33_SB43_5),.G6(SB33_SB43_6),.G7(SB33_SB43_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB32_E_prgm_b_out),.cb_prgm_b_in(CB32_N_prgm_b_out));

CB CB32_S(.x1(CLB32_I8),.x2(CLB32_I9),.x3(CLB32_I10),.x4(CLB32_I11),.q1(CLB32_Q4),.q2(CLB32_Q5),.Rq1(CLB32_RQ4),.Rq2(CLB32_RQ5),.Cy1(CLB32_CYO4),.Cy2(CLB32_CYO5),
   .G0(SB42_SB43_0),.G1(SB42_SB43_1),.G2(SB42_SB43_2),.G3(SB42_SB43_3),.G4(SB42_SB43_4),.G5(SB42_SB43_5),.G6(SB42_SB43_6),.G7(SB42_SB43_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB32_S_prgm_b_out),.cb_prgm_b_in(CB32_E_prgm_b_out));

CB CB32_W(.x1(CLB32_I0),.x2(CLB32_I1),.x3(CLB32_I2),.x4(CLB32_I3),.q1(CLB32_Q0),.q2(CLB32_Q1),.Rq1(CLB32_RQ0),.Rq2(CLB32_RQ1),.Cy1(CLB32_CYO0),.Cy2(CLB32_CYO1),
   .G0(SB32_SB42_0),.G1(SB32_SB42_1),.G2(SB32_SB42_2),.G3(SB32_SB42_3),.G4(SB32_SB42_4),.G5(SB32_SB42_5),.G6(SB32_SB42_6),.G7(SB32_SB42_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB32_W_prgm_b_out),.cb_prgm_b_in(CB32_S_prgm_b_out));

//CLB33

CB CB33_N(.x1(CLB33_I12),.x2(CLB33_I13),.x3(CLB33_I21),.x4(CLB33_I15),.q1(CLB33_Q6),.q2(CLB33_Q7),.Rq1(CLB33_RQ6),.Rq2(CLB33_RQ7),.Cy1(CLB33_CYO6),.Cy2(CLB33_CYO7),
 	.G0(SB33_SB34_0),.G1(SB33_SB34_1),.G2(SB33_SB34_2),.G3(SB33_SB34_3),.G4(SB33_SB34_4),.G5(SB33_SB34_5),.G6(SB33_SB34_6),.G7(SB33_SB34_7),
 	.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB33_N_prgm_b_out),.cb_prgm_b_in(CB32_W_prgm_b_out));

CB CB33_E(.x1(CLB33_I4),.x2(CLB33_I5),.x3(CLB33_I6),.x4(CLB33_I7),.q1(CLB33_Q2),.q2(CLB33_Q3),.Rq1(CLB33_RQ2),.Rq2(CLB33_RQ3),.Cy1(CLB33_CYO2),.Cy2(CLB33_CYO3),
   .G0(SB34_SB44_0),.G1(SB34_SB44_1),.G2(SB34_SB44_2),.G3(SB34_SB44_3),.G4(SB34_SB44_4),.G5(SB34_SB44_5),.G6(SB34_SB44_6),.G7(SB34_SB44_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB33_E_prgm_b_out),.cb_prgm_b_in(CB33_N_prgm_b_out));

CB CB33_S(.x1(CLB33_I8),.x2(CLB33_I9),.x3(CLB33_I10),.x4(CLB33_I11),.q1(CLB33_Q4),.q2(CLB33_Q5),.Rq1(CLB33_RQ4),.Rq2(CLB33_RQ5),.Cy1(CLB33_CYO4),.Cy2(CLB33_CYO5),
   .G0(SB43_SB44_0),.G1(SB43_SB44_1),.G2(SB43_SB44_2),.G3(SB43_SB44_3),.G4(SB43_SB44_4),.G5(SB43_SB44_5),.G6(SB43_SB44_6),.G7(SB43_SB44_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(CB33_S_prgm_b_out),.cb_prgm_b_in(CB33_E_prgm_b_out));

CB CB33_W(.x1(CLB33_I0),.x2(CLB33_I1),.x3(CLB33_I2),.x4(CLB33_I3),.q1(CLB33_Q0),.q2(CLB33_Q1),.Rq1(CLB33_RQ0),.Rq2(CLB33_RQ1),.Cy1(CLB33_CYO0),.Cy2(CLB33_CYO1),
   .G0(SB33_SB43_0),.G1(SB33_SB43_1),.G2(SB33_SB43_2),.G3(SB33_SB43_3),.G4(SB33_SB43_4),.G5(SB33_SB43_5),.G6(SB33_SB43_6),.G7(SB33_SB43_7),
   .bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out),.cb_prgm_b_in(CB33_S_prgm_b_out));



//CLB Blocks

wire CLB00_I0,CLB00_I1,CLB00_I2,CLB00_I3,CLB00_I4,CLB00_I5,CLB00_I6,CLB00_I7,CLB00_I8,CLB00_I9,CLB00_I10,CLB00_I11,CLB00_I12,CLB00_I13,CLB00_I14,CLB00_I15;
wire CLB00_Q0,CLB00_Q1,CLB00_Q2,CLB00_Q3,CLB00_Q4,CLB00_Q5,CLB00_Q6,CLB00_Q7;
wire CLB00_RQ0,CLB00_RQ1,CLB00_RQ2,CLB00_RQ3,CLB00_RQ4,CLB00_RQ5,CLB00_RQ6,CLB00_RQ7;
wire CLB00_CYO0,CLB00_CYO1,CLB00_CYO2,CLB00_CYO3,CLB00_CYO4,CLB00_CYO5,CLB00_CYO6,CLB00_CYO7;

wire CLB01_I0,CLB01_I1,CLB01_I2,CLB01_I3,CLB01_I4,CLB01_I5,CLB01_I6,CLB01_I7,CLB01_I8,CLB01_I9,CLB01_I10,CLB01_I11,CLB01_I12,CLB01_I13,CLB01_I14,CLB01_I15;
wire CLB01_Q0,CLB01_Q1,CLB01_Q2,CLB01_Q3,CLB01_Q4,CLB01_Q5,CLB01_Q6,CLB01_Q7;
wire CLB01_RQ0,CLB01_RQ1,CLB01_RQ2,CLB01_RQ3,CLB01_RQ4,CLB01_RQ5,CLB01_RQ6,CLB01_RQ7;
wire CLB01_CYO0,CLB01_CYO1,CLB01_CYO2,CLB01_CYO3,CLB01_CYO4,CLB01_CYO5,CLB01_CYO6,CLB01_CYO7;

wire CLB02_I0,CLB02_I1,CLB02_I2,CLB02_I3,CLB02_I4,CLB02_I5,CLB02_I6,CLB02_I7,CLB02_I8,CLB02_I9,CLB02_I10,CLB02_I11,CLB02_I12,CLB02_I13,CLB02_I14,CLB02_I15;
wire CLB02_Q0,CLB02_Q1,CLB02_Q2,CLB02_Q3,CLB02_Q4,CLB02_Q5,CLB02_Q6,CLB02_Q7;
wire CLB02_RQ0,CLB02_RQ1,CLB02_RQ2,CLB02_RQ3,CLB02_RQ4,CLB02_RQ5,CLB02_RQ6,CLB02_RQ7;
wire CLB02_CYO0,CLB02_CYO1,CLB02_CYO2,CLB02_CYO3,CLB02_CYO4,CLB02_CYO5,CLB02_CYO6,CLB02_CYO7;

wire CLB03_I0,CLB03_I1,CLB03_I2,CLB03_I3,CLB03_I4,CLB03_I5,CLB03_I6,CLB03_I7,CLB03_I8,CLB03_I9,CLB03_I10,CLB03_I11,CLB03_I12,CLB03_I13,CLB03_I14,CLB03_I15;
wire CLB03_Q0,CLB03_Q1,CLB03_Q2,CLB03_Q3,CLB03_Q4,CLB03_Q5,CLB03_Q6,CLB03_Q7;
wire CLB03_RQ0,CLB03_RQ1,CLB03_RQ2,CLB03_RQ3,CLB03_RQ4,CLB03_RQ5,CLB03_RQ6,CLB03_RQ7;
wire CLB03_CYO0,CLB03_CYO1,CLB03_CYO2,CLB03_CYO3,CLB03_CYO4,CLB03_CYO5,CLB03_CYO6,CLB03_CYO7;

wire CLB10_I0,CLB10_I1,CLB10_I2,CLB10_I3,CLB10_I4,CLB10_I5,CLB10_I6,CLB10_I7,CLB10_I8,CLB10_I9,CLB10_I10,CLB10_I11,CLB10_I12,CLB10_I13,CLB10_I14,CLB10_I15;
wire CLB10_Q0,CLB10_Q1,CLB10_Q2,CLB10_Q3,CLB10_Q4,CLB10_Q5,CLB10_Q6,CLB10_Q7;
wire CLB10_RQ0,CLB10_RQ1,CLB10_RQ2,CLB10_RQ3,CLB10_RQ4,CLB10_RQ5,CLB10_RQ6,CLB10_RQ7;
wire CLB10_CYO0,CLB10_CYO1,CLB10_CYO2,CLB10_CYO3,CLB10_CYO4,CLB10_CYO5,CLB10_CYO6,CLB10_CYO7;

wire CLB11_I0,CLB11_I1,CLB11_I2,CLB11_I3,CLB11_I4,CLB11_I5,CLB11_I6,CLB11_I7,CLB11_I8,CLB11_I9,CLB11_I10,CLB11_I11,CLB11_I12,CLB11_I13,CLB11_I14,CLB11_I15;
wire CLB11_Q0,CLB11_Q1,CLB11_Q2,CLB11_Q3,CLB11_Q4,CLB11_Q5,CLB11_Q6,CLB11_Q7;
wire CLB11_RQ0,CLB11_RQ1,CLB11_RQ2,CLB11_RQ3,CLB11_RQ4,CLB11_RQ5,CLB11_RQ6,CLB11_RQ7;
wire CLB11_CYO0,CLB11_CYO1,CLB11_CYO2,CLB11_CYO3,CLB11_CYO4,CLB11_CYO5,CLB11_CYO6,CLB11_CYO7;

wire CLB12_I0,CLB12_I1,CLB12_I2,CLB12_I3,CLB12_I4,CLB12_I5,CLB12_I6,CLB12_I7,CLB12_I8,CLB12_I9,CLB12_I10,CLB12_I11,CLB12_I12,CLB12_I13,CLB12_I14,CLB12_I15;
wire CLB12_Q0,CLB12_Q1,CLB12_Q2,CLB12_Q3,CLB12_Q4,CLB12_Q5,CLB12_Q6,CLB12_Q7;
wire CLB12_RQ0,CLB12_RQ1,CLB12_RQ2,CLB12_RQ3,CLB12_RQ4,CLB12_RQ5,CLB12_RQ6,CLB12_RQ7;
wire CLB12_CYO0,CLB12_CYO1,CLB12_CYO2,CLB12_CYO3,CLB12_CYO4,CLB12_CYO5,CLB12_CYO6,CLB12_CYO7;

wire CLB13_I0,CLB13_I1,CLB13_I2,CLB13_I3,CLB13_I4,CLB13_I5,CLB13_I6,CLB13_I7,CLB13_I8,CLB13_I9,CLB13_I10,CLB13_I11,CLB13_I12,CLB13_I13,CLB13_I14,CLB13_I15;
wire CLB13_Q0,CLB13_Q1,CLB13_Q2,CLB13_Q3,CLB13_Q4,CLB13_Q5,CLB13_Q6,CLB13_Q7;
wire CLB13_RQ0,CLB13_RQ1,CLB13_RQ2,CLB13_RQ3,CLB13_RQ4,CLB13_RQ5,CLB13_RQ6,CLB13_RQ7;
wire CLB13_CYO0,CLB13_CYO1,CLB13_CYO2,CLB13_CYO3,CLB13_CYO4,CLB13_CYO5,CLB13_CYO6,CLB13_CYO7;

wire CLB20_I0,CLB20_I1,CLB20_I2,CLB20_I3,CLB20_I4,CLB20_I5,CLB20_I6,CLB20_I7,CLB20_I8,CLB20_I9,CLB20_I10,CLB20_I11,CLB20_I12,CLB20_I13,CLB20_I14,CLB20_I15;
wire CLB20_Q0,CLB20_Q1,CLB20_Q2,CLB20_Q3,CLB20_Q4,CLB20_Q5,CLB20_Q6,CLB20_Q7;
wire CLB20_RQ0,CLB20_RQ1,CLB20_RQ2,CLB20_RQ3,CLB20_RQ4,CLB20_RQ5,CLB20_RQ6,CLB20_RQ7;
wire CLB20_CYO0,CLB20_CYO1,CLB20_CYO2,CLB20_CYO3,CLB20_CYO4,CLB20_CYO5,CLB20_CYO6,CLB20_CYO7;

wire CLB21_I0,CLB21_I1,CLB21_I2,CLB21_I3,CLB21_I4,CLB21_I5,CLB21_I6,CLB21_I7,CLB21_I8,CLB21_I9,CLB21_I10,CLB21_I11,CLB21_I12,CLB21_I13,CLB21_I14,CLB21_I15;
wire CLB21_Q0,CLB21_Q1,CLB21_Q2,CLB21_Q3,CLB21_Q4,CLB21_Q5,CLB21_Q6,CLB21_Q7;
wire CLB21_RQ0,CLB21_RQ1,CLB21_RQ2,CLB21_RQ3,CLB21_RQ4,CLB21_RQ5,CLB21_RQ6,CLB21_RQ7;
wire CLB21_CYO0,CLB21_CYO1,CLB21_CYO2,CLB21_CYO3,CLB21_CYO4,CLB21_CYO5,CLB21_CYO6,CLB21_CYO7;

wire CLB22_I0,CLB22_I1,CLB22_I2,CLB22_I3,CLB22_I4,CLB22_I5,CLB22_I6,CLB22_I7,CLB22_I8,CLB22_I9,CLB22_I10,CLB22_I11,CLB22_I12,CLB22_I13,CLB22_I14,CLB22_I15;
wire CLB22_Q0,CLB22_Q1,CLB22_Q2,CLB22_Q3,CLB22_Q4,CLB22_Q5,CLB22_Q6,CLB22_Q7;
wire CLB22_RQ0,CLB22_RQ1,CLB22_RQ2,CLB22_RQ3,CLB22_RQ4,CLB22_RQ5,CLB22_RQ6,CLB22_RQ7;
wire CLB22_CYO0,CLB22_CYO1,CLB22_CYO2,CLB22_CYO3,CLB22_CYO4,CLB22_CYO5,CLB22_CYO6,CLB22_CYO7;

wire CLB23_I0,CLB23_I1,CLB23_I2,CLB23_I3,CLB23_I4,CLB23_I5,CLB23_I6,CLB23_I7,CLB23_I8,CLB23_I9,CLB23_I10,CLB23_I11,CLB23_I12,CLB23_I13,CLB23_I14,CLB23_I15;
wire CLB23_Q0,CLB23_Q1,CLB23_Q2,CLB23_Q3,CLB23_Q4,CLB23_Q5,CLB23_Q6,CLB23_Q7;
wire CLB23_RQ0,CLB23_RQ1,CLB23_RQ2,CLB23_RQ3,CLB23_RQ4,CLB23_RQ5,CLB23_RQ6,CLB23_RQ7;
wire CLB23_CYO0,CLB23_CYO1,CLB23_CYO2,CLB23_CYO3,CLB23_CYO4,CLB23_CYO5,CLB23_CYO6,CLB23_CYO7;

wire CLB30_I0,CLB30_I1,CLB30_I2,CLB30_I3,CLB30_I4,CLB30_I5,CLB30_I6,CLB30_I7,CLB30_I8,CLB30_I9,CLB30_I10,CLB30_I11,CLB30_I12,CLB30_I13,CLB30_I14,CLB30_I15;
wire CLB30_Q0,CLB30_Q1,CLB30_Q2,CLB30_Q3,CLB30_Q4,CLB30_Q5,CLB30_Q6,CLB30_Q7;
wire CLB30_RQ0,CLB30_RQ1,CLB30_RQ2,CLB30_RQ3,CLB30_RQ4,CLB30_RQ5,CLB30_RQ6,CLB30_RQ7;
wire CLB30_CYO0,CLB30_CYO1,CLB30_CYO2,CLB30_CYO3,CLB30_CYO4,CLB30_CYO5,CLB30_CYO6,CLB30_CYO7;

wire CLB31_I0,CLB31_I1,CLB31_I2,CLB31_I3,CLB31_I4,CLB31_I5,CLB31_I6,CLB31_I7,CLB31_I8,CLB31_I9,CLB31_I10,CLB31_I11,CLB31_I12,CLB31_I13,CLB31_I14,CLB31_I15;
wire CLB31_Q0,CLB31_Q1,CLB31_Q2,CLB31_Q3,CLB31_Q4,CLB31_Q5,CLB31_Q6,CLB31_Q7;
wire CLB31_RQ0,CLB31_RQ1,CLB31_RQ2,CLB31_RQ3,CLB31_RQ4,CLB31_RQ5,CLB31_RQ6,CLB31_RQ7;
wire CLB31_CYO0,CLB31_CYO1,CLB31_CYO2,CLB31_CYO3,CLB31_CYO4,CLB31_CYO5,CLB31_CYO6,CLB31_CYO7;

wire CLB32_I0,CLB32_I1,CLB32_I2,CLB32_I3,CLB32_I4,CLB32_I5,CLB32_I6,CLB32_I7,CLB32_I8,CLB32_I9,CLB32_I10,CLB32_I11,CLB32_I12,CLB32_I13,CLB32_I14,CLB32_I15;
wire CLB32_Q0,CLB32_Q1,CLB32_Q2,CLB32_Q3,CLB32_Q4,CLB32_Q5,CLB32_Q6,CLB32_Q7;
wire CLB32_RQ0,CLB32_RQ1,CLB32_RQ2,CLB32_RQ3,CLB32_RQ4,CLB32_RQ5,CLB32_RQ6,CLB32_RQ7;
wire CLB32_CYO0,CLB32_CYO1,CLB32_CYO2,CLB32_CYO3,CLB32_CYO4,CLB32_CYO5,CLB32_CYO6,CLB32_CYO7;

wire CLB33_I0,CLB33_I1,CLB33_I2,CLB33_I3,CLB33_I4,CLB33_I5,CLB33_I6,CLB33_I7,CLB33_I8,CLB33_I9,CLB33_I10,CLB33_I11,CLB33_I12,CLB33_I13,CLB33_I14,CLB33_I15;
wire CLB33_Q0,CLB33_Q1,CLB33_Q2,CLB33_Q3,CLB33_Q4,CLB33_Q5,CLB33_Q6,CLB33_Q7;
wire CLB33_RQ0,CLB33_RQ1,CLB33_RQ2,CLB33_RQ3,CLB33_RQ4,CLB33_RQ5,CLB33_RQ6,CLB33_RQ7;
wire CLB33_CYO0,CLB33_CYO1,CLB33_CYO2,CLB33_CYO3,CLB33_CYO4,CLB33_CYO5,CLB33_CYO6,CLB33_CYO7;

wire LUT0_WE,LUT1_WE,LUT2_WE,LUT3_WE,LUT4_WE,LUT5_WE,LUT6_WE,LUT7_WE,GWE;

//Column 0

CLB CLB00(.I0(CLB00_I0),.I1(CLB00_I1),.I2(CLB00_I2),.I3(CLB00_I3),.I4(CLB00_I4),.I5(CLB00_I5),.I6(CLB00_I6),.I7(CLB00_I7),.I8(CLB00_I8),.I9(CLB00_I9),.I10(CLB00_I10),.I11(CLB00_I11),
	.I12(CLB00_I12),.I13(CLB00_I13),.I14(CLB00_I14),.I15(CLB00_I15),.Q0(CLB00_Q0),.Q1(CLB00_Q1),.Q2(CLB00_Q2),.Q3(CLB00_Q3),.Q4(CLB00_Q4),
	.Q5(CLB00_Q5),.Q6(CLB00_Q6),.Q7(CLB00_Q7),.RQ0(CLB00_RQ0),.RQ1(CLB00_RQ1),.RQ2(CLB00_RQ2),.RQ3(CLB00_RQ3),.RQ4(CLB00_RQ4),
	.RQ5(CLB00_RQ5),.RQ6(CLB00_RQ6),.RQ7(CLB00_RQ7),.CYO_0(CLB00_CYO0),.CYO_1(CLB00_CYO1),.CYO_2(CLB00_CYO2),.CYO_3(CLB00_CYO3),.CYO_4(CLB00_CYO4),
	.CYO_5(CLB00_CYO_5),.CYO_6(CLB00_CYO6),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB_prgm_b_in),.CLB_prgm_b_out(CLB00_prgm_b_out),.carry_chain_out(carry_chain_out_0),.carry_chain_in(CLB10_carry_out),
	.LUT0_WE(CLB00_LUT0_WE),.LUT1_WE(CLB00_LUT1_WE),.LUT2_WE(CLB00_LUT2_WE),.LUT3_WE(CLB00_LUT3_WE),.LUT4_WE(CLB00_LUT4_WE),.LUT5_WE(CLB00_LUT5_WE),
	.LUT6_WE(CLB00_LUT6_WE),.LUT7_WE(CLB00_LUT7_WE),.GWE(GWE)); 

CLB CLB10(.I0(CLB10_I0),.I1(CLB10_I1),.I2(CLB10_I2),.I3(CLB10_I3),.I4(CLB10_I4),.I5(CLB10_I5),.I6(CLB10_I6),.I7(CLB10_I7),.I8(CLB10_I8),.I9(CLB10_I9),.I10(CLB10_I10),.I11(CLB10_I11),
	.I12(CLB10_I12),.I13(CLB10_I13),.I14(CLB10_I14),.I15(CLB10_I15),.Q0(CLB10_Q0),.Q1(CLB10_Q1),.Q2(CLB10_Q2),.Q3(CLB10_Q3),.Q4(CLB10_Q4),
	.Q5(CLB10_Q5),.Q6(CLB10_Q6),.Q7(CLB10_Q7),.RQ0(CLB10_RQ0),.RQ1(CLB10_RQ1),.RQ2(CLB10_RQ2),.RQ3(CLB10_RQ3),.RQ4(CLB10_RQ4),
	.RQ5(CLB10_RQ5),.RQ6(CLB10_RQ6),.RQ7(CLB10_RQ7),.CYO_0(CLB10_CYO0),.CYO_1(CLB10_CYO1),.CYO_2(CLB10_CYO2),.CYO_3(CLB10_CYO3),.CYO_4(CLB10_CYO4),
	.CYO_5(CLB10_CYO_5),.CYO_6(CLB10_CYO6),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB03_prgm_b_out),.CLB_prgm_b_out(CLB10_prgm_b_out),.carry_chain_out(CLB10_carry_out),.carry_chain_in(CLB20_carry_out),
	.LUT0_WE(CLB10_LUT0_WE),.LUT1_WE(CLB10_LUT1_WE),.LUT2_WE(CLB10_LUT2_WE),.LUT3_WE(CLB10_LUT3_WE),.LUT4_WE(CLB10_LUT4_WE),.LUT5_WE(CLB10_LUT5_WE),
	.LUT6_WE(CLB10_LUT6_WE),.LUT7_WE(CLB10_LUT7_WE),.GWE(GWE));

CLB CLB20(.I0(CLB20_I0),.I1(CLB20_I1),.I2(CLB20_I2),.I3(CLB20_I3),.I4(CLB20_I4),.I5(CLB20_I5),.I6(CLB20_I6),.I7(CLB20_I7),.I8(CLB20_I8),.I9(CLB20_I9),.I10(CLB20_I10),.I11(CLB20_I11),
	.I12(CLB20_I12),.I13(CLB20_I13),.I14(CLB20_I14),.I15(CLB20_I15),.Q0(CLB20_Q0),.Q1(CLB20_Q1),.Q2(CLB20_Q2),.Q3(CLB20_Q3),.Q4(CLB20_Q4),
	.Q5(CLB20_Q5),.Q6(CLB20_Q6),.Q7(CLB20_Q7),.RQ0(CLB20_RQ0),.RQ1(CLB20_RQ1),.RQ2(CLB20_RQ2),.RQ3(CLB20_RQ3),.RQ4(CLB20_RQ4),
	.RQ5(CLB20_RQ5),.RQ6(CLB20_RQ6),.RQ7(CLB20_RQ7),.CYO_0(CLB20_CYO0),.CYO_1(CLB20_CYO1),.CYO_2(CLB20_CYO2),.CYO_3(CLB20_CYO3),.CYO_4(CLB20_CYO4),
	.CYO_5(CLB20_CYO_5),.CYO_6(CLB20_CYO6),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB13_prgm_b_out),.CLB_prgm_b_out(CLB20_prgm_b_out),.carry_chain_out(CLB20_carry_out),.carry_chain_in(CLB30_carry_out),
	.LUT0_WE(CLB20_LUT0_WE),.LUT1_WE(CLB20_LUT1_WE),.LUT2_WE(CLB20_LUT2_WE),.LUT3_WE(CLB20_LUT3_WE),.LUT4_WE(CLB20_LUT4_WE),.LUT5_WE(CLB20_LUT5_WE),
	.LUT6_WE(CLB20_LUT6_WE),.LUT7_WE(CLB20_LUT7_WE),.GWE(GWE)); 

CLB CLB30(.I0(CLB30_I0),.I1(CLB30_I1),.I2(CLB30_I2),.I3(CLB30_I3),.I4(CLB30_I4),.I5(CLB30_I5),.I6(CLB30_I6),.I7(CLB30_I7),.I8(CLB30_I8),.I9(CLB30_I9),.I10(CLB30_I10),.I11(CLB30_I11),
	.I12(CLB30_I12),.I13(CLB30_I13),.I14(CLB30_I14),.I15(CLB30_I15),.Q0(CLB30_Q0),.Q1(CLB30_Q1),.Q2(CLB30_Q2),.Q3(CLB30_Q3),.Q4(CLB30_Q4),
	.Q5(CLB30_Q5),.Q6(CLB30_Q6),.Q7(CLB30_Q7),.RQ0(CLB30_RQ0),.RQ1(CLB30_RQ1),.RQ2(CLB30_RQ2),.RQ3(CLB30_RQ3),.RQ4(CLB30_RQ4),
	.RQ5(CLB30_RQ5),.RQ6(CLB30_RQ6),.RQ7(CLB30_RQ7),.CYO_0(CLB30_CYO0),.CYO_1(CLB30_CYO1),.CYO_2(CLB30_CYO2),.CYO_3(CLB30_CYO3),.CYO_4(CLB30_CYO4),
	.CYO_5(CLB30_CYO_5),.CYO_6(CLB30_CYO6),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB23_prgm_b_out),.CLB_prgm_b_out(CLB30_prgm_b_out),.carry_chain_out(CLB30_carry_out),.carry_chain_in(carry_chain_in_0),
	.LUT0_WE(CLB30_LUT0_WE),.LUT1_WE(CLB30_LUT1_WE),.LUT2_WE(CLB30_LUT2_WE),.LUT3_WE(CLB30_LUT3_WE),.LUT4_WE(CLB30_LUT4_WE),.LUT5_WE(CLB30_LUT5_WE),
	.LUT6_WE(CLB30_LUT6_WE),.LUT7_WE(CLB30_LUT7_WE),.GWE(GWE)); 


//Column 1
CLB CLB01(.I0(CLB01_I0),.I1(CLB01_I1),.I2(CLB01_I2),.I3(CLB01_I3),.I4(CLB01_I4),.I5(CLB01_I5),.I6(CLB01_I6),.I7(CLB01_I7),.I8(CLB01_I8),.I9(CLB01_I9),.I10(CLB01_I10),.I11(CLB01_I11),
	.I12(CLB01_I12),.I13(CLB01_I13),.I14(CLB01_I14),.I15(CLB01_I15),.Q0(CLB01_Q0),.Q1(CLB01_Q1),.Q2(CLB01_Q2),.Q3(CLB01_Q3),.Q4(CLB01_Q4),
	.Q5(CLB01_Q5),.Q6(CLB01_Q6),.Q7(CLB01_Q7),.RQ0(CLB01_RQ0),.RQ1(CLB01_RQ1),.RQ2(CLB01_RQ2),.RQ3(CLB01_RQ3),.RQ4(CLB01_RQ4),
	.RQ5(CLB01_RQ5),.RQ6(CLB01_RQ6),.RQ7(CLB01_RQ7),.CYO_0(CLB01_CYO0),.CYO_1(CLB01_CYO1),.CYO_2(CLB01_CYO2),.CYO_3(CLB01_CYO3),.CYO_4(CLB01_CYO4),
	.CYO_5(CLB01_CYO_5),.CYO_6(CLB01_CYO6),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB00_prgm_b_out),.CLB_prgm_b_out(CLB01_prgm_b_out),.carry_chain_out(carry_chain_out_1),.carry_chain_in(CLB11_carry_out),
	.LUT0_WE(CLB01_LUT0_WE),.LUT1_WE(CLB01_LUT1_WE),.LUT2_WE(CLB01_LUT2_WE),.LUT3_WE(CLB01_LUT3_WE),.LUT4_WE(CLB01_LUT4_WE),.LUT5_WE(CLB01_LUT5_WE),
	.LUT6_WE(CLB01_LUT6_WE),.LUT7_WE(CLB01_LUT7_WE),.GWE(GWE));

CLB CLB11(.I0(CLB11_I0),.I1(CLB11_I1),.I2(CLB11_I2),.I3(CLB11_I3),.I4(CLB11_I4),.I5(CLB11_I5),.I6(CLB11_I6),.I7(CLB11_I7),.I8(CLB11_I8),.I9(CLB11_I9),.I10(CLB11_I10),.I11(CLB11_I11),
	.I12(CLB11_I12),.I13(CLB11_I13),.I14(CLB11_I14),.I15(CLB11_I15),.Q0(CLB11_Q0),.Q1(CLB11_Q1),.Q2(CLB11_Q2),.Q3(CLB11_Q3),.Q4(CLB11_Q4),
	.Q5(CLB11_Q5),.Q6(CLB11_Q6),.Q7(CLB11_Q7),.RQ0(CLB11_RQ0),.RQ1(CLB11_RQ1),.RQ2(CLB11_RQ2),.RQ3(CLB11_RQ3),.RQ4(CLB11_RQ4),
	.RQ5(CLB11_RQ5),.RQ6(CLB11_RQ6),.RQ7(CLB11_RQ7),.CYO_0(CLB11_CYO0),.CYO_1(CLB11_CYO1),.CYO_2(CLB11_CYO2),.CYO_3(CLB11_CYO3),.CYO_4(CLB11_CYO4),
	.CYO_5(CLB11_CYO_5),.CYO_6(CLB11_CYO6),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB10_prgm_b_out),.CLB_prgm_b_out(CLB11_prgm_b_out),.carry_chain_out(CLB11_carry_out),.carry_chain_in(CLB21_carry_out),
	.LUT0_WE(CLB11_LUT0_WE),.LUT1_WE(CLB11_LUT1_WE),.LUT2_WE(CLB11_LUT2_WE),.LUT3_WE(CLB11_LUT3_WE),.LUT4_WE(CLB11_LUT4_WE),.LUT5_WE(CLB11_LUT5_WE),
	.LUT6_WE(CLB11_LUT6_WE),.LUT7_WE(CLB11_LUT7_WE),.GWE(GWE));


CLB CLB21(.I0(CLB21_I0),.I1(CLB21_I1),.I2(CLB21_I2),.I3(CLB21_I3),.I4(CLB21_I4),.I5(CLB21_I5),.I6(CLB21_I6),.I7(CLB21_I7),.I8(CLB21_I8),.I9(CLB21_I9),.I10(CLB21_I10),.I11(CLB21_I11),
	.I12(CLB21_I12),.I13(CLB21_I13),.I14(CLB21_I14),.I15(CLB21_I15),.Q0(CLB21_Q0),.Q1(CLB21_Q1),.Q2(CLB21_Q2),.Q3(CLB21_Q3),.Q4(CLB21_Q4),
	.Q5(CLB21_Q5),.Q6(CLB21_Q6),.Q7(CLB21_Q7),.RQ0(CLB21_RQ0),.RQ1(CLB21_RQ1),.RQ2(CLB21_RQ2),.RQ3(CLB21_RQ3),.RQ4(CLB21_RQ4),
	.RQ5(CLB21_RQ5),.RQ6(CLB21_RQ6),.RQ7(CLB21_RQ7),.CYO_0(CLB21_CYO0),.CYO_1(CLB21_CYO1),.CYO_2(CLB21_CYO2),.CYO_3(CLB21_CYO3),.CYO_4(CLB21_CYO4),
	.CYO_5(CLB21_CYO_5),.CYO_6(CLB21_CYO6),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB20_prgm_b_out),.CLB_prgm_b_out(CLB21_prgm_b_out),.carry_chain_out(CLB21_carry_out),.carry_chain_in(CLB31_carry_out),
	.LUT0_WE(CLB21_LUT0_WE),.LUT1_WE(CLB21_LUT1_WE),.LUT2_WE(CLB21_LUT2_WE),.LUT3_WE(CLB21_LUT3_WE),.LUT4_WE(CLB21_LUT4_WE),.LUT5_WE(CLB21_LUT5_WE),
	.LUT6_WE(CLB21_LUT6_WE),.LUT7_WE(CLB21_LUT7_WE),.GWE(GWE));


CLB CLB31(.I0(CLB31_I0),.I1(CLB31_I1),.I2(CLB31_I2),.I3(CLB31_I3),.I4(CLB31_I4),.I5(CLB31_I5),.I6(CLB31_I6),.I7(CLB31_I7),.I8(CLB31_I8),.I9(CLB31_I9),.I10(CLB31_I10),.I11(CLB31_I11),
	.I12(CLB31_I12),.I13(CLB31_I13),.I14(CLB31_I14),.I15(CLB31_I15),.Q0(CLB31_Q0),.Q1(CLB31_Q1),.Q2(CLB31_Q2),.Q3(CLB31_Q3),.Q4(CLB31_Q4),
	.Q5(CLB31_Q5),.Q6(CLB31_Q6),.Q7(CLB31_Q7),.RQ0(CLB31_RQ0),.RQ1(CLB31_RQ1),.RQ2(CLB31_RQ2),.RQ3(CLB31_RQ3),.RQ4(CLB31_RQ4),
	.RQ5(CLB31_RQ5),.RQ6(CLB31_RQ6),.RQ7(CLB31_RQ7),.CYO_0(CLB31_CYO0),.CYO_1(CLB31_CYO1),.CYO_2(CLB31_CYO2),.CYO_3(CLB31_CYO3),.CYO_4(CLB31_CYO4),
	.CYO_5(CLB31_CYO_5),.CYO_6(CLB31_CYO6),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB30_prgm_b_out),.CLB_prgm_b_out(CLB31_prgm_b_out),.carry_chain_out(CLB31_carry_out),.carry_chain_in(carry_chain_in_1),
	.LUT0_WE(CLB31_LUT0_WE),.LUT1_WE(CLB31_LUT1_WE),.LUT2_WE(CLB31_LUT2_WE),.LUT3_WE(CLB31_LUT3_WE),.LUT4_WE(CLB31_LUT4_WE),.LUT5_WE(CLB31_LUT5_WE),
	.LUT6_WE(CLB31_LUT6_WE),.LUT7_WE(CLB31_LUT7_WE),.GWE(GWE));

//Column 2

CLB CLB02(.I0(CLB02_I0),.I1(CLB02_I1),.I2(CLB02_I2),.I3(CLB02_I3),.I4(CLB02_I4),.I5(CLB02_I5),.I6(CLB02_I6),.I7(CLB02_I7),.I8(CLB02_I8),.I9(CLB02_I9),.I10(CLB02_I10),.I11(CLB02_I11),
	.I12(CLB02_I12),.I13(CLB02_I13),.I14(CLB02_I14),.I15(CLB02_I15),.Q0(CLB02_Q0),.Q1(CLB02_Q1),.Q2(CLB02_Q2),.Q3(CLB02_Q3),.Q4(CLB02_Q4),
	.Q5(CLB02_Q5),.Q6(CLB02_Q6),.Q7(CLB02_Q7),.RQ0(CLB02_RQ0),.RQ1(CLB02_RQ1),.RQ2(CLB02_RQ2),.RQ3(CLB02_RQ3),.RQ4(CLB02_RQ4),
	.RQ5(CLB02_RQ5),.RQ6(CLB02_RQ6),.RQ7(CLB02_RQ7),.CYO_0(CLB02_CYO0),.CYO_1(CLB02_CYO1),.CYO_2(CLB02_CYO2),.CYO_3(CLB02_CYO3),.CYO_4(CLB02_CYO4),
	.CYO_5(CLB02_CYO_5),.CYO_6(CLB02_CYO6),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB01_prgm_b_out),.CLB_prgm_b_out(CLB02_prgm_b_out),.carry_chain_out(carry_chain_out_2),.carry_chain_in(CLB12_carry_out),
	.LUT0_WE(CLB02_LUT0_WE),.LUT1_WE(CLB02_LUT1_WE),.LUT2_WE(CLB02_LUT2_WE),.LUT3_WE(CLB02_LUT3_WE),.LUT4_WE(CLB02_LUT4_WE),.LUT5_WE(CLB02_LUT5_WE),
	.LUT6_WE(CLB02_LUT6_WE),.LUT7_WE(CLB02_LUT7_WE),.GWE(GWE));


CLB CLB12(.I0(CLB12_I0),.I1(CLB12_I1),.I2(CLB12_I2),.I3(CLB12_I3),.I4(CLB12_I4),.I5(CLB12_I5),.I6(CLB12_I6),.I7(CLB12_I7),.I8(CLB12_I8),.I9(CLB12_I9),.I10(CLB12_I10),.I11(CLB12_I11),
	.I12(CLB12_I12),.I13(CLB12_I13),.I14(CLB12_I14),.I15(CLB12_I15),.Q0(CLB12_Q0),.Q1(CLB12_Q1),.Q2(CLB12_Q2),.Q3(CLB12_Q3),.Q4(CLB12_Q4),
	.Q5(CLB12_Q5),.Q6(CLB12_Q6),.Q7(CLB12_Q7),.RQ0(CLB12_RQ0),.RQ1(CLB12_RQ1),.RQ2(CLB12_RQ2),.RQ3(CLB12_RQ3),.RQ4(CLB12_RQ4),
	.RQ5(CLB12_RQ5),.RQ6(CLB12_RQ6),.RQ7(CLB12_RQ7),.CYO_0(CLB12_CYO0),.CYO_1(CLB12_CYO1),.CYO_2(CLB12_CYO2),.CYO_3(CLB12_CYO3),.CYO_4(CLB12_CYO4),
	.CYO_5(CLB12_CYO_5),.CYO_6(CLB12_CYO6),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB11_prgm_b_out),.CLB_prgm_b_out(CLB12_prgm_b_out),.carry_chain_out(CLB12_carry_out),.carry_chain_in(CLB22_carry_out),
	.LUT0_WE(CLB12_LUT0_WE),.LUT1_WE(CLB12_LUT1_WE),.LUT2_WE(CLB12_LUT2_WE),.LUT3_WE(CLB12_LUT3_WE),.LUT4_WE(CLB12_LUT4_WE),.LUT5_WE(CLB12_LUT5_WE),
	.LUT6_WE(CLB12_LUT6_WE),.LUT7_WE(CLB12_LUT7_WE),.GWE(GWE));

CLB CLB22(.I0(CLB22_I0),.I1(CLB22_I1),.I2(CLB22_I2),.I3(CLB22_I3),.I4(CLB22_I4),.I5(CLB22_I5),.I6(CLB22_I6),.I7(CLB22_I7),.I8(CLB22_I8),.I9(CLB22_I9),.I10(CLB22_I10),.I11(CLB22_I11),
	.I12(CLB22_I12),.I13(CLB22_I13),.I14(CLB22_I14),.I15(CLB22_I15),.Q0(CLB22_Q0),.Q1(CLB22_Q1),.Q2(CLB22_Q2),.Q3(CLB22_Q3),.Q4(CLB22_Q4),
	.Q5(CLB22_Q5),.Q6(CLB22_Q6),.Q7(CLB22_Q7),.RQ0(CLB22_RQ0),.RQ1(CLB22_RQ1),.RQ2(CLB22_RQ2),.RQ3(CLB22_RQ3),.RQ4(CLB22_RQ4),
	.RQ5(CLB22_RQ5),.RQ6(CLB22_RQ6),.RQ7(CLB22_RQ7),.CYO_0(CLB22_CYO0),.CYO_1(CLB22_CYO1),.CYO_2(CLB22_CYO2),.CYO_3(CLB22_CYO3),.CYO_4(CLB22_CYO4),
	.CYO_5(CLB22_CYO_5),.CYO_6(CLB22_CYO6),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB21_prgm_b_out),.CLB_prgm_b_out(CLB22_prgm_b_out),.carry_chain_out(CLB22_carry_out),.carry_chain_in(CLB32_carry_out),
	.LUT0_WE(CLB22_LUT0_WE),.LUT1_WE(CLB22_LUT1_WE),.LUT2_WE(CLB22_LUT2_WE),.LUT3_WE(CLB22_LUT3_WE),.LUT4_WE(CLB22_LUT4_WE),.LUT5_WE(CLB22_LUT5_WE),
	.LUT6_WE(CLB22_LUT6_WE),.LUT7_WE(CLB22_LUT7_WE),.GWE(GWE));

CLB CLB32(.I0(CLB32_I0),.I1(CLB32_I1),.I2(CLB32_I2),.I3(CLB32_I3),.I4(CLB32_I4),.I5(CLB32_I5),.I6(CLB32_I6),.I7(CLB32_I7),.I8(CLB32_I8),.I9(CLB32_I9),.I10(CLB32_I10),.I11(CLB32_I11),
	.I12(CLB32_I12),.I13(CLB32_I13),.I14(CLB32_I14),.I15(CLB32_I15),.Q0(CLB32_Q0),.Q1(CLB32_Q1),.Q2(CLB32_Q2),.Q3(CLB32_Q3),.Q4(CLB32_Q4),
	.Q5(CLB32_Q5),.Q6(CLB32_Q6),.Q7(CLB32_Q7),.RQ0(CLB32_RQ0),.RQ1(CLB32_RQ1),.RQ2(CLB32_RQ2),.RQ3(CLB32_RQ3),.RQ4(CLB32_RQ4),
	.RQ5(CLB32_RQ5),.RQ6(CLB32_RQ6),.RQ7(CLB32_RQ7),.CYO_0(CLB32_CYO0),.CYO_1(CLB32_CYO1),.CYO_2(CLB32_CYO2),.CYO_3(CLB32_CYO3),.CYO_4(CLB32_CYO4),
	.CYO_5(CLB32_CYO_5),.CYO_6(CLB32_CYO6),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB31_prgm_b_out),.CLB_prgm_b_out(CLB32_prgm_b_out),.carry_chain_out(CLB32_carry_out),.carry_chain_in(carry_chain_in_2),
	.LUT0_WE(CLB32_LUT0_WE),.LUT1_WE(CLB32_LUT1_WE),.LUT2_WE(CLB32_LUT2_WE),.LUT3_WE(CLB32_LUT3_WE),.LUT4_WE(CLB32_LUT4_WE),.LUT5_WE(CLB32_LUT5_WE),
	.LUT6_WE(CLB32_LUT6_WE),.LUT7_WE(CLB32_LUT7_WE),.GWE(GWE));

//Column 3


CLB CLB03(.I0(CLB03_I0),.I1(CLB03_I1),.I2(CLB03_I2),.I3(CLB03_I3),.I4(CLB03_I4),.I5(CLB03_I5),.I6(CLB03_I6),.I7(CLB03_I7),.I8(CLB03_I8),.I9(CLB03_I9),.I10(CLB03_I10),.I11(CLB03_I11),
	.I12(CLB03_I12),.I13(CLB03_I13),.I14(CLB03_I14),.I15(CLB03_I15),.Q0(CLB03_Q0),.Q1(CLB03_Q1),.Q2(CLB03_Q2),.Q3(CLB03_Q3),.Q4(CLB03_Q4),
	.Q5(CLB03_Q5),.Q6(CLB03_Q6),.Q7(CLB03_Q7),.RQ0(CLB03_RQ0),.RQ1(CLB03_RQ1),.RQ2(CLB03_RQ2),.RQ3(CLB03_RQ3),.RQ4(CLB03_RQ4),
	.RQ5(CLB03_RQ5),.RQ6(CLB03_RQ6),.RQ7(CLB03_RQ7),.CYO_0(CLB03_CYO0),.CYO_1(CLB03_CYO1),.CYO_2(CLB03_CYO2),.CYO_3(CLB03_CYO3),.CYO_4(CLB03_CYO4),
	.CYO_5(CLB03_CYO_5),.CYO_6(CLB03_CYO6),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB02_prgm_b_out),.CLB_prgm_b_out(CLB03_prgm_b_out),.carry_chain_out(carry_chain_out_3),.carry_chain_in(CLB13_carry_out),
	.LUT0_WE(CLB03_LUT0_WE),.LUT1_WE(CLB03_LUT1_WE),.LUT2_WE(CLB03_LUT2_WE),.LUT3_WE(CLB03_LUT3_WE),.LUT4_WE(CLB03_LUT4_WE),.LUT5_WE(CLB03_LUT5_WE),
	.LUT6_WE(CLB03_LUT6_WE),.LUT7_WE(CLB03_LUT7_WE),.GWE(GWE));


CLB CLB13(.I0(CLB13_I0),.I1(CLB13_I1),.I2(CLB13_I2),.I3(CLB13_I3),.I4(CLB13_I4),.I5(CLB13_I5),.I6(CLB13_I6),.I7(CLB13_I7),.I8(CLB13_I8),.I9(CLB13_I9),.I10(CLB13_I10),.I11(CLB13_I11),
	.I12(CLB13_I12),.I13(CLB13_I13),.I14(CLB13_I14),.I15(CLB13_I15),.Q0(CLB13_Q0),.Q1(CLB13_Q1),.Q2(CLB13_Q2),.Q3(CLB13_Q3),.Q4(CLB13_Q4),
	.Q5(CLB13_Q5),.Q6(CLB13_Q6),.Q7(CLB13_Q7),.RQ0(CLB13_RQ0),.RQ1(CLB13_RQ1),.RQ2(CLB13_RQ2),.RQ3(CLB13_RQ3),.RQ4(CLB13_RQ4),
	.RQ5(CLB13_RQ5),.RQ6(CLB13_RQ6),.RQ7(CLB13_RQ7),.CYO_0(CLB13_CYO0),.CYO_1(CLB13_CYO1),.CYO_2(CLB13_CYO2),.CYO_3(CLB13_CYO3),.CYO_4(CLB13_CYO4),
	.CYO_5(CLB13_CYO_5),.CYO_6(CLB13_CYO6),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB12_prgm_b_out),.CLB_prgm_b_out(CLB13_prgm_b_out),.carry_chain_out(CLB13_carry_out),.carry_chain_in(CLB23_carry_out),
	.LUT0_WE(CLB13_LUT0_WE),.LUT1_WE(CLB13_LUT1_WE),.LUT2_WE(CLB13_LUT2_WE),.LUT3_WE(CLB13_LUT3_WE),.LUT4_WE(CLB13_LUT4_WE),.LUT5_WE(CLB13_LUT5_WE),
	.LUT6_WE(CLB13_LUT6_WE),.LUT7_WE(CLB13_LUT7_WE),.GWE(GWE)); 


CLB CLB23(.I0(CLB23_I0),.I1(CLB23_I1),.I2(CLB23_I2),.I3(CLB23_I3),.I4(CLB23_I4),.I5(CLB23_I5),.I6(CLB23_I6),.I7(CLB23_I7),.I8(CLB23_I8),.I9(CLB23_I9),.I10(CLB23_I10),.I11(CLB23_I11),
	.I12(CLB23_I12),.I13(CLB23_I13),.I14(CLB23_I14),.I15(CLB23_I15),.Q0(CLB23_Q0),.Q1(CLB23_Q1),.Q2(CLB23_Q2),.Q3(CLB23_Q3),.Q4(CLB23_Q4),
	.Q5(CLB23_Q5),.Q6(CLB23_Q6),.Q7(CLB23_Q7),.RQ0(CLB23_RQ0),.RQ1(CLB23_RQ1),.RQ2(CLB23_RQ2),.RQ3(CLB23_RQ3),.RQ4(CLB23_RQ4),
	.RQ5(CLB23_RQ5),.RQ6(CLB23_RQ6),.RQ7(CLB23_RQ7),.CYO_0(CLB23_CYO0),.CYO_1(CLB23_CYO1),.CYO_2(CLB23_CYO2),.CYO_3(CLB23_CYO3),.CYO_4(CLB23_CYO4),
	.CYO_5(CLB23_CYO_5),.CYO_6(CLB23_CYO6),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB22_prgm_b_out),.CLB_prgm_b_out(CLB23_prgm_b_out),.carry_chain_out(CLB23_carry_out),.carry_chain_in(CLB33_carry_out),
	.LUT0_WE(CLB23_LUT0_WE),.LUT1_WE(CLB23_LUT1_WE),.LUT2_WE(CLB23_LUT2_WE),.LUT3_WE(CLB23_LUT3_WE),.LUT4_WE(CLB23_LUT4_WE),.LUT5_WE(CLB23_LUT5_WE),
	.LUT6_WE(CLB23_LUT6_WE),.LUT7_WE(CLB23_LUT7_WE),.GWE(GWE)); 


CLB CLB33(.I0(CLB33_I0),.I1(CLB33_I1),.I2(CLB33_I2),.I3(CLB33_I3),.I4(CLB33_I4),.I5(CLB33_I5),.I6(CLB33_I6),.I7(CLB33_I7),.I8(CLB33_I8),.I9(CLB33_I9),.I10(CLB33_I10),.I11(CLB33_I11),
	.I12(CLB33_I12),.I13(CLB33_I13),.I14(CLB33_I14),.I15(CLB33_I15),.Q0(CLB33_Q0),.Q1(CLB33_Q1),.Q2(CLB33_Q2),.Q3(CLB33_Q3),.Q4(CLB33_Q4),
	.Q5(CLB33_Q5),.Q6(CLB33_Q6),.Q7(CLB33_Q7),.RQ0(CLB33_RQ0),.RQ1(CLB33_RQ1),.RQ2(CLB33_RQ2),.RQ3(CLB33_RQ3),.RQ4(CLB33_RQ4),
	.RQ5(CLB33_RQ5),.RQ6(CLB33_RQ6),.RQ7(CLB33_RQ7),.CYO_0(CLB33_CYO0),.CYO_1(CLB33_CYO1),.CYO_2(CLB33_CYO2),.CYO_3(CLB33_CYO3),.CYO_4(CLB33_CYO4),
	.CYO_5(CLB33_CYO_5),.CYO_6(CLB33_CYO6),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB32_prgm_b_out),.CLB_prgm_b_out(CLB_prgm_b_out),.carry_chain_out(CLB33_carry_out),.carry_chain_in(carry_chain_in_3),
	.LUT0_WE(CLB33_LUT0_WE),.LUT1_WE(CLB33_LUT1_WE),.LUT2_WE(CLB33_LUT2_WE),.LUT3_WE(CLB33_LUT3_WE),.LUT4_WE(CLB33_LUT4_WE),.LUT5_WE(CLB33_LUT5_WE),
	.LUT6_WE(CLB33_LUT6_WE),.LUT7_WE(CLB33_LUT7_WE),.GWE(GWE));
//
	
//switch blocks

wire SB00_prgm_b_out,SB01_prgm_b_out,SB02_prgm_b_out,SB03_prgm_b_out,SB04_prgm_b_out;
wire SB10_prgm_b_out,SB11_prgm_b_out,SB12_prgm_b_out,SB13_prgm_b_out,SB14_prgm_b_out;
wire SB20_prgm_b_out,SB21_prgm_b_out,SB22_prgm_b_out,SB23_prgm_b_out,SB24_prgm_b_out;
wire SB30_prgm_b_out,SB31_prgm_b_out,SB32_prgm_b_out,SB33_prgm_b_out,SB34_prgm_b_out;
wire SB40_prgm_b_out,SB41_prgm_b_out,SB42_prgm_b_out,SB43_prgm_b_out;

switch_block SB00(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(sb_prgm_b_in),.sb_prgm_b_out(SB00_prgm_b_out),
                                 .N0(IO00_SB00_0),.N1(IO00_SB00_1),.N2(IO00_SB00_2),.N3(IO00_SB00_3),.N4(IO00_SB00_4),.N5(IO00_SB00_5),.N6(IO00_SB00_6),.N7(IO00_SB00_7),
                                 .E0(SB00_SB01_0),.E1(SB00_SB01_1),.E2(SB00_SB01_2),.E3(SB00_SB01_3),.E4(SB00_SB01_4),.E5(SB00_SB01_5),.E6(SB00_SB01_6),.E7(SB00_SB01_7),
                                 .S0(SB00_SB10_0),.S1(SB00_SB10_1),.S2(SB00_SB10_2),.S3(SB00_SB10_3),.S4(SB00_SB10_4),.S5(SB00_SB10_5),.S6(SB00_SB10_6),.S7(SB00_SB10_7),
                                 .W0(IO10_SB00_0),.W1(IO10_SB00_1),.W2(IO10_SB00_2),.W3(IO10_SB00_3),.W4(IO10_SB00_4),.W5(IO10_SB00_5),.W6(IO10_SB00_6),.W7(IO10_SB00_7));


switch_block SB01(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB00_prgm_b_out),.sb_prgm_b_out(SB01_prgm_b_out),
                                 .N0(IO01_SB01_0),.N1(IO01_SB01_1),.N2(IO01_SB01_2),.N3(IO01_SB01_3),.N4(IO01_SB01_4),.N5(IO01_SB01_5),.N6(IO01_SB01_6),.N7(IO01_SB01_7),
                                 .E0(SB01_SB02_0),.E1(SB01_SB02_1),.E2(SB01_SB02_2),.E3(SB01_SB02_3),.E4(SB01_SB02_4),.E5(SB01_SB02_5),.E6(SB01_SB02_6),.E7(SB01_SB02_7),
                                 .S0(SB01_SB11_0),.S1(SB01_SB11_1),.S2(SB01_SB11_2),.S3(SB01_SB11_3),.S4(SB01_SB11_4),.S5(SB01_SB11_5),.S6(SB01_SB11_6),.S7(SB01_SB11_7),
                                 .W0(SB00_SB01_0),.W1(SB00_SB01_1),.W2(SB00_SB01_2),.W3(SB00_SB01_3),.W4(SB00_SB01_4),.W5(SB00_SB01_5),.W6(SB00_SB01_6),.W7(SB00_SB01_7));

switch_block SB02(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB01_prgm_b_out),.sb_prgm_b_out(SB02_prgm_b_out),
                                 .N0(IO02_SB02_0),.N1(IO02_SB02_1),.N2(IO02_SB02_2),.N3(IO02_SB02_3),.N4(IO02_SB02_4),.N5(IO02_SB02_5),.N6(IO02_SB02_6),.N7(IO02_SB02_7),
                                 .E0(SB02_SB03_0),.E1(SB02_SB03_1),.E2(SB02_SB03_2),.E3(SB02_SB03_3),.E4(SB02_SB03_4),.E5(SB02_SB03_5),.E6(SB02_SB03_6),.E7(SB02_SB03_7),
                                 .S0(SB02_SB12_0),.S1(SB02_SB12_1),.S2(SB02_SB12_2),.S3(SB02_SB12_3),.S4(SB02_SB12_4),.S5(SB02_SB12_5),.S6(SB02_SB12_6),.S7(SB02_SB12_7),
                                 .W0(SB01_SB02_0),.W1(SB01_SB02_1),.W2(SB01_SB02_2),.W3(SB01_SB02_3),.W4(SB01_SB02_4),.W5(SB01_SB02_5),.W6(SB01_SB02_6),.W7(SB01_SB02_7));

switch_block SB03(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB02_prgm_b_out),.sb_prgm_b_out(SB03_prgm_b_out),
                                 .N0(IO03_SB03_0),.N1(IO03_SB03_1),.N2(IO03_SB03_2),.N3(IO03_SB03_3),.N4(IO03_SB03_4),.N5(IO03_SB03_5),.N6(IO03_SB03_6),.N7(IO03_SB02_7),
                                 .E0(SB03_SB04_0),.E1(SB03_SB04_1),.E2(SB03_SB04_2),.E3(SB03_SB04_3),.E4(SB03_SB04_4),.E5(SB03_SB04_5),.E6(SB03_SB04_6),.E7(SB03_SB04_7),
                                 .S0(SB03_SB13_0),.S1(SB03_SB13_1),.S2(SB03_SB13_2),.S3(SB03_SB13_3),.S4(SB03_SB13_4),.S5(SB03_SB13_5),.S6(SB03_SB13_6),.S7(SB03_SB13_7),
                                 .W0(SB02_SB03_0),.W1(SB02_SB03_1),.W2(SB02_SB03_2),.W3(SB02_SB03_3),.W4(SB02_SB03_4),.W5(SB02_SB03_5),.W6(SB02_SB03_6),.W7(SB02_SB03_7));

switch_block SB04(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB03_prgm_b_out),.sb_prgm_b_out(SB04_prgm_b_out),
                                 .N0(IO04_SB04_0),.N1(IO04_SB04_1),.N2(IO04_SB04_2),.N3(IO04_SB04_3),.N4(IO04_SB04_4),.N5(IO04_SB04_5),.N6(IO04_SB04_6),.N7(IO04_SB04_7),
                                 .E0(IO11_SB04_0),.E1(IO11_SB04_1),.E2(IO11_SB04_2),.E3(IO11_SB04_3),.E4(IO11_SB04_4),.E5(IO11_SB04_5),.E6(IO11_SB04_6),.E7(IO11_SB04_7),
                                 .S0(SB04_SB14_0),.S1(SB04_SB14_1),.S2(SB04_SB14_2),.S3(SB04_SB14_3),.S4(SB04_SB14_4),.S5(SB04_SB14_5),.S6(SB04_SB14_6),.S7(SB04_SB14_7),
                                 .W0(SB03_SB04_0),.W1(SB03_SB04_1),.W2(SB03_SB04_2),.W3(SB03_SB04_3),.W4(SB03_SB04_4),.W5(SB03_SB04_5),.W6(SB03_SB04_6),.W7(SB03_SB04_7));



switch_block SB10(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB04_prgm_b_out),.sb_prgm_b_out(SB10_prgm_b_out),
                                 .N0(SB00_SB10_0),.N1(SB00_SB10_1),.N2(SB00_SB10_2),.N3(SB00_SB10_3),.N4(SB00_SB10_4),.N5(SB00_SB10_5),.N6(SB00_SB10_6),.N7(SB00_SB10_7),
                                 .E0(SB10_SB11_0),.E1(SB10_SB11_1),.E2(SB10_SB11_2),.E3(SB10_SB11_3),.E4(SB10_SB11_4),.E5(SB10_SB11_5),.E6(SB10_SB11_6),.E7(SB10_SB11_7),
                                 .S0(SB10_SB20_0),.S1(SB10_SB20_1),.S2(SB10_SB20_2),.S3(SB10_SB20_3),.S4(SB10_SB20_4),.S5(SB10_SB20_5),.S6(SB10_SB20_6),.S7(SB10_SB20_7),
                                 .W0(IO20_SB10_0),.W1(IO20_SB10_1),.W2(IO20_SB10_2),.W3(IO20_SB10_3),.W4(IO20_SB10_4),.W5(IO20_SB10_5),.W6(IO20_SB10_6),.W7(IO20_SB10_7));

switch_block SB11(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB10_prgm_b_out),.sb_prgm_b_out(SB11_prgm_b_out),
                                 .N0(SB01_SB11_0),.N1(SB01_SB11_1),.N2(SB01_SB11_2),.N3(SB01_SB11_3),.N4(SB01_SB11_4),.N5(SB01_SB11_5),.N6(SB01_SB11_6),.N7(SB01_SB11_7),
                                 .E0(SB11_SB12_0),.E1(SB11_SB12_1),.E2(SB11_SB12_2),.E3(SB11_SB12_3),.E4(SB11_SB12_4),.E5(SB11_SB12_5),.E6(SB11_SB12_6),.E7(SB11_SB12_7),
                                 .S0(SB11_SB21_0),.S1(SB11_SB21_1),.S2(SB11_SB21_2),.S3(SB11_SB21_3),.S4(SB11_SB21_4),.S5(SB11_SB21_5),.S6(SB11_SB21_6),.S7(SB11_SB21_7),
                                 .W0(SB10_SB11_0),.W1(SB10_SB11_1),.W2(SB10_SB11_2),.W3(SB10_SB11_3),.W4(SB10_SB11_4),.W5(SB10_SB11_5),.W6(SB10_SB11_6),.W7(SB10_SB11_7));

switch_block SB12(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB11_prgm_b_out),.sb_prgm_b_out(SB12_prgm_b_out),
                                 .N0(SB02_SB12_0),.N1(SB02_SB12_1),.N2(SB02_SB12_2),.N3(SB02_SB12_3),.N4(SB02_SB12_4),.N5(SB02_SB12_5),.N6(SB02_SB12_6),.N7(SB02_SB12_7),
                                 .E0(SB12_SB13_0),.E1(SB12_SB13_1),.E2(SB12_SB13_2),.E3(SB12_SB13_3),.E4(SB12_SB13_4),.E5(SB12_SB13_5),.E6(SB12_SB13_6),.E7(SB12_SB13_7),
                                 .S0(SB12_SB22_0),.S1(SB12_SB22_1),.S2(SB12_SB22_2),.S3(SB12_SB22_3),.S4(SB12_SB22_4),.S5(SB12_SB22_5),.S6(SB12_SB22_6),.S7(SB12_SB22_7),
                                 .W0(SB11_SB12_0),.W1(SB11_SB12_1),.W2(SB11_SB12_2),.W3(SB11_SB12_3),.W4(SB11_SB12_4),.W5(SB11_SB12_5),.W6(SB11_SB12_6),.W7(SB11_SB12_7));

switch_block SB13(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB12_prgm_b_out),.sb_prgm_b_out(SB13_prgm_b_out),
                                 .N0(SB03_SB13_0),.N1(SB03_SB13_1),.N2(SB03_SB13_2),.N3(SB03_SB13_3),.N4(SB03_SB13_4),.N5(SB03_SB13_5),.N6(SB03_SB13_6),.N7(IO03_SB02_7),
                                 .E0(SB13_SB14_0),.E1(SB13_SB14_1),.E2(SB13_SB14_2),.E3(SB13_SB14_3),.E4(SB13_SB14_4),.E5(SB13_SB14_5),.E6(SB13_SB14_6),.E7(SB13_SB14_7),
                                 .S0(SB13_SB23_0),.S1(SB13_SB23_1),.S2(SB13_SB23_2),.S3(SB13_SB23_3),.S4(SB13_SB23_4),.S5(SB13_SB23_5),.S6(SB13_SB23_6),.S7(SB13_SB23_7),
                                 .W0(SB12_SB13_0),.W1(SB12_SB13_1),.W2(SB12_SB13_2),.W3(SB12_SB13_3),.W4(SB12_SB13_4),.W5(SB12_SB13_5),.W6(SB12_SB13_6),.W7(SB12_SB13_7));

switch_block SB14(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB13_prgm_b_out),.sb_prgm_b_out(SB14_prgm_b_out),
                                 .N0(SB04_SB14_0),.N1(SB04_SB14_1),.N2(SB04_SB14_2),.N3(SB04_SB14_3),.N4(SB04_SB14_4),.N5(SB04_SB14_5),.N6(SB04_SB14_6),.N7(SB04_SB14_7),
                                 .E0(IO21_SB14_0),.E1(IO21_SB14_1),.E2(IO21_SB14_2),.E3(IO21_SB14_3),.E4(IO21_SB14_4),.E5(IO21_SB14_5),.E6(IO21_SB14_6),.E7(IO21_SB14_7),
                                 .S0(SB14_SB24_0),.S1(SB14_SB24_1),.S2(SB14_SB24_2),.S3(SB14_SB24_3),.S4(SB14_SB24_4),.S5(SB14_SB24_5),.S6(SB14_SB24_6),.S7(SB14_SB24_7),
                                 .W0(SB13_SB14_0),.W1(SB13_SB14_1),.W2(SB13_SB14_2),.W3(SB13_SB14_3),.W4(SB13_SB14_4),.W5(SB13_SB14_5),.W6(SB13_SB14_6),.W7(SB13_SB14_7));



switch_block SB20(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB14_prgm_b_out),.sb_prgm_b_out(SB20_prgm_b_out),
                                 .N0(SB10_SB20_0),.N1(SB10_SB20_1),.N2(SB10_SB20_2),.N3(SB10_SB20_3),.N4(SB10_SB20_4),.N5(SB10_SB20_5),.N6(SB10_SB20_6),.N7(SB10_SB20_7),
                                 .E0(SB20_SB21_0),.E1(SB20_SB21_1),.E2(SB20_SB21_2),.E3(SB20_SB21_3),.E4(SB20_SB21_4),.E5(SB20_SB21_5),.E6(SB20_SB21_6),.E7(SB20_SB21_7),
                                 .S0(SB20_SB30_0),.S1(SB20_SB30_1),.S2(SB20_SB30_2),.S3(SB20_SB30_3),.S4(SB20_SB30_4),.S5(SB20_SB30_5),.S6(SB20_SB30_6),.S7(SB20_SB30_7),
                                 .W0(IO30_SB20_0),.W1(IO30_SB20_1),.W2(IO30_SB20_2),.W3(IO30_SB20_3),.W4(IO30_SB20_4),.W5(IO30_SB20_5),.W6(IO30_SB20_6),.W7(IO30_SB20_7));

switch_block SB21(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB20_prgm_b_out),.sb_prgm_b_out(SB21_prgm_b_out),
                                 .N0(SB11_SB21_0),.N1(SB11_SB21_1),.N2(SB11_SB21_2),.N3(SB11_SB21_3),.N4(SB11_SB21_4),.N5(SB11_SB21_5),.N6(SB11_SB21_6),.N7(SB11_SB21_7),
                                 .E0(SB21_SB22_0),.E1(SB21_SB22_1),.E2(SB21_SB22_2),.E3(SB21_SB22_3),.E4(SB21_SB22_4),.E5(SB21_SB22_5),.E6(SB21_SB22_6),.E7(SB21_SB22_7),
                                 .S0(SB21_SB31_0),.S1(SB21_SB31_1),.S2(SB21_SB31_2),.S3(SB21_SB31_3),.S4(SB21_SB31_4),.S5(SB21_SB31_5),.S6(SB21_SB31_6),.S7(SB21_SB31_7),
                                 .W0(SB20_SB21_0),.W1(SB20_SB21_1),.W2(SB20_SB21_2),.W3(SB20_SB21_3),.W4(SB20_SB21_4),.W5(SB20_SB21_5),.W6(SB20_SB21_6),.W7(SB20_SB21_7));

switch_block SB22(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB21_prgm_b_out),.sb_prgm_b_out(SB22_prgm_b_out),
                                 .N0(SB12_SB22_0),.N1(SB12_SB22_1),.N2(SB12_SB22_2),.N3(SB12_SB22_3),.N4(SB12_SB22_4),.N5(SB12_SB22_5),.N6(SB12_SB22_6),.N7(SB12_SB22_7),
                                 .E0(SB22_SB23_0),.E1(SB22_SB23_1),.E2(SB22_SB23_2),.E3(SB22_SB23_3),.E4(SB22_SB23_4),.E5(SB22_SB23_5),.E6(SB22_SB23_6),.E7(SB22_SB23_7),
                                 .S0(SB22_SB32_0),.S1(SB22_SB32_1),.S2(SB22_SB32_2),.S3(SB22_SB32_3),.S4(SB22_SB32_4),.S5(SB22_SB32_5),.S6(SB22_SB32_6),.S7(SB22_SB32_7),
                                 .W0(SB21_SB22_0),.W1(SB21_SB22_1),.W2(SB21_SB22_2),.W3(SB21_SB22_3),.W4(SB21_SB22_4),.W5(SB21_SB22_5),.W6(SB21_SB22_6),.W7(SB21_SB22_7));

switch_block SB23(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB22_prgm_b_out),.sb_prgm_b_out(SB23_prgm_b_out),
                                 .N0(SB13_SB23_0),.N1(SB13_SB23_1),.N2(SB13_SB23_2),.N3(SB13_SB23_3),.N4(SB13_SB23_4),.N5(SB13_SB23_5),.N6(SB13_SB23_6),.N7(SB13_SB23_7),
                                 .E0(SB23_SB24_0),.E1(SB23_SB24_1),.E2(SB23_SB24_2),.E3(SB23_SB24_3),.E4(SB23_SB24_4),.E5(SB23_SB24_5),.E6(SB23_SB24_6),.E7(SB23_SB24_7),
                                 .S0(SB23_SB33_0),.S1(SB23_SB33_1),.S2(SB23_SB33_2),.S3(SB23_SB33_3),.S4(SB23_SB33_4),.S5(SB23_SB33_5),.S6(SB23_SB33_6),.S7(SB23_SB33_7),
                                 .W0(SB22_SB23_0),.W1(SB22_SB23_1),.W2(SB22_SB23_2),.W3(SB22_SB23_3),.W4(SB22_SB23_4),.W5(SB22_SB23_5),.W6(SB22_SB23_6),.W7(SB22_SB23_7));

switch_block SB24(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB23_prgm_b_out),.sb_prgm_b_out(SB24_prgm_b_out),
                                 .N0(SB14_SB24_0),.N1(SB14_SB24_1),.N2(SB14_SB24_2),.N3(SB14_SB24_3),.N4(SB14_SB24_4),.N5(SB14_SB24_5),.N6(SB14_SB24_6),.N7(SB14_SB24_7),
                                 .E0(IO31_SB24_0),.E1(IO31_SB24_1),.E2(IO31_SB24_2),.E3(IO31_SB24_3),.E4(IO31_SB24_4),.E5(IO31_SB24_5),.E6(IO31_SB24_6),.E7(IO31_SB24_7),
                                 .S0(SB24_SB34_0),.S1(SB24_SB34_1),.S2(SB24_SB34_2),.S3(SB24_SB34_3),.S4(SB24_SB34_4),.S5(SB24_SB34_5),.S6(SB24_SB34_6),.S7(SB24_SB34_7),
                                 .W0(SB23_SB24_0),.W1(SB23_SB24_1),.W2(SB23_SB24_2),.W3(SB23_SB24_3),.W4(SB23_SB24_4),.W5(SB23_SB24_5),.W6(SB23_SB24_6),.W7(SB23_SB24_7));


switch_block SB30(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB24_prgm_b_out),.sb_prgm_b_out(SB30_prgm_b_out),
                                 .N0(SB20_SB30_0),.N1(SB20_SB30_1),.N2(SB20_SB30_2),.N3(SB20_SB30_3),.N4(SB20_SB30_4),.N5(SB20_SB30_5),.N6(SB20_SB30_6),.N7(SB20_SB30_7),
                                 .E0(SB30_SB31_0),.E1(SB30_SB31_1),.E2(SB30_SB31_2),.E3(SB30_SB31_3),.E4(SB30_SB31_4),.E5(SB30_SB31_5),.E6(SB30_SB31_6),.E7(SB30_SB31_7),
                                 .S0(SB30_SB40_0),.S1(SB30_SB40_1),.S2(SB30_SB40_2),.S3(SB30_SB40_3),.S4(SB30_SB40_4),.S5(SB30_SB40_5),.S6(SB30_SB40_6),.S7(SB30_SB40_7),
                                 .W0(IO40_SB30_0),.W1(IO40_SB30_1),.W2(IO40_SB30_2),.W3(IO40_SB30_3),.W4(IO40_SB30_4),.W5(IO40_SB30_5),.W6(IO40_SB30_6),.W7(IO40_SB30_7));

switch_block SB31(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB30_prgm_b_out),.sb_prgm_b_out(SB31_prgm_b_out),
                                 .N0(SB21_SB31_0),.N1(SB21_SB31_1),.N2(SB21_SB31_2),.N3(SB21_SB31_3),.N4(SB21_SB31_4),.N5(SB21_SB31_5),.N6(SB21_SB31_6),.N7(SB21_SB31_7),
                                 .E0(SB31_SB32_0),.E1(SB31_SB32_1),.E2(SB31_SB32_2),.E3(SB31_SB32_3),.E4(SB31_SB32_4),.E5(SB31_SB32_5),.E6(SB31_SB32_6),.E7(SB31_SB32_7),
                                 .S0(SB31_SB41_0),.S1(SB31_SB41_1),.S2(SB31_SB41_2),.S3(SB31_SB41_3),.S4(SB31_SB41_4),.S5(SB31_SB41_5),.S6(SB31_SB41_6),.S7(SB31_SB41_7),
                                 .W0(SB30_SB31_0),.W1(SB30_SB31_1),.W2(SB30_SB31_2),.W3(SB30_SB31_3),.W4(SB30_SB31_4),.W5(SB30_SB31_5),.W6(SB30_SB31_6),.W7(SB30_SB31_7));

switch_block SB32(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB31_prgm_b_out),.sb_prgm_b_out(SB32_prgm_b_out),
                                 .N0(SB22_SB32_0),.N1(SB22_SB32_1),.N2(SB22_SB32_2),.N3(SB22_SB32_3),.N4(SB22_SB32_4),.N5(SB22_SB32_5),.N6(SB22_SB32_6),.N7(SB22_SB32_7),
                                 .E0(SB32_SB33_0),.E1(SB32_SB33_1),.E2(SB32_SB33_2),.E3(SB32_SB33_3),.E4(SB32_SB33_4),.E5(SB32_SB33_5),.E6(SB32_SB33_6),.E7(SB32_SB33_7),
                                 .S0(SB32_SB42_0),.S1(SB32_SB42_1),.S2(SB32_SB42_2),.S3(SB32_SB42_3),.S4(SB32_SB42_4),.S5(SB32_SB42_5),.S6(SB32_SB42_6),.S7(SB32_SB42_7),
                                 .W0(SB31_SB32_0),.W1(SB31_SB32_1),.W2(SB31_SB32_2),.W3(SB31_SB32_3),.W4(SB31_SB32_4),.W5(SB31_SB32_5),.W6(SB31_SB32_6),.W7(SB31_SB32_7));

switch_block SB33(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB32_prgm_b_out),.sb_prgm_b_out(SB33_prgm_b_out),
                                 .N0(SB23_SB33_0),.N1(SB23_SB33_1),.N2(SB23_SB33_2),.N3(SB23_SB33_3),.N4(SB23_SB33_4),.N5(SB23_SB33_5),.N6(SB23_SB33_6),.N7(SB23_SB33_7),
                                 .E0(SB33_SB34_0),.E1(SB33_SB34_1),.E2(SB33_SB34_2),.E3(SB33_SB34_3),.E4(SB33_SB34_4),.E5(SB33_SB34_5),.E6(SB33_SB34_6),.E7(SB33_SB34_7),
                                 .S0(SB33_SB43_0),.S1(SB33_SB43_1),.S2(SB33_SB43_2),.S3(SB33_SB43_3),.S4(SB33_SB43_4),.S5(SB33_SB43_5),.S6(SB33_SB43_6),.S7(SB33_SB43_7),
                                 .W0(SB32_SB33_0),.W1(SB32_SB33_1),.W2(SB32_SB33_2),.W3(SB32_SB33_3),.W4(SB32_SB33_4),.W5(SB32_SB33_5),.W6(SB32_SB33_6),.W7(SB32_SB33_7));

switch_block SB34(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB33_prgm_b_out),.sb_prgm_b_out(SB34_prgm_b_out),
                                 .N0(SB24_SB34_0),.N1(SB24_SB34_1),.N2(SB24_SB34_2),.N3(SB24_SB34_3),.N4(SB24_SB34_4),.N5(SB24_SB34_5),.N6(SB24_SB34_6),.N7(SB24_SB34_7),
                                 .E0(IO41_SB34_0),.E1(IO41_SB34_1),.E2(IO41_SB34_2),.E3(IO41_SB34_3),.E4(IO41_SB34_4),.E5(IO41_SB34_5),.E6(IO41_SB34_6),.E7(IO41_SB34_7),
                                 .S0(SB34_SB44_0),.S1(SB34_SB44_1),.S2(SB34_SB44_2),.S3(SB34_SB44_3),.S4(SB34_SB44_4),.S5(SB34_SB44_5),.S6(SB34_SB44_6),.S7(SB34_SB44_7),
                                 .W0(SB33_SB34_0),.W1(SB33_SB34_1),.W2(SB33_SB34_2),.W3(SB33_SB34_3),.W4(SB33_SB34_4),.W5(SB33_SB34_5),.W6(SB33_SB34_6),.W7(SB33_SB34_7));

switch_block SB40(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB34_prgm_b_out),.sb_prgm_b_out(SB40_prgm_b_out),
                                 .N0(SB30_SB40_0),.N1(SB30_SB40_1),.N2(SB30_SB40_2),.N3(SB30_SB40_3),.N4(SB30_SB40_4),.N5(SB30_SB40_5),.N6(SB30_SB40_6),.N7(SB30_SB40_7),
                                 .E0(SB40_SB41_0),.E1(SB40_SB41_1),.E2(SB40_SB41_2),.E3(SB40_SB41_3),.E4(SB40_SB41_4),.E5(SB40_SB41_5),.E6(SB40_SB41_6),.E7(SB40_SB41_7),
                                 .S0(IO60_SB40_0),.S1(IO60_SB40_1),.S2(IO60_SB40_2),.S3(IO60_SB40_3),.S4(IO60_SB40_4),.S5(IO60_SB40_5),.S6(IO60_SB40_6),.S7(IO60_SB40_7),
                                 .W0(IO50_SB40_0),.W1(IO50_SB40_1),.W2(IO50_SB40_2),.W3(IO50_SB40_3),.W4(IO50_SB40_4),.W5(IO50_SB40_5),.W6(IO50_SB40_6),.W7(IO50_SB40_7));

switch_block SB41(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB40_prgm_b_out),.sb_prgm_b_out(SB41_prgm_b_out),
                                 .N0(SB31_SB41_0),.N1(SB31_SB41_1),.N2(SB31_SB41_2),.N3(SB31_SB41_3),.N4(SB31_SB41_4),.N5(SB31_SB41_5),.N6(SB31_SB41_6),.N7(SB31_SB41_7),
                                 .E0(SB41_SB42_0),.E1(SB41_SB42_1),.E2(SB41_SB42_2),.E3(SB41_SB42_3),.E4(SB41_SB42_4),.E5(SB41_SB42_5),.E6(SB41_SB42_6),.E7(SB41_SB42_7),
                                 .S0(IO61_SB41_0),.S1(IO61_SB41_1),.S2(IO61_SB41_2),.S3(IO61_SB41_3),.S4(IO61_SB41_4),.S5(IO61_SB41_5),.S6(IO61_SB41_6),.S7(IO61_SB41_7),
                                 .W0(SB40_SB41_0),.W1(SB40_SB41_1),.W2(SB40_SB41_2),.W3(SB40_SB41_3),.W4(SB40_SB41_4),.W5(SB40_SB41_5),.W6(SB40_SB41_6),.W7(SB40_SB41_7));

switch_block SB42(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB41_prgm_b_out),.sb_prgm_b_out(SB42_prgm_b_out),
                                 .N0(SB32_SB42_0),.N1(SB32_SB42_1),.N2(SB32_SB42_2),.N3(SB32_SB42_3),.N4(SB32_SB42_4),.N5(SB32_SB42_5),.N6(SB32_SB42_6),.N7(SB32_SB42_7),
                                 .E0(SB42_SB43_0),.E1(SB42_SB43_1),.E2(SB42_SB43_2),.E3(SB42_SB43_3),.E4(SB42_SB43_4),.E5(SB42_SB43_5),.E6(SB42_SB43_6),.E7(SB42_SB43_7),
                                 .S0(IO62_SB42_0),.S1(IO62_SB42_1),.S2(IO62_SB42_2),.S3(IO62_SB42_3),.S4(IO62_SB42_4),.S5(IO62_SB42_5),.S6(IO62_SB42_6),.S7(IO62_SB42_7),
                                 .W0(SB41_SB42_0),.W1(SB41_SB42_1),.W2(SB41_SB42_2),.W3(SB41_SB42_3),.W4(SB41_SB42_4),.W5(SB41_SB42_5),.W6(SB41_SB42_6),.W7(SB41_SB42_7));

switch_block SB43(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB42_prgm_b_out),.sb_prgm_b_out(SB43_prgm_b_out),
                                 .N0(SB33_SB43_0),.N1(SB33_SB43_1),.N2(SB33_SB43_2),.N3(SB33_SB43_3),.N4(SB33_SB43_4),.N5(SB33_SB43_5),.N6(SB33_SB43_6),.N7(SB33_SB43_7),
                                 .E0(SB43_SB44_0),.E1(SB43_SB44_1),.E2(SB43_SB44_2),.E3(SB43_SB44_3),.E4(SB43_SB44_4),.E5(SB43_SB44_5),.E6(SB43_SB44_6),.E7(SB43_SB44_7),
                                 .S0(IO63_SB43_0),.S1(IO63_SB43_1),.S2(IO63_SB43_2),.S3(IO63_SB43_3),.S4(IO63_SB43_4),.S5(IO63_SB43_5),.S6(IO63_SB43_6),.S7(IO63_SB43_7),
                                 .W0(SB42_SB43_0),.W1(SB42_SB43_1),.W2(SB42_SB43_2),.W3(SB42_SB43_3),.W4(SB42_SB43_4),.W5(SB42_SB43_5),.W6(SB42_SB43_6),.W7(SB42_SB43_7));

switch_block SB44(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(SB43_prgm_b_out),.sb_prgm_b_out(sb_prgm_b_out),
                                 .N0(SB34_SB44_0),.N1(SB34_SB44_1),.N2(SB34_SB44_2),.N3(SB34_SB44_3),.N4(SB34_SB44_4),.N5(SB34_SB44_5),.N6(SB34_SB44_6),.N7(SB34_SB44_7),
                                 .E0(IO51_SB44_0),.E1(IO51_SB44_1),.E2(IO51_SB44_2),.E3(IO51_SB44_3),.E4(IO51_SB44_4),.E5(IO51_SB44_5),.E6(IO51_SB44_6),.E7(IO51_SB44_7),
                                 .S0(IO64_SB44_0),.S1(IO64_SB44_1),.S2(IO64_SB44_2),.S3(IO64_SB44_3),.S4(IO64_SB44_4),.S5(IO64_SB44_5),.S6(IO64_SB44_6),.S7(IO64_SB44_7),
                                 .W0(SB43_SB44_0),.W1(SB43_SB44_1),.W2(SB43_SB44_2),.W3(SB43_SB44_3),.W4(SB43_SB44_4),.W5(SB43_SB44_5),.W6(SB43_SB44_6),.W7(SB43_SB44_7));

endmodule
