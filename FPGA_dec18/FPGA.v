module FPGA(V00_0,V00_1,V00_2,V00_3,V00_4,V00_5,V00_6,V00_7,V01_0,V01_1,V01_2,V01_3,V01_4,V01_5,V01_6,V01_7,
	    V02_0,V02_1,V02_2,V02_3,V02_4,V02_5,V02_6,V02_7,V10_0,V10_1,V10_2,V10_3,V10_4,V10_5,V10_6,V10_7,
	    V11_0,V11_1,V11_2,V11_3,V11_4,V11_5,V11_6,V11_7,V12_0,V12_1,V12_2,V12_3,V12_4,V12_5,V12_6,V12_7,
            H00_0,H00_1,H00_2,H00_3,H00_4,H00_5,H00_6,H00_7,H01_0,H01_1,H01_2,H01_3,H01_4,H01_5,H01_6,H01_7,
	    H10_0,H10_1,H10_2,H10_3,H10_4,H10_5,H10_6,H10_7,H11_0,H11_1,H11_2,H11_3,H11_4,H11_5,H11_6,H11_7,
	    H20_0,H20_1,H20_2,H20_3,H20_4,H20_5,H20_6,H20_7,H21_0,H21_1,H21_2,H21_3,H21_4,H21_5,H21_6,H21_7,
            clk,reset,prgm_b,CLB_prgm_b,cb_prgm_b,sb_prgm_b,sb_prgm_b_2,bit_in_CLB,bit_in_CB,sb_prgm_b_in,cb_prgm_b_in,CLB_prgm_b_in,bit_in_SB,bit_in_SB_2,
		io_prgm_b,bit_in_IO,io_prgm_b_in);

input clk,reset,prgm_b,bit_in_CLB,bit_in_CB,CLB_prgm_b,CLB_prgm_b_in,cb_prgm_b,cb_prgm_b_in,sb_prgm_b_in,io_prgm_b_in,bit_in_SB,
	io_prgm_b,sb_prgm_b,bit_in_SB_2,sb_prgm_b_2,bit_in_IO;

inout V00_0,V00_1,V00_2,V00_3,V00_4,V00_5,V00_6,V00_7,V01_0,V01_1,V01_2,V01_3,V01_4,V01_5,V01_6,V01_7,
	    V02_0,V02_1,V02_2,V02_3,V02_4,V02_5,V02_6,V02_7,V10_0,V10_1,V10_2,V10_3,V10_4,V10_5,V10_6,V10_7,
	    V11_0,V11_1,V11_2,V11_3,V11_4,V11_5,V11_6,V11_7,V12_0,V12_1,V12_2,V12_3,V12_4,V12_5,V12_6,V12_7,
            H00_0,H00_1,H00_2,H00_3,H00_4,H00_5,H00_6,H00_7,H01_0,H01_1,H01_2,H01_3,H01_4,H01_5,H01_6,H01_7,
	    H10_0,H10_1,H10_2,H10_3,H10_4,H10_5,H10_6,H10_7,H11_0,H11_1,H11_2,H11_3,H11_4,H11_5,H11_6,H11_7,
	    H20_0,H20_1,H20_2,H20_3,H20_4,H20_5,H20_6,H20_7,H21_0,H21_1,H21_2,H21_3,H21_4,H21_5,H21_6,H21_7;


value carry_chain1(.in(0),.out(carry_in_10_1));  
value carry_chain2(.in(0),.out(carry_in_10_2));
value carry_chain3(.in(0),.out(carry_in_11_1));  
value carry_chain4(.in(0),.out(carry_in_11_2));

wire   carry_in_10_1,carry_in_10_2,carry_in_11_1,carry_in_11_2,carry_out_10_1,carry_out_10_2,carry_out_00_1,carry_out_00_2;

wire   carry_out_11_1,carry_out_11_2,carry_out_01_1,carry_out_01_2;


wire CLB_prgm_b_out_CLB00,CLB_prgm_b_out_CLB01,CLB_prgm_b_out_CLB10,CLB_prgm_b_out_CLB11;

wire cb_prgm_b_out_00_0,cb_prgm_b_out_00_1,cb_prgm_b_out_00_2,cb_prgm_b_out_00_3;
wire cb_prgm_b_out_01_0,cb_prgm_b_out_01_1,cb_prgm_b_out_01_2,cb_prgm_b_out_01_3;
wire cb_prgm_b_out_10_0,cb_prgm_b_out_10_1,cb_prgm_b_out_10_2,cb_prgm_b_out_10_3;
wire cb_prgm_b_out_11_0,cb_prgm_b_out_11_1,cb_prgm_b_out_11_2,cb_prgm_b_out_11_3;


wire sb_prgm_b_out_SB00,sb_prgm_b_out_SB01,sb_prgm_b_out_SB02,
sb_prgm_b_out_SB10,sb_prgm_b_out_SB11,sb_prgm_b_out_SB12,
sb_prgm_b_out_SB20,sb_prgm_b_out_SB21,sb_prgm_b_out_SB22;

//wires between switch blocks
wire SB00_SB01_0,SB00_SB01_1,SB00_SB01_2,SB00_SB01_3,SB00_SB01_4,SB00_SB01_5,SB00_SB01_6,SB00_SB01_7;
wire SB01_SB02_0,SB01_SB02_1,SB01_SB02_2,SB01_SB02_3,SB01_SB02_4,SB01_SB02_5,SB01_SB02_6,SB01_SB02_7;

wire SB00_SB10_0,SB00_SB10_1,SB00_SB10_2,SB00_SB10_3,SB00_SB10_4,SB00_SB10_5,SB00_SB10_6,SB00_SB10_7;
wire SB01_SB11_0,SB01_SB11_1,SB01_SB11_2,SB01_SB11_3,SB01_SB11_4,SB01_SB11_5,SB01_SB11_6,SB01_SB11_7;
wire SB02_SB12_0,SB02_SB12_1,SB02_SB12_2,SB02_SB12_3,SB02_SB12_4,SB02_SB12_5,SB02_SB12_6,SB02_SB12_7;

wire SB10_SB11_0,SB10_SB11_1,SB10_SB11_2,SB10_SB11_3,SB10_SB11_4,SB10_SB11_5,SB10_SB11_6,SB10_SB11_7;
wire SB11_SB12_0,SB11_SB12_1,SB11_SB12_2,SB11_SB12_3,SB11_SB12_4,SB11_SB12_5,SB11_SB12_6,SB11_SB12_7;

wire SB10_SB20_0,SB10_SB20_1,SB10_SB20_2,SB10_SB20_3,SB10_SB20_4,SB10_SB20_5,SB10_SB20_6,SB10_SB20_7;
wire SB11_SB21_0,SB11_SB21_1,SB11_SB21_2,SB11_SB21_3,SB11_SB21_4,SB11_SB21_5,SB11_SB21_6,SB11_SB21_7;
wire SB12_SB22_0,SB12_SB22_1,SB12_SB22_2,SB12_SB22_3,SB12_SB22_4,SB12_SB22_5,SB12_SB22_6,SB12_SB22_7;

wire SB20_SB21_0,SB20_SB21_1,SB20_SB21_2,SB20_SB21_3,SB20_SB21_4,SB20_SB21_5,SB20_SB21_6,SB20_SB21_7;
wire SB21_SB22_0,SB21_SB22_1,SB21_SB22_2,SB21_SB22_3,SB21_SB22_4,SB21_SB22_5,SB21_SB22_6,SB21_SB22_7;

//

//IO block to SB wires
wire IO00_SB00_0,IO00_SB00_1,IO00_SB00_2,IO00_SB00_3,IO00_SB00_4,IO00_SB00_5,IO00_SB00_6,IO00_SB00_7;
wire IO01_SB01_0,IO01_SB01_1,IO01_SB01_2,IO01_SB01_3,IO01_SB01_4,IO01_SB01_5,IO01_SB01_6,IO01_SB01_7;
wire IO02_SB02_0,IO02_SB02_1,IO02_SB02_2,IO02_SB02_3,IO02_SB02_4,IO02_SB02_5,IO02_SB02_6,IO02_SB02_7;

wire IO10_SB00_0,IO10_SB00_1,IO10_SB00_2,IO10_SB00_3,IO10_SB00_4,IO10_SB00_5,IO10_SB00_6,IO10_SB00_7;
wire IO11_SB02_0,IO11_SB02_1,IO11_SB02_2,IO11_SB02_3,IO11_SB02_4,IO11_SB02_5,IO11_SB02_6,IO11_SB02_7;

wire IO20_SB10_0,IO20_SB10_1,IO20_SB10_2,IO20_SB10_3,IO20_SB10_4,IO20_SB10_5,IO20_SB10_6,IO20_SB10_7;
wire IO21_SB12_0,IO21_SB12_1,IO21_SB12_2,IO21_SB12_3,IO21_SB12_4,IO21_SB12_5,IO21_SB12_6,IO21_SB12_7;


wire IO30_SB20_0,IO30_SB20_1,IO30_SB20_2,IO30_SB20_3,IO30_SB20_4,IO30_SB20_5,IO30_SB20_6,IO30_SB20_7;
wire IO31_SB22_0,IO31_SB22_1,IO31_SB22_2,IO31_SB22_3,IO31_SB22_4,IO31_SB22_5,IO31_SB22_6,IO31_SB22_7;


wire IO40_SB20_0,IO40_SB20_1,IO40_SB20_2,IO40_SB20_3,IO40_SB20_4,IO40_SB20_5,IO40_SB20_6,IO40_SB20_7;
wire IO41_SB21_0,IO41_SB21_1,IO41_SB21_2,IO41_SB21_3,IO41_SB21_4,IO41_SB21_5,IO41_SB21_6,IO41_SB21_7;
wire IO42_SB22_0,IO42_SB22_1,IO42_SB22_2,IO42_SB22_3,IO42_SB22_4,IO42_SB22_5,IO42_SB22_6,IO42_SB22_7;

//

wire SB2_SB6_0,SB2_SB6_1,SB2_SB6_2,SB2_SB6_3,SB2_SB6_4,SB2_SB6_5,SB2_SB6_6,SB2_SB6_7,

SB3_VY1_0,SB3_VY1_1,SB3_VY1_2,SB3_VY1_3,SB3_VY1_4,SB3_VY1_5,SB3_VY1_6,SB3_VY1_7;


//CLB Blocks

wire CLB00_I0,CLB00_I1,CLB00_I2,CLB00_I3,CLB00_I4,CLB00_I5,CLB00_I6,CLB00_I7,CLB00_I8,CLB00_I9,CLB00_I10,CLB00_I11,CLB00_I12,CLB00_I13,CLB00_I14,CLB00_I15;
wire CLB00_IQ0,CLB00_IQ1,CLB00_IQ2,CLB00_IQ3,CLB00_IQ4,CLB00_IQ5,CLB00_IQ6,CLB00_IQ7;

wire CLB01_I0,CLB01_I1,CLB01_I2,CLB01_I3,CLB01_I4,CLB01_I5,CLB01_I6,CLB01_I7,CLB01_I8,CLB01_I9,CLB01_I10,CLB01_I11,CLB01_I12,CLB01_I13,CLB01_I14,CLB01_I15;
wire CLB01_IQ0,CLB01_IQ1,CLB01_IQ2,CLB01_IQ3,CLB01_IQ4,CLB01_IQ5,CLB01_IQ6,CLB01_IQ7;

wire CLB10_I0,CLB10_I1,CLB10_I2,CLB10_I3,CLB10_I4,CLB10_I5,CLB10_I6,CLB10_I7,CLB10_I8,CLB10_I9,CLB10_I10,CLB10_I11,CLB10_I12,CLB10_I13,CLB10_I14,CLB10_I15;
wire CLB10_IQ0,CLB10_IQ1,CLB10_IQ2,CLB10_IQ3,CLB10_IQ4,CLB10_IQ5,CLB10_IQ6,CLB10_IQ7;

wire CLB11_I0,CLB11_I1,CLB11_I2,CLB11_I3,CLB11_I4,CLB11_I5,CLB11_I6,CLB11_I7,CLB11_I8,CLB11_I9,CLB11_I10,CLB11_I11,CLB11_I12,CLB11_I13,CLB11_I14,CLB11_I15;
wire CLB11_IQ0,CLB11_IQ1,CLB11_IQ2,CLB11_IQ3,CLB11_IQ4,CLB11_IQ5,CLB11_IQ6,CLB11_IQ7;


//


//IO BLOCKS
IO_block IO00(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_in),.io_prgm_b_out(io_prgm_b_out_00),.G0(V00_0),.G1(V00_1),.G2(V00_2),.G3(V00_3),.G4(V00_4),.G5(V00_5),.G6(V00_6),.G7(V00_0),.S0(IO00_SB00_0),.S1(IO00_SB00_1),.S2(IO00_SB00_2),.S3(IO00_SB00_3),.S4(IO00_SB00_4),.S5(IO00_SB00_5),
.S6(IO00_SB00_6),.S7(IO00_SB00_7));

IO_block IO01(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_00),.io_prgm_b_out(io_prgm_b_out_01),.G0(V01_0),.G1(V01_1),.G2(V01_2),.G3(V01_3),.G4(V01_4),.G5(V01_5),.G6(V01_6),.G7(V01_0),.S0(IO01_SB01_0),.S1(IO01_SB01_1),.S2(IO01_SB01_2),.S3(IO01_SB01_3),.S4(IO01_SB01_4),.S5(IO01_SB01_5),
.S6(IO01_SB01_6),.S7(IO01_SB01_7));

IO_block IO02(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_01),.io_prgm_b_out(io_prgm_b_out_02),.G0(V02_0),.G1(V02_1),.G2(V02_2),.G3(V02_3),.G4(V02_4),.G5(V02_5),.G6(V02_6),.G7(V02_0),.S0(IO02_SB02_0),.S1(IO02_SB02_1),.S2(IO02_SB02_2),.S3(IO02_SB02_3),.S4(IO02_SB02_4),.S5(IO02_SB02_5),
.S6(IO02_SB02_6),.S7(IO02_SB02_7));

IO_block IO10(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_02),.io_prgm_b_out(io_prgm_b_out_10),.G0(H00_0),.G1(H00_1),.G2(H00_2),.G3(H00_3),.G4(H00_4),.G5(H00_5),.G6(H00_6),.G7(H00_0),.S0(IO10_SB00_0),.S1(IO10_SB00_1),.S2(IO10_SB00_2),.S3(IO10_SB00_3),.S4(IO10_SB00_4),.S5(IO10_SB00_5),
.S6(IO10_SB00_6),.S7(IO10_SB00_7));

IO_block IO11(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_10),.io_prgm_b_out(io_prgm_b_out_11),.G0(H01_0),.G1(H01_1),.G2(H01_2),.G3(H01_3),.G4(H01_4),.G5(H01_5),.G6(H01_6),.G7(H01_0),.S0(IO11_SB02_0),.S1(IO11_SB02_1),.S2(IO11_SB02_2),.S3(IO11_SB02_3),.S4(IO11_SB02_4),.S5(IO11_SB02_5),
.S6(IO11_SB02_6),.S7(IO11_SB02_7));

IO_block IO20(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_11),.io_prgm_b_out(io_prgm_b_out_20),.G0(H10_0),.G1(H10_1),.G2(H10_2),.G3(H10_3),.G4(H10_4),.G5(H10_5),.G6(H10_6),.G7(H10_7),.S0(IO20_SB10_0),.S1(IO20_SB10_1),.S2(IO20_SB10_2),.S3(IO20_SB10_3),.S4(IO20_SB10_4),.S5(IO20_SB10_5),
.S6(IO20_SB10_6),.S7(IO20_SB10_7));

IO_block IO21(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_20),.io_prgm_b_out(io_prgm_b_out_21),.G0(H11_0),.G1(H11_1),.G2(H11_2),.G3(H11_3),.G4(H11_4),.G5(H11_5),.G6(H11_6),.G7(H11_0),.S0(IO21_SB12_0),.S1(IO21_SB12_1),.S2(IO21_SB12_2),.S3(IO21_SB12_3),.S4(IO21_SB12_4),.S5(IO21_SB12_5),
.S6(IO21_SB12_6),.S7(IO21_SB12_7));

IO_block IO30(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_21),.io_prgm_b_out(io_prgm_b_out_30),.G0(H20_0),.G1(H20_1),.G2(H20_2),.G3(H20_3),.G4(H20_4),.G5(H20_5),.G6(H20_6),.G7(H20_0),.S0(IO30_SB20_0),.S1(IO30_SB20_1),.S2(IO30_SB20_2),.S3(IO30_SB20_3),.S4(IO30_SB20_4),.S5(IO30_SB20_5),
.S6(IO30_SB20_6),.S7(IO30_SB20_7));

IO_block IO31(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_30),.io_prgm_b_out(io_prgm_b_out_31),.G0(H21_0),.G1(H21_1),.G2(H21_2),.G3(H21_3),.G4(H21_4),.G5(H21_5),.G6(H21_6),.G7(H21_0),.S0(IO31_SB22_0),.S1(IO31_SB22_1),.S2(IO31_SB22_2),.S3(IO31_SB22_3),.S4(IO31_SB22_4),.S5(IO31_SB22_5),
.S6(IO31_SB22_6),.S7(IO31_SB22_7));

IO_block IO40(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_31),.io_prgm_b_out(io_prgm_b_out_40),.G0(V10_0),.G1(V10_1),.G2(V10_2),.G3(V10_3),.G4(V10_4),.G5(V10_5),.G6(V10_6),.G7(V10_7),.S0(IO40_SB20_0),.S1(IO40_SB20_1),.S2(IO40_SB20_2),.S3(IO40_SB20_3),.S4(IO40_SB20_4),.S5(IO40_SB20_5),
.S6(IO40_SB20_6),.S7(IO40_SB20_7));

IO_block IO41(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_40),.io_prgm_b_out(io_prgm_b_out_41),.G0(V11_0),.G1(V11_1),.G2(V11_2),.G3(V11_3),.G4(V11_4),.G5(V11_5),.G6(V11_6),.G7(V11_7),.S0(IO41_SB21_0),.S1(IO41_SB21_1),.S2(IO41_SB21_2),.S3(IO41_SB21_3),.S4(IO41_SB21_4),.S5(IO41_SB21_5),
.S6(IO41_SB21_6),.S7(IO41_SB21_7));

IO_block IO42(.bit_in(bit_in_IO),.clk(clk),.reset(reset),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.io_prgm_b_in(io_prgm_b_out_41),.io_prgm_b_out(io_prgm_b_out_42),.G0(V12_0),.G1(V12_1),.G2(V12_2),.G3(V12_3),.G4(V12_4),.G5(V12_5),.G6(V12_6),.G7(V12_7),.S0(IO42_SB22_0),.S1(IO42_SB22_1),.S2(IO42_SB22_2),.S3(IO42_SB22_3),.S4(IO42_SB22_4),.S5(IO42_SB22_5),
.S6(IO42_SB22_6),.S7(IO42_SB22_7));
//

//Connection Blocks
 CB CB00_0(.x1(CLB00_I12),.x2(CLB00_I13),.x3(CLB00_I14),.x4(CLB00_I15),.q1(CLB00_IQ6),.q2(CLB00_IQ7),.G0(SB00_SB01_0),.G1(SB00_SB01_1),.G2(SB00_SB01_2),.G3(SB00_SB01_3),.G4(SB00_SB01_4),.G5(SB00_SB01_5),.G6(SB00_SB01_6),.G7(SB00_SB01_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_00_0),.cb_prgm_b_in(cb_prgm_b_in));

CB CB00_1(.x1(CLB00_I4),.x2(CLB00_I5),.x3(CLB00_I6),.x4(CLB00_I7),.q1(CLB00_IQ2),.q2(CLB00_IQ3),
   .G0(SB01_SB11_0),.G1(SB01_SB11_1),.G2(SB01_SB11_2),.G3(SB01_SB11_3),.G4(SB01_SB11_4),.G5(SB01_SB11_5),.G6(SB01_SB11_6),.G7(SB01_SB11_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_00_1),.cb_prgm_b_in(cb_prgm_b_out_00_0));

CB CB00_2(.x1(CLB00_I8),.x2(CLB00_I9),.x3(CLB00_I10),.x4(CLB00_I11),.q1(CLB00_IQ4),.q2(CLB00_IQ5),
   .G0(SB10_SB11_0),.G1(SB10_SB11_1),.G2(SB10_SB11_2),.G3(SB10_SB11_3),.G4(SB10_SB11_4),.G5(SB10_SB11_5),.G6(SB10_SB11_6),.G7(SB10_SB11_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_00_2),.cb_prgm_b_in(cb_prgm_b_out_00_1));

CB CB00_3(.x1(CLB00_I0),.x2(CLB00_I1),.x3(CLB00_I2),.x4(CLB00_I3),.q1(CLB00_IQ0),.q2(CLB00_IQ1),
   .G0(SB00_SB10_0),.G1(SB00_SB10_1),.G2(SB00_SB10_2),.G3(SB00_SB10_3),.G4(SB00_SB10_4),.G5(SB00_SB10_5),.G6(SB00_SB10_6),.G7(SB00_SB10_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_00_3),.cb_prgm_b_in(cb_prgm_b_out_00_2));
///

CB CB01_0(.x1(CLB01_I12),.x2(CLB01_I13),.x3(CLB01_I14),.x4(CLB01_I15),.q1(CLB01_IQ6),.q2(CLB01_IQ7),.G0(SB01_SB02_0),.G1(SB01_SB02_1),.G2(SB01_SB02_2),.G3(SB01_SB02_3),.G4(SB01_SB02_4),.G5(SB01_SB02_5),.G6(SB01_SB02_6),.G7(SB01_SB02_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_01_0),.cb_prgm_b_in(cb_prgm_b_out_00_3));

CB CB01_1(.x1(CLB01_I4),.x2(CLB01_I5),.x3(CLB01_I6),.x4(CLB01_I7),.q1(CLB01_IQ2),.q2(CLB01_IQ3),
   .G0(SB02_SB12_0),.G1(SB02_SB12_1),.G2(SB02_SB12_2),.G3(SB02_SB12_3),.G4(SB02_SB12_4),.G5(SB02_SB12_5),.G6(SB02_SB12_6),.G7(SB02_SB12_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_01_1),.cb_prgm_b_in(cb_prgm_b_out_01_0));

CB CB01_2(.x1(CLB01_I8),.x2(CLB01_I9),.x3(CLB01_I10),.x4(CLB01_I11),.q1(CLB01_IQ4),.q2(CLB01_IQ5),
   .G0(SB11_SB12_0),.G1(SB11_SB12_1),.G2(SB11_SB12_2),.G3(SB11_SB12_3),.G4(SB11_SB12_4),.G5(SB11_SB12_5),.G6(SB11_SB12_6),.G7(SB11_SB12_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_01_2),.cb_prgm_b_in(cb_prgm_b_out_01_1));

CB CB01_3(.x1(CLB01_I0),.x2(CLB01_I1),.x3(CLB01_I2),.x4(CLB01_I3),.q1(CLB01_IQ0),.q2(CLB01_IQ1),
   .G0(SB01_SB11_0),.G1(SB01_SB11_1),.G2(SB01_SB11_2),.G3(SB01_SB11_3),.G4(SB01_SB11_4),.G5(SB01_SB11_5),.G6(SB01_SB11_6),.G7(SB01_SB11_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_01_3),.cb_prgm_b_in(cb_prgm_b_out_01_2));

///
CB CB10_0(.x1(CLB10_I12),.x2(CLB10_I13),.x3(CLB10_I14),.x4(CLB10_I15),.q1(CLB10_IQ6),.q2(CLB10_IQ7),.G0(SB20_SB21_0),.G1(SB20_SB21_1),.G2(SB20_SB21_2),.G3(SB20_SB21_3),.G4(SB20_SB21_4),.G5(SB20_SB21_5),.G6(SB20_SB21_6),.G7(SB20_SB21_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_10_0),.cb_prgm_b_in(cb_prgm_b_out_01_3));

CB CB10_1(.x1(CLB10_I4),.x2(CLB10_I5),.x3(CLB10_I6),.x4(CLB10_I7),.q1(CLB10_IQ2),.q2(CLB10_IQ3),
   .G0(SB10_SB20_0),.G1(SB10_SB20_1),.G2(SB10_SB20_2),.G3(SB10_SB20_3),.G4(SB10_SB20_4),.G5(SB10_SB20_5),.G6(SB10_SB20_6),.G7(SB10_SB20_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_10_1),.cb_prgm_b_in(cb_prgm_b_out_10_0));

CB CB10_2(.x1(CLB10_I8),.x2(CLB10_I9),.x3(CLB10_I10),.x4(CLB10_I11),.q1(CLB10_IQ4),.q2(CLB10_IQ5),
   .G0(SB20_SB21_0),.G1(SB20_SB21_1),.G2(SB20_SB21_2),.G3(SB20_SB21_3),.G4(SB20_SB21_4),.G5(SB20_SB21_5),.G6(SB20_SB21_6),.G7(SB20_SB21_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_10_2),.cb_prgm_b_in(cb_prgm_b_out_10_1));

CB CB10_3(.x1(CLB10_I0),.x2(CLB10_I1),.x3(CLB10_I2),.x4(CLB10_I3),.q1(CLB10_IQ0),.q2(CLB10_IQ1),
   .G0(SB10_SB20_0),.G1(SB10_SB20_1),.G2(SB10_SB20_2),.G3(SB10_SB20_3),.G4(SB10_SB20_4),.G5(SB10_SB20_5),.G6(SB10_SB20_6),.G7(SB10_SB20_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_10_3),.cb_prgm_b_in(cb_prgm_b_out_10_2));
///

CB CB11_0(.x1(CLB11_I12),.x2(CLB11_I13),.x3(CLB11_I14),.x4(CLB11_I15),.q1(CLB11_IQ6),.q2(CLB11_IQ7),.G0(SB21_SB22_0),.G1(SB21_SB22_1),.G2(SB21_SB22_2),.G3(SB21_SB22_3),.G4(SB21_SB22_4),.G5(SB21_SB22_5),.G6(SB21_SB22_6),.G7(SB21_SB22_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_11_0),.cb_prgm_b_in(cb_prgm_b_out_10_3));

CB CB11_1(.x1(CLB11_I4),.x2(CLB11_I5),.x3(CLB11_I6),.x4(CLB11_I7),.q1(CLB11_IQ2),.q2(CLB11_IQ3),
   .G0(SB12_SB22_0),.G1(SB12_SB22_1),.G2(SB12_SB22_2),.G3(SB12_SB22_3),.G4(SB12_SB22_4),.G5(SB12_SB22_5),.G6(SB12_SB22_6),.G7(SB12_SB22_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_11_1),.cb_prgm_b_in(cb_prgm_b_out_11_0));

CB CB11_2(.x1(CLB11_I8),.x2(CLB11_I9),.x3(CLB11_I10),.x4(CLB11_I11),.q1(CLB11_IQ4),.q2(CLB11_IQ5),
   .G0(SB21_SB22_0),.G1(SB21_SB22_1),.G2(SB21_SB22_2),.G3(SB21_SB22_3),.G4(SB21_SB22_4),.G5(SB21_SB22_5),.G6(SB21_SB22_6),.G7(SB21_SB22_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_11_2),.cb_prgm_b_in(cb_prgm_b_out_11_1));

CB CB11_3(.x1(CLB11_I0),.x2(CLB11_I1),.x3(CLB11_I2),.x4(CLB11_I3),.q1(CLB11_IQ0),.q2(CLB11_IQ1),
   .G0(SB11_SB21_0),.G1(SB11_SB21_1),.G2(SB11_SB21_2),.G3(SB11_SB21_3),.G4(SB11_SB21_4),.G5(SB11_SB21_5),.G6(SB11_SB21_6),.G7(SB11_SB21_7),.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b),.cb_prgm_b_out(cb_prgm_b_out_11_3),.cb_prgm_b_in(cb_prgm_b_out_11_2));
//

//CLB Blocks



CLB CLB00(.I0(CLB00_I0),.I1(CLB00_I1),.I2(CLB00_I2),.I3(CLB00_I3),.I4(CLB00_I4),.I5(CLB00_I5),.I6(CLB00_I6),.I7(CLB00_I7),.I8(CLB00_I8),.I9(CLB00_I9),.I10(CLB00_I10),.I11(CLB00_I11),
	.I12(CLB00_I12),.I13(CLB00_I13),.I14(CLB00_I14),.I15(CLB00_I15),.IQ1(CLB00_IQ0),.IQ2(CLB00_IQ1),.IQ3(CLB00_IQ2),.IQ4(CLB00_IQ3),.IQ5(CLB00_IQ4),
	.IQ6(CLB00_IQ5),.IQ7(CLB00_IQ6),.IQ8(CLB00_IQ7),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB_prgm_b_in),.CLB_prgm_b_out(CLB_prgm_b_out_CLB00),.carry_out_chain1(carry_out_00_1),.carry_in_chain1(carry_out_10_1),.carry_out_chain2(carry_out_00_2),.carry_in_chain2(carry_out_10_2)); 

CLB CLB01(.I0(CLB01_I0),.I1(CLB01_I1),.I2(CLB01_I2),.I3(CLB01_I3),.I4(CLB01_I4),.I5(CLB01_I5),.I6(CLB01_I6),.I7(CLB01_I7),.I8(CLB01_I8),.I9(CLB01_I9),.I10(CLB01_I10),.I11(CLB01_I11),
	.I12(CLB01_I12),.I13(CLB01_I13),.I14(CLB01_I14),.I15(CLB01_I15),.IQ1(CLB01_IQ0),.IQ2(CLB01_IQ1),.IQ3(CLB01_IQ2),.IQ4(CLB01_IQ3),.IQ5(CLB01_IQ4),
	.IQ6(CLB01_IQ5),.IQ7(CLB01_IQ6),.IQ8(CLB01_IQ7),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB_prgm_b_out_CLB00),.CLB_prgm_b_out(CLB_prgm_b_out_CLB01),.carry_out_chain1(carry_out_01_1),.carry_in_chain1(carry_out_11_1),.carry_out_chain2(carry_out_01_2),.carry_in_chain2(carry_out_11_2));

CLB CLB10(.I0(CLB10_I0),.I1(CLB10_I1),.I2(CLB10_I2),.I3(CLB10_I3),.I4(CLB10_I4),.I5(CLB10_I5),.I6(CLB10_I6),.I7(CLB10_I7),.I8(CLB10_I8),.I9(CLB10_I9),.I10(CLB10_I10),.I11(CLB10_I11),
	.I12(CLB10_I12),.I13(CLB10_I13),.I14(CLB10_I14),.I15(CLB10_I15),.IQ1(CLB10_IQ0),.IQ2(CLB10_IQ1),.IQ3(CLB10_IQ2),.IQ4(CLB10_IQ3),.IQ5(CLB10_IQ4),
	.IQ6(CLB10_IQ5),.IQ7(CLB10_IQ6),.IQ8(CLB10_IQ7),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB_prgm_b_out_CLB01),.CLB_prgm_b_out(CLB_prgm_b_out_CLB10),.carry_out_chain1(carry_out_10_1),.carry_in_chain1(carry_in_10_1),.carry_out_chain2(carry_out_10_2),.carry_in_chain2(carry_in_10_2));

CLB CLB11(.I0(CLB11_I0),.I1(CLB11_I1),.I2(CLB11_I2),.I3(CLB11_I3),.I4(CLB11_I4),.I5(CLB11_I5),.I6(CLB11_I6),.I7(CLB11_I7),.I8(CLB11_I8),.I9(CLB11_I9),.I10(CLB11_I10),.I11(CLB11_I11),
	.I12(CLB11_I12),.I13(CLB11_I13),.I14(CLB11_I14),.I15(CLB11_I15),.IQ1(CLB11_IQ0),.IQ2(CLB11_IQ1),.IQ3(CLB11_IQ2),.IQ4(CLB11_IQ3),.IQ5(CLB11_IQ4),
	.IQ6(CLB11_IQ5),.IQ7(CLB11_IQ6),.IQ8(CLB11_IQ7),.clk(clk),.reset(reset),.prgm_b(prgm_b),.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),
	.CLB_prgm_b_in(CLB_prgm_b_out_CLB10),.CLB_prgm_b_out(CLB_prgm_b_out_CLB11),.carry_out_chain1(carry_out_11_1),.carry_in_chain1(carry_in_11_1),.carry_out_chain2(carry_out_11_2),.carry_in_chain2(carry_in_11_2)); 

//

//switch blocks

switch_block SB00(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(sb_prgm_b_in),.sb_prgm_b_out(sb_prgm_b_out_SB00),
                                 .A0(IO00_SB00_0),.A1(IO00_SB00_1),.A2(IO00_SB00_2),.A3(IO00_SB00_3),.A4(IO00_SB00_4),.A5(IO00_SB00_5),.A6(IO00_SB00_6),.A7(IO00_SB00_7),
                                 .B0(SB00_SB01_0),.B1(SB00_SB01_1),.B2(SB00_SB01_2),.B3(SB00_SB01_3),.B4(SB00_SB01_4),.B5(SB00_SB01_5),.B6(SB00_SB01_6),.B7(SB00_SB01_7),
                                 .C0(SB00_SB10_0),.C1(SB00_SB10_1),.C2(SB00_SB10_2),.C3(SB00_SB10_3),.C4(SB00_SB10_4),.C5(SB00_SB10_5),.C6(SB00_SB10_6),.C7(SB00_SB10_7),
                                 .D0(IO10_SB00_0),.D1(IO10_SB00_1),.D2(IO10_SB00_2),.D3(IO10_SB00_3),.D4(IO10_SB00_4),.D5(IO10_SB00_5),.D6(IO10_SB00_6),.D7(IO10_SB00_7));


switch_block SB01(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(sb_prgm_b_out_SB00),.sb_prgm_b_out(sb_prgm_b_out_SB01),
                                 .A0(IO01_SB01_0),.A1(IO01_SB01_1),.A2(IO01_SB01_2),.A3(IO01_SB01_3),.A4(IO01_SB01_4),.A5(IO01_SB01_5),.A6(IO01_SB01_6),.A7(IO01_SB01_7),
                                 .B0(SB01_SB02_0),.B1(SB01_SB02_1),.B2(SB01_SB02_2),.B3(SB01_SB02_3),.B4(SB01_SB02_4),.B5(SB01_SB02_5),.B6(SB01_SB02_6),.B7(SB01_SB02_7),
                                 .C0(SB01_SB11_0),.C1(SB01_SB11_1),.C2(SB01_SB11_2),.C3(SB01_SB11_3),.C4(SB01_SB11_4),.C5(SB01_SB11_5),.C6(SB01_SB11_6),.C7(SB01_SB11_7),
                                 .D0(SB00_SB01_0),.D1(SB00_SB01_1),.D2(SB00_SB01_2),.D3(SB00_SB01_3),.D4(SB00_SB01_4),.D5(SB00_SB01_5),.D6(SB00_SB01_6),.D7(SB00_SB01_7));

switch_block SB02(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(sb_prgm_b_out_SB01),.sb_prgm_b_out(sb_prgm_b_out_SB02),
                                 .A0(IO02_SB02_0),.A1(IO02_SB02_1),.A2(IO02_SB02_2),.A3(IO02_SB02_3),.A4(IO02_SB02_4),.A5(IO02_SB02_5),.A6(IO02_SB02_6),.A7(IO02_SB02_7),
                                 .B0(IO11_SB02_0),.B1(IO11_SB02_1),.B2(IO11_SB02_2),.B3(IO11_SB02_3),.B4(IO11_SB02_4),.B5(IO11_SB02_5),.B6(IO11_SB02_6),.B7(IO11_SB02_7),
                                 .C0(SB02_SB12_0),.C1(SB02_SB12_1),.C2(SB02_SB12_2),.C3(SB02_SB12_3),.C4(SB02_SB12_4),.C5(SB02_SB12_5),.C6(SB02_SB12_6),.C7(SB02_SB12_7),
                                 .D0(SB01_SB02_0),.D1(SB01_SB02_1),.D2(SB01_SB02_2),.D3(SB01_SB02_3),.D4(SB01_SB02_4),.D5(SB01_SB02_5),.D6(SB01_SB02_6),.D7(SB01_SB02_7));

switch_block SB10(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(sb_prgm_b_out_SB02),.sb_prgm_b_out(sb_prgm_b_out_SB10),
                                 .A0(SB00_SB10_0),.A1(SB00_SB10_1),.A2(SB00_SB10_2),.A3(SB00_SB10_3),.A4(SB00_SB10_4),.A5(SB00_SB10_5),.A6(SB00_SB10_6),.A7(SB00_SB10_7),
                                 .B0(SB10_SB11_0),.B1(SB10_SB11_1),.B2(SB10_SB11_2),.B3(SB10_SB11_3),.B4(SB10_SB11_4),.B5(SB10_SB11_5),.B6(SB10_SB11_6),.B7(SB10_SB11_7),
                                 .C0(SB10_SB20_0),.C1(SB10_SB20_1),.C2(SB10_SB20_2),.C3(SB10_SB20_3),.C4(SB10_SB20_4),.C5(SB10_SB20_5),.C6(SB10_SB20_6),.C7(SB10_SB20_7),
                                 .D0(IO20_SB10_0),.D1(IO20_SB10_1),.D2(IO20_SB10_2),.D3(IO20_SB10_3),.D4(IO20_SB10_4),.D5(IO20_SB10_5),.D6(IO20_SB10_6),.D7(IO20_SB10_7));

switch_block SB11(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(sb_prgm_b_out_SB10),.sb_prgm_b_out(sb_prgm_b_out_SB11),
                                 .A0(SB01_SB11_0),.A1(SB01_SB11_1),.A2(SB01_SB11_2),.A3(SB01_SB11_3),.A4(SB01_SB11_4),.A5(SB01_SB11_5),.A6(SB01_SB11_6),.A7(SB01_SB11_7),
                                 .B0(SB11_SB12_0),.B1(SB11_SB12_1),.B2(SB11_SB12_2),.B3(SB11_SB12_3),.B4(SB11_SB12_4),.B5(SB11_SB12_5),.B6(SB11_SB12_6),.B7(SB11_SB12_7),
                                 .C0(SB11_SB21_0),.C1(SB11_SB21_1),.C2(SB11_SB21_2),.C3(SB11_SB21_3),.C4(SB11_SB21_4),.C5(SB11_SB21_5),.C6(SB11_SB21_6),.C7(SB11_SB21_7),
                                 .D0(SB10_SB11_0),.D1(SB10_SB11_1),.D2(SB10_SB11_2),.D3(SB10_SB11_3),.D4(SB10_SB11_4),.D5(SB10_SB11_5),.D6(SB10_SB11_6),.D7(SB10_SB11_7));

switch_block SB12(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(sb_prgm_b_out_SB11),.sb_prgm_b_out(sb_prgm_b_out_SB12),
                                 .A0(SB02_SB12_0),.A1(SB02_SB12_1),.A2(SB02_SB12_2),.A3(SB02_SB12_3),.A4(SB02_SB12_4),.A5(SB02_SB12_5),.A6(SB02_SB12_6),.A7(SB02_SB12_7),
                                 .B0(IO21_SB12_0),.B1(IO21_SB12_1),.B2(IO21_SB12_2),.B3(IO21_SB12_3),.B4(IO21_SB12_4),.B5(IO21_SB12_5),.B6(IO21_SB12_6),.B7(IO21_SB12_7),
                                 .C0(SB12_SB22_0),.C1(SB12_SB22_1),.C2(SB12_SB22_2),.C3(SB12_SB22_3),.C4(SB12_SB22_4),.C5(SB12_SB22_5),.C6(SB12_SB22_6),.C7(SB12_SB22_7),
                                 .D0(SB11_SB12_0),.D1(SB11_SB12_1),.D2(SB11_SB12_2),.D3(SB11_SB12_3),.D4(SB11_SB12_4),.D5(SB11_SB12_5),.D6(SB11_SB12_6),.D7(SB11_SB12_7));

switch_block SB20(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(sb_prgm_b_out_SB12),.sb_prgm_b_out(sb_prgm_b_out_SB20),
                                 .A0(SB10_SB20_0),.A1(SB10_SB20_1),.A2(SB10_SB20_2),.A3(SB10_SB20_3),.A4(SB10_SB20_4),.A5(SB10_SB20_5),.A6(SB10_SB20_6),.A7(SB10_SB20_7),
                                 .B0(SB20_SB21_0),.B1(SB20_SB21_1),.B2(SB20_SB21_2),.B3(SB20_SB21_3),.B4(SB20_SB21_4),.B5(SB20_SB21_5),.B6(SB20_SB21_6),.B7(SB20_SB21_7),
                                 .C0(IO40_SB20_0),.C1(IO40_SB20_1),.C2(IO40_SB20_2),.C3(IO40_SB20_3),.C4(IO40_SB20_4),.C5(IO40_SB20_5),.C6(IO40_SB20_6),.C7(IO40_SB20_7),
                                 .D0(IO30_SB20_0),.D1(IO30_SB20_1),.D2(IO30_SB20_2),.D3(IO30_SB20_3),.D4(IO30_SB20_4),.D5(IO30_SB20_5),.D6(IO30_SB20_6),.D7(IO30_SB20_7));

switch_block SB21(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(sb_prgm_b_out_SB20),.sb_prgm_b_out(sb_prgm_b_out_SB21),
                                 .A0(SB11_SB21_0),.A1(SB11_SB21_1),.A2(SB11_SB21_2),.A3(SB11_SB21_3),.A4(SB11_SB21_4),.A5(SB11_SB21_5),.A6(SB11_SB21_6),.A7(SB11_SB21_7),
                                 .B0(SB21_SB22_0),.B1(SB21_SB22_1),.B2(SB21_SB22_2),.B3(SB21_SB22_3),.B4(SB21_SB22_4),.B5(SB21_SB22_5),.B6(SB21_SB22_6),.B7(SB21_SB22_7),
                                 .C0(IO41_SB21_0),.C1(IO41_SB21_1),.C2(IO41_SB21_2),.C3(IO41_SB21_3),.C4(IO41_SB21_4),.C5(IO41_SB21_5),.C6(IO41_SB21_6),.C7(IO41_SB21_7),
                                 .D0(SB20_SB21_0),.D1(SB20_SB21_1),.D2(SB20_SB21_2),.D3(SB20_SB21_3),.D4(SB20_SB21_4),.D5(SB20_SB21_5),.D6(SB20_SB21_6),.D7(SB20_SB21_7));

switch_block SB22(.bit_in(bit_in_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_in(sb_prgm_b_out_SB21),.sb_prgm_b_out(sb_prgm_b_out_SB22),
                                 .A0(SB12_SB22_0),.A1(SB12_SB22_1),.A2(SB12_SB22_2),.A3(SB12_SB22_3),.A4(SB12_SB22_4),.A5(SB12_SB22_5),.A6(SB12_SB22_6),.A7(SB12_SB22_7),
                                 .B0(IO31_SB22_0),.B1(IO31_SB22_1),.B2(IO31_SB22_2),.B3(IO31_SB22_3),.B4(IO31_SB22_4),.B5(IO31_SB22_5),.B6(IO31_SB22_6),.B7(IO31_SB22_7),
                                 .C0(IO42_SB22_0),.C1(IO42_SB22_1),.C2(IO42_SB22_2),.C3(IO42_SB22_3),.C4(IO42_SB22_4),.C5(IO42_SB22_5),.C6(IO42_SB22_6),.C7(IO42_SB22_7),
                                 .D0(SB21_SB22_0),.D1(SB21_SB22_1),.D2(SB21_SB22_2),.D3(SB21_SB22_3),.D4(SB21_SB22_4),.D5(SB21_SB22_5),.D6(SB21_SB22_6),.D7(SB21_SB22_7));
//


endmodule
