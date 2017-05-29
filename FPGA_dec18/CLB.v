module CLB(I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,bit_in,clk,reset,prgm_b,CLB_prgm_b,CLB_prgm_b_in,CLB_prgm_b_out,carry_chain_in,
RQ0,RQ1,RQ2,RQ3,RQ4,RQ5,RQ6,RQ7,CYO_0,CYO_1,CYO_2,CYO_3,CYO_4,CYO_5,CYO_6,carry_chain_out,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,
LUT0_WE,LUT1_WE,LUT2_WE,LUT3_WE,LUT4_WE,LUT5_WE,LUT6_WE,LUT7_WE,GWE);

input I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,bit_in,clk,reset,prgm_b,CLB_prgm_b,CLB_prgm_b_in,carry_chain_in;

input LUT0_WE,LUT1_WE,LUT2_WE,LUT3_WE,LUT4_WE,LUT5_WE,LUT6_WE,LUT7_WE,GWE;

output CLB_prgm_b_out;  // CLB with 8 LUT-FF slices

wire LUT0_CLB_prgm_b_out,LUT1_CLB_prgm_b_out,LUT2_CLB_prgm_b_out,LUT3_CLB_prgm_b_out,LUT4_CLB_prgm_b_out,LUT5_CLB_prgm_b_out,LUT6_CLB_prgm_b_out;

output Q0,CYO_0,RQ0,Q1,CYO_1,RQ1,Q2,CYO_2,RQ2,
Q3,CYO_3,RQ3,Q4,CYO_4,RQ4,Q5,CYO_5,RQ5,
Q6,CYO_6,RQ6,Q7,carry_chain_out,RQ7;


//wire [15:0] look_up_t1;     	wire [15:0] look_up_t5;
//wire [15:0] look_up_t2;   	wire [15:0] look_up_t6;
//wire [15:0] look_up_t3;    	wire [15:0] look_up_t7;
//wire [15:0] look_up_t4;     	wire [15:0] look_up_t8;

wire [5:0] LUT0_0;     wire [5:0] LUT1_0;    //interconnect configuration bits for each inout of LUT
wire [5:0] LUT0_1;     wire [5:0] LUT1_1;
wire [5:0] LUT0_2;     wire [5:0] LUT1_2;
wire [5:0] LUT0_3;     wire [5:0] LUT1_3;
                                
wire [5:0] LUT2_0;     wire [5:0] LUT3_0;    //interconnect configuration bits for each inout of LUT
wire [5:0] LUT2_1;     wire [5:0] LUT3_1;
wire [5:0] LUT2_2;     wire [5:0] LUT3_2;
wire [5:0] LUT2_3;     wire [5:0] LUT3_3;
                               
wire [5:0] LUT4_0;     wire [5:0] LUT5_0;    //interconnect configuration bits for each inout of LUT
wire [5:0] LUT4_1;     wire [5:0] LUT5_1;
wire [5:0] LUT4_2;     wire [5:0] LUT5_2;
wire [5:0] LUT4_3;     wire [5:0] LUT5_3;
                                
wire [5:0] LUT6_0;     wire [5:0] LUT7_0;    //interconnect configuration bits for each inout of LUT
wire [5:0] LUT6_1;     wire [5:0] LUT7_1;
wire [5:0] LUT6_2;     wire [5:0] LUT7_2;
wire [5:0] LUT6_3;     wire [5:0] LUT7_3;


wire [5:0] LUT0_DataIn;     wire [5:0] LUT0_Bypass;
wire [5:0] LUT1_DataIn;     wire [5:0] LUT1_Bypass;
wire [5:0] LUT2_DataIn;     wire [5:0] LUT2_Bypass;
wire [5:0] LUT3_DataIn;     wire [5:0] LUT3_Bypass;
wire [5:0] LUT4_DataIn;     wire [5:0] LUT4_Bypass;
wire [5:0] LUT5_DataIn;     wire [5:0] LUT5_Bypass;
wire [5:0] LUT6_DataIn;     wire [5:0] LUT6_Bypass;
wire [5:0] LUT7_DataIn;     wire [5:0] LUT7_Bypass;

wire [2:0] LUT0_CY_GEN_MUX;    
wire [2:0] LUT1_CY_GEN_MUX;    
wire [2:0] LUT2_CY_GEN_MUX;    
wire [2:0] LUT3_CY_GEN_MUX;    
wire [2:0] LUT4_CY_GEN_MUX;    
wire [2:0] LUT5_CY_GEN_MUX;    
wire [2:0] LUT6_CY_GEN_MUX;    
wire [2:0] LUT7_CY_GEN_MUX;    




wire bit_out1,bit_out2,bit_out3,bit_out4,bit_out5,bit_out6,bit_out7;
wire carry_conf_mux1,carry_conf_mux2,carry_conf_mux3,carry_conf_mux4,carry_conf_mux5,carry_conf_mux6,carry_conf_mux7,carry_conf_mux8;
wire carry_out1,carry_out2,carry_out3,carry_out4,carry_out5,carry_out6,carry_out7;

//configuring lut and CLB interconnect matrix

wire lut0_x3,lut0_x2,lut0_x1,lut0_x0,lut1_x3,lut1_x2,lut1_x1,lut1_x0,lut2_x3,lut2_x2,lut2_x1,lut2_x0,lut3_x3,lut3_x2,lut3_x1,lut3_x0;
wire lut4_x3,lut4_x2,lut4_x1,lut4_x0,lut5_x3,lut5_x2,lut5_x1,lut5_x0,lut6_x3,lut6_x2,lut6_x1,lut6_x0,lut7_x3,lut7_x2,lut7_x1,lut7_x0;

wire DataIn_LUT0,DataIn_LUT1,DataIn_LUT2,DataIn_LUT3,DataIn_LUT4,DataIn_LUT5,DataIn_LUT6,DataIn_LUT7;
wire BY_LUT0,BY_LUT1,BY_LUT2,BY_LUT3,BY_LUT4,BY_LUT5,BY_LUT6,BY_LUT7;




wire LUT0_conf_bits,LUT0_CYO_SEL_MUX,LUT0_SUM_LUT_SEL_MUX,LUT0_DFF_INP_SEL_MUX;

look_up_table_interconnect_config LUT0_conf(.bit_in(bit_in),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b(CLB_prgm_b),.CLB_prgm_b_in(CLB_prgm_b_in),.CLB_prgm_b_out(LUT0_CLB_prgm_b_out), .interconnect_config_x0(LUT0_0),.interconnect_config_x1(LUT0_1),
.interconnect_config_x2(LUT0_2),.interconnect_config_x3(LUT0_3),.config_data_reg(LUT0_conf_bits),.Bypass_inp_conf(LUT0_Bypass),.data_line_conf(LUT0_DataIn),
.CYO_SEL_MUX(LUT0_CYO_SEL_MUX),.SUM_LUT_SEL_MUX(LUT0_SUM_LUT_SEL_MUX),.DFF_INP_SEL_MUX(LUT0_DFF_INP_SEL_MUX),.CY_GEN_MUX(LUT0_CY_GEN_MUX));


wire LUT1_conf_bits,LUT1_CYO_SEL_MUX,LUT1_SUM_LUT_SEL_MUX,LUT1_DFF_INP_SEL_MUX;

look_up_table_interconnect_config LUT1_conf(.bit_in(bit_in),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b(CLB_prgm_b),.CLB_prgm_b_in(LUT0_CLB_prgm_b_out),.CLB_prgm_b_out(LUT1_CLB_prgm_b_out), .interconnect_config_x0(LUT1_0),.interconnect_config_x1(LUT1_1),
.interconnect_config_x2(LUT1_2),.interconnect_config_x3(LUT1_3),.config_data_reg(LUT1_conf_bits),.Bypass_inp_conf(LUT1_Bypass),.data_line_conf(LUT1_DataIn),
.CYO_SEL_MUX(LUT1_CYO_SEL_MUX),.SUM_LUT_SEL_MUX(LUT1_SUM_LUT_SEL_MUX),.DFF_INP_SEL_MUX(LUT1_DFF_INP_SEL_MUX),.CY_GEN_MUX(LUT1_CY_GEN_MUX));

wire LUT2_conf_bits,LUT2_CYO_SEL_MUX,LUT2_SUM_LUT_SEL_MUX,LUT2_DFF_INP_SEL_MUX;

look_up_table_interconnect_config LUT2_conf(.bit_in(bit_in),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b(CLB_prgm_b),.CLB_prgm_b_in(LUT1_CLB_prgm_b_out),.CLB_prgm_b_out(LUT2_CLB_prgm_b_out), .interconnect_config_x0(LUT2_0),.interconnect_config_x1(LUT2_1),
.interconnect_config_x2(LUT2_2),.interconnect_config_x3(LUT2_3),.config_data_reg(LUT2_conf_bits),.Bypass_inp_conf(LUT2_Bypass),.data_line_conf(LUT2_DataIn),
.CYO_SEL_MUX(LUT2_CYO_SEL_MUX),.SUM_LUT_SEL_MUX(LUT2_SUM_LUT_SEL_MUX),.DFF_INP_SEL_MUX(LUT2_DFF_INP_SEL_MUX),.CY_GEN_MUX(LUT2_CY_GEN_MUX));

wire LUT3_conf_bits,LUT3_CYO_SEL_MUX,LUT3_SUM_LUT_SEL_MUX,LUT3_DFF_INP_SEL_MUX;

look_up_table_interconnect_config LUT3_conf(.bit_in(bit_in),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b(CLB_prgm_b),.CLB_prgm_b_in(LUT2_CLB_prgm_b_out),.CLB_prgm_b_out(LUT3_CLB_prgm_b_out), .interconnect_config_x0(LUT3_0),.interconnect_config_x1(LUT3_1),
.interconnect_config_x2(LUT3_2),.interconnect_config_x3(LUT3_3),.config_data_reg(LUT3_conf_bits),.Bypass_inp_conf(LUT3_Bypass),.data_line_conf(LUT3_DataIn),
.CYO_SEL_MUX(LUT3_CYO_SEL_MUX),.SUM_LUT_SEL_MUX(LUT3_SUM_LUT_SEL_MUX),.DFF_INP_SEL_MUX(LUT3_DFF_INP_SEL_MUX),.CY_GEN_MUX(LUT3_CY_GEN_MUX));

wire LUT4_conf_bits,LUT4_CYO_SEL_MUX,LUT4_SUM_LUT_SEL_MUX,LUT4_DFF_INP_SEL_MUX;

look_up_table_interconnect_config LUT4_conf(.bit_in(bit_in),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b(CLB_prgm_b),.CLB_prgm_b_in(LUT3_CLB_prgm_b_out),.CLB_prgm_b_out(LUT4_CLB_prgm_b_out), .interconnect_config_x0(LUT4_0),.interconnect_config_x1(LUT4_1),
.interconnect_config_x2(LUT4_2),.interconnect_config_x3(LUT4_3),.config_data_reg(LUT4_conf_bits),.Bypass_inp_conf(LUT4_Bypass),.data_line_conf(LUT4_DataIn),
.CYO_SEL_MUX(LUT4_CYO_SEL_MUX),.SUM_LUT_SEL_MUX(LUT4_SUM_LUT_SEL_MUX),.DFF_INP_SEL_MUX(LUT4_DFF_INP_SEL_MUX),.CY_GEN_MUX(LUT4_CY_GEN_MUX));

wire LUT5_conf_bits,LUT5_CYO_SEL_MUX,LUT5_SUM_LUT_SEL_MUX,LUT5_DFF_INP_SEL_MUX;

look_up_table_interconnect_config LUT5_conf(.bit_in(bit_in),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b(CLB_prgm_b),.CLB_prgm_b_in(LUT4_CLB_prgm_b_out),.CLB_prgm_b_out(LUT5_CLB_prgm_b_out), .interconnect_config_x0(LUT5_0),.interconnect_config_x1(LUT5_1),
.interconnect_config_x2(LUT5_2),.interconnect_config_x3(LUT5_3),.config_data_reg(LUT5_conf_bits),.Bypass_inp_conf(LUT5_Bypass),.data_line_conf(LUT5_DataIn),
.CYO_SEL_MUX(LUT5_CYO_SEL_MUX),.SUM_LUT_SEL_MUX(LUT5_SUM_LUT_SEL_MUX),.DFF_INP_SEL_MUX(LUT5_DFF_INP_SEL_MUX),.CY_GEN_MUX(LUT5_CY_GEN_MUX));

wire LUT6_conf_bits,LUT6_CYO_SEL_MUX,LUT6_SUM_LUT_SEL_MUX,LUT6_DFF_INP_SEL_MUX;

look_up_table_interconnect_config LUT6_conf(.bit_in(bit_in),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b(CLB_prgm_b),.CLB_prgm_b_in(LUT5_CLB_prgm_b_out),.CLB_prgm_b_out(LUT6_CLB_prgm_b_out), .interconnect_config_x0(LUT6_0),.interconnect_config_x1(LUT6_1),
.interconnect_config_x2(LUT6_2),.interconnect_config_x3(LUT6_3),.config_data_reg(LUT6_conf_bits),.Bypass_inp_conf(LUT6_Bypass),.data_line_conf(LUT6_DataIn),
.CYO_SEL_MUX(LUT6_CYO_SEL_MUX),.SUM_LUT_SEL_MUX(LUT6_SUM_LUT_SEL_MUX),.DFF_INP_SEL_MUX(LUT6_DFF_INP_SEL_MUX),.CY_GEN_MUX(LUT6_CY_GEN_MUX));

wire LUT7_conf_bits,LUT7_CYO_SEL_MUX,LUT7_SUM_LUT_SEL_MUX,LUT7_DFF_INP_SEL_MUX;

look_up_table_interconnect_config LUT7_conf(.bit_in(bit_in),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b(CLB_prgm_b),.CLB_prgm_b_in(LUT6_CLB_prgm_b_out),.CLB_prgm_b_out(CLB_prgm_b_out), .interconnect_config_x0(LUT7_0),.interconnect_config_x1(LUT7_1),
.interconnect_config_x2(LUT7_2),.interconnect_config_x3(LUT7_3),.config_data_reg(LUT7_conf_bits),.Bypass_inp_conf(LUT7_Bypass),.data_line_conf(LUT7_DataIn),
.CYO_SEL_MUX(LUT7_CYO_SEL_MUX),.SUM_LUT_SEL_MUX(LUT7_SUM_LUT_SEL_MUX),.DFF_INP_SEL_MUX(LUT7_DFF_INP_SEL_MUX),.CY_GEN_MUX(LUT7_CY_GEN_MUX));

//cnfiguration ends

//connecting the inputs of all 8 LUTs to the CLB interconnect matrix

//each inout line of the 4-input LUT can be connected to any one of the 18 input lines (I1-I18) or to any one of the 8 output lines of the LUT(IQ1-IQ8)

interconnect_unit LUT0_X3(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT0_3),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut0_x3));

interconnect_unit LUT0_X2(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT0_2),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut0_x2));

interconnect_unit LUT0_X1(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT0_1),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut0_x1));

interconnect_unit LUT0_X0(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT0_0),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut0_x0));

interconnect_unit LUT0_Data(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT0_DataIn),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(DataIn_LUT0));

interconnect_unit LUT0_BY(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT0_Bypass),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(BY_LUT0));


interconnect_unit LUT1_X3(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT1_3),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut1_x3));

interconnect_unit LUT1_X2(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT1_2),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut1_x2));

interconnect_unit LUT1_X1(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT1_1),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut1_x1));

interconnect_unit LUT1_X0(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT1_0),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut1_x0));

interconnect_unit LUT1_Data(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT1_DataIn),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(DataIn_LUT1));

interconnect_unit LUT1_BY(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT1_Bypass),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(BY_LUT1));


interconnect_unit LUT2_X3(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT2_3),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut2_x3));

interconnect_unit LUT2_X2(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT2_2),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut2_x2));

interconnect_unit LUT2_X1(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT2_1),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut2_x1));

interconnect_unit LUT2_X0(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT2_0),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut2_x0));

interconnect_unit LUT2_Data(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT2_DataIn),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(DataIn_LUT2));

interconnect_unit LUT2_BY(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT2_Bypass),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(BY_LUT2));


interconnect_unit LUT3_X3(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT3_3),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut3_x3));

interconnect_unit LUT3_X2(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT3_2),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut3_x2));

interconnect_unit LUT3_X1(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT3_1),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut3_x1));

interconnect_unit LUT3_X0(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT3_0),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut3_x0));

interconnect_unit LUT3_Data(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT3_DataIn),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(DataIn_LUT3));

interconnect_unit LUT3_BY(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT3_Bypass),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(BY_LUT3));


interconnect_unit LUT4_X3(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT4_3),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut4_x3));

interconnect_unit LUT4_X2(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT4_2),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut4_x2));

interconnect_unit LUT4_X1(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT4_1),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut4_x1));

interconnect_unit LUT4_X0(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT4_0),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut4_x0));

interconnect_unit LUT4_Data(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT4_DataIn),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(DataIn_LUT4));

interconnect_unit LUT4_BY(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT4_Bypass),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(BY_LUT4));


interconnect_unit LUT5_X3(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT5_3),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut5_x3));

interconnect_unit LUT5_X2(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT5_2),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut5_x2));

interconnect_unit LUT5_X1(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT5_1),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut5_x1));

interconnect_unit LUT5_X0(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT5_0),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut5_x0));

interconnect_unit LUT5_Data(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT5_DataIn),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(DataIn_LUT5));

interconnect_unit LUT5_BY(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT5_Bypass),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(BY_LUT5));


interconnect_unit LUT6_X3(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT6_3),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut6_x3));

interconnect_unit LUT6_X2(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT6_2),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut6_x2));

interconnect_unit LUT6_X1(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT6_1),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut6_x1));

interconnect_unit LUT6_X0(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT6_0),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut6_x0));

interconnect_unit LUT6_Data(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT6_DataIn),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(DataIn_LUT6));

interconnect_unit LUT6_BY(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT6_Bypass),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(BY_LUT6));


interconnect_unit LUT7_X3(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT7_3),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut7_x3));

interconnect_unit LUT7_X2(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT7_2),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut7_x2));

interconnect_unit LUT7_X1(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT7_1),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut7_x1));

interconnect_unit LUT7_X0(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT7_0),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(lut7_x0));

interconnect_unit LUT7_Data(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT7_DataIn),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(DataIn_LUT7));

interconnect_unit LUT7_BY(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15)
	,.interconnect_switch(LUT7_Bypass),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.Q0(Q0),.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.Q5(Q5),.Q6(Q6),.Q7(Q7),.BY_0(BY_LUT0),.BY_1(BY_LUT1),.BY_2(BY_LUT2),.BY_3(BY_LUT3),.BY_4(BY_LUT4),.BY_5(BY_LUT5),.BY_6(BY_LUT6),.BY_7(BY_LUT7),.RQ0(RQ0),.RQ1(RQ1),.RQ2(RQ2),.RQ3(RQ3),.RQ4(RQ4),.RQ5(RQ5),.RQ6(RQ6),.RQ7(RQ7),.lut_inp(BY_LUT7));

//interconnections made for all LUT inputs

//passing the values at each inout line to the LUT


//create slices and F5 muxes in here--but then how will you congigure them?--use interconnect unit only


logic_pair LUT7(.x3(lut7_x3),.x2(lut7_x2),.x1(lut7_x1),.x0(lut7_x0),.bypass_in(BY_LUT7),.data_in(DataIn_LUT7),.config_data_in(LUT7_conf_bits),.clk(clk),.reset(reset),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.carry_in(CYO_6),.CYO_MUX_SEL(LUT7_CYO_SEL_MUX),.CY0_MUX_SEL(LUT7_CY_GEN_MUX),.GWE(GWE),.WE(LUT7_WE),.CLB_prgm_b_in(CLB_prgm_b_in),.SUM_LUT_MUX_SEL(LUT7_SUM_LUT_SEL_MUX),.SUM_LUT_OUT(Q7),.DFF_INP_MUX_SEL(LUT7_DFF_INP_SEL_MUX),.carry_out(carry_chain_out),.CLB_prgm_b_out(CLB_prgm_b_out),.DFF_OUT(RQ7));

logic_pair LUT6(.x3(lut6_x3),.x2(lut6_x2),.x1(lut6_x1),.x0(lut6_x0),.bypass_in(BY_LUT6),.data_in(DataIn_LUT6),.config_data_in(LUT6_conf_bits),.clk(clk),.reset(reset),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.carry_in(CYO_5),.CYO_MUX_SEL(LUT6_CYO_SEL_MUX),.CY0_MUX_SEL(LUT6_CY_GEN_MUX),.GWE(GWE),.WE(LUT6_WE),.CLB_prgm_b_in(CLB_prgm_b_in),.SUM_LUT_MUX_SEL(LUT6_SUM_LUT_SEL_MUX),.SUM_LUT_OUT(Q6),.DFF_INP_MUX_SEL(LUT6_DFF_INP_SEL_MUX),.carry_out(CYO_6),.CLB_prgm_b_out(LUT6_CLB_prgm_b_out),.DFF_OUT(RQ6));

logic_pair LUT5(.x3(lut5_x3),.x2(lut5_x2),.x1(lut5_x1),.x0(lut5_x0),.bypass_in(BY_LUT5),.data_in(DataIn_LUT5),.config_data_in(LUT5_conf_bits),.clk(clk),.reset(reset),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.carry_in(CYO_4),.CYO_MUX_SEL(LUT5_CYO_SEL_MUX),.CY0_MUX_SEL(LUT5_CY_GEN_MUX),.GWE(GWE),.WE(LUT5_WE),.CLB_prgm_b_in(CLB_prgm_b_in),.SUM_LUT_MUX_SEL(LUT5_SUM_LUT_SEL_MUX),.SUM_LUT_OUT(Q5),.DFF_INP_MUX_SEL(LUT5_DFF_INP_SEL_MUX),.carry_out(CYO_5),.CLB_prgm_b_out(LUT5_CLB_prgm_b_out),.DFF_OUT(RQ5));


logic_pair LUT4(.x3(lut4_x3),.x2(lut4_x2),.x1(lut4_x1),.x0(lut4_x0),.bypass_in(BY_LUT4),.data_in(DataIn_LUT4),.config_data_in(LUT4_conf_bits),.clk(clk),.reset(reset),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.carry_in(CYO_3),.CYO_MUX_SEL(LUT4_CYO_SEL_MUX),.CY0_MUX_SEL(LUT4_CY_GEN_MUX),.GWE(GWE),.WE(LUT4_WE),.CLB_prgm_b_in(CLB_prgm_b_in),.SUM_LUT_MUX_SEL(LUT4_SUM_LUT_SEL_MUX),.SUM_LUT_OUT(Q4),.DFF_INP_MUX_SEL(LUT4_DFF_INP_SEL_MUX),.carry_out(CYO_4),.CLB_prgm_b_out(LUT4_CLB_prgm_b_out),.DFF_OUT(RQ4));


logic_pair LUT3(.x3(lut3_x3),.x2(lut3_x2),.x1(lut3_x1),.x0(lut3_x0),.bypass_in(BY_LUT3),.data_in(DataIn_LUT3),.config_data_in(LUT3_conf_bits),.clk(clk),.reset(reset),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.carry_in(CYO_2),.CYO_MUX_SEL(LUT3_CYO_SEL_MUX),.CY0_MUX_SEL(LUT3_CY_GEN_MUX),.GWE(GWE),.WE(LUT3_WE),.CLB_prgm_b_in(CLB_prgm_b_in),.SUM_LUT_MUX_SEL(LUT3_SUM_LUT_SEL_MUX),.SUM_LUT_OUT(Q3),.DFF_INP_MUX_SEL(LUT3_DFF_INP_SEL_MUX),.carry_out(CYO_3),.CLB_prgm_b_out(LUT3_CLB_prgm_b_out),.DFF_OUT(RQ3));

logic_pair LUT2(.x3(lut2_x3),.x2(lut2_x2),.x1(lut2_x1),.x0(lut2_x0),.bypass_in(BY_LUT2),.data_in(DataIn_LUT2),.config_data_in(LUT2_conf_bits),.clk(clk),.reset(reset),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.carry_in(CYO_1),.CYO_MUX_SEL(LUT2_CYO_SEL_MUX),.CY0_MUX_SEL(LUT2_CY_GEN_MUX),.GWE(GWE),.WE(LUT2_WE),.CLB_prgm_b_in(CLB_prgm_b_in),.SUM_LUT_MUX_SEL(LUT2_SUM_LUT_SEL_MUX),.SUM_LUT_OUT(Q2),.DFF_INP_MUX_SEL(LUT2_DFF_INP_SEL_MUX),.carry_out(CYO_2),.CLB_prgm_b_out(LUT2_CLB_prgm_b_out),.DFF_OUT(RQ2));


logic_pair LUT1(.x3(lut1_x3),.x2(lut1_x2),.x1(lut1_x1),.x0(lut1_x0),.bypass_in(BY_LUT1),.data_in(DataIn_LUT1),.config_data_in(LUT1_conf_bits),.clk(clk),.reset(reset),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.carry_in(CYO_0),.CYO_MUX_SEL(LUT1_CYO_SEL_MUX),.CY0_MUX_SEL(LUT1_CY_GEN_MUX),.GWE(GWE),.WE(LUT1_WE),.CLB_prgm_b_in(CLB_prgm_b_in),.SUM_LUT_MUX_SEL(LUT1_SUM_LUT_SEL_MUX),.SUM_LUT_OUT(Q1),.DFF_INP_MUX_SEL(LUT1_DFF_INP_SEL_MUX),.carry_out(CYO_1),.CLB_prgm_b_out(LUT1_CLB_prgm_b_out),.DFF_OUT(RQ1));


logic_pair LUT0(.x3(lut0_x3),.x2(lut0_x2),.x1(lut0_x1),.x0(lut0_x0),.bypass_in(BY_LUT0),.data_in(DataIn_LUT0),.config_data_in(LUT0_conf_bits),.clk(clk),.reset(reset),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.carry_in(carry_chain_in),.CYO_MUX_SEL(LUT0_CYO_SEL_MUX),.CY0_MUX_SEL(LUT0_CY_GEN_MUX),.GWE(GWE),.WE(LUT0_WE),.CLB_prgm_b_in(CLB_prgm_b_in),.SUM_LUT_MUX_SEL(LUT0_SUM_LUT_SEL_MUX),.SUM_LUT_OUT(Q0),.DFF_INP_MUX_SEL(LUT0_DFF_INP_SEL_MUX),.carry_out(CYO_0),.CLB_prgm_b_out(LUT0_CLB_prgm_b_out),.DFF_OUT(RQ0));


endmodule
