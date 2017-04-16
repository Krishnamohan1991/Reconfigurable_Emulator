module CLB(I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,IQ1,IQ2,IQ3,IQ4,IQ5,IQ6,IQ7,IQ8,
	bit_in,clk,reset,prgm_b,CLB_prgm_b,CLB_prgm_b_in,CLB_prgm_b_out,carry_in,carry_out);

input I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,bit_in,clk,reset,prgm_b,CLB_prgm_b,CLB_prgm_b_in,carry_in;
output IQ1,IQ2,IQ3,IQ4,IQ5,IQ6,IQ7,IQ8,carry_out;
output CLB_prgm_b_out;  // CLB with 8 LUT-FF slices
wire CLB_prgm_b_out_1,CLB_prgm_b_out_2,CLB_prgm_b_out_3,CLB_prgm_b_out_4,CLB_prgm_b_out_5,CLB_prgm_b_out_6;



wire [15:0] look_up_t1;     	wire [15:0] look_up_t5;
wire [15:0] look_up_t2;   	wire [15:0] look_up_t6;
wire [15:0] look_up_t3;    	wire [15:0] look_up_t7;
wire [15:0] look_up_t4;     	wire [15:0] look_up_t8;

wire [4:0] interconnect_a1;     wire [4:0] interconnect_e1;    //interconnect configuration bits for each inout of LUT
wire [4:0] interconnect_a2;     wire [4:0] interconnect_e2;
wire [4:0] interconnect_a3;     wire [4:0] interconnect_e3;
wire [4:0] interconnect_a4;     wire [4:0] interconnect_e4;
                                
wire [4:0] interconnect_b1;     wire [4:0] interconnect_f1;
wire [4:0] interconnect_b2;     wire [4:0] interconnect_f2;
wire [4:0] interconnect_b3;     wire [4:0] interconnect_f3;
wire [4:0] interconnect_b4;     wire [4:0] interconnect_f4;
                               
wire [4:0] interconnect_c1;     wire [4:0] interconnect_g1;
wire [4:0] interconnect_c2;     wire [4:0] interconnect_g2;
wire [4:0] interconnect_c3;     wire [4:0] interconnect_g3;
wire [4:0] interconnect_c4;     wire [4:0] interconnect_g4;
                                
wire [4:0] interconnect_d1;     wire [4:0] interconnect_h1;
wire [4:0] interconnect_d2;     wire [4:0] interconnect_h2;
wire [4:0] interconnect_d3;     wire [4:0] interconnect_h3;
wire [4:0] interconnect_d4;     wire [4:0] interconnect_h4;

wire a1,a2,a3,a4,b1,b2,b3,b4,c1,c2,c3,c4,d1,d2,d3,d4,switch1,switch2,switch3,switch4;
wire e1,e2,e3,e4,f1,f2,f3,f4,g1,g2,g3,g4,h1,h2,h3,h4,switch5,switch6,switch7,switch8;
wire bit_out1,bit_out2,bit_out3,bit_out4,bit_out5,bit_out6,bit_out7;
wire carry_conf_mux1,carry_conf_mux2,carry_conf_mux3,carry_conf_mux4,carry_conf_mux5,carry_conf_mux6,carry_conf_mux7,carry_conf_mux8;
wire carry_out1,carry_out2,carry_out3,carry_out4,carry_out5,carry_out6,carry_out7;

//configuring lut and CLB interconnect matrix
look_up_table_interconnect_config LUT_interconnect1(.bit_in(bit_in),.CLB_prgm_b(CLB_prgm_b),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b_in(CLB_prgm_b_in),.CLB_prgm_b_out(CLB_prgm_b_out_1),.lut(look_up_t1),.interconnect_config_x1(interconnect_a1),.interconnect_config_x2(interconnect_a2),
	.interconnect_config_x3(interconnect_a3),.interconnect_config_x4(interconnect_a4),.mux_switch(switch1),.carryOut_sel_mux(carry_conf_mux1));

look_up_table_interconnect_config LUT_interconnect2(.bit_in(bit_in),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b_in(CLB_prgm_b_out_1),.CLB_prgm_b_out(CLB_prgm_b_out_2),
	.lut(look_up_t2),.interconnect_config_x1(interconnect_b1),.interconnect_config_x2(interconnect_b2),                                
	.interconnect_config_x3(interconnect_b3),.interconnect_config_x4(interconnect_b4),.mux_switch(switch2),.CLB_prgm_b(CLB_prgm_b),.carryOut_sel_mux(carry_conf_mux2));   
                                                                                                                                       
look_up_table_interconnect_config LUT_interconnect3(.bit_in(bit_in),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b_in(CLB_prgm_b_out_2),.CLB_prgm_b_out(CLB_prgm_b_out_3),
	.lut(look_up_t3),.interconnect_config_x1(interconnect_c1),.interconnect_config_x2(interconnect_c2),                                
	.interconnect_config_x3(interconnect_c3),.interconnect_config_x4(interconnect_c4),.mux_switch(switch3),.CLB_prgm_b(CLB_prgm_b),.carryOut_sel_mux(carry_conf_mux3));   
                                                                                                                                       
look_up_table_interconnect_config LUT_interconnect4(.bit_in(bit_in),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b_in(CLB_prgm_b_out_3),.CLB_prgm_b_out(CLB_prgm_b_out_4),
	.lut(look_up_t4),.interconnect_config_x1(interconnect_d1),.interconnect_config_x2(interconnect_d2),                                
	.interconnect_config_x3(interconnect_d3),.interconnect_config_x4(interconnect_d4),.mux_switch(switch4),.CLB_prgm_b(CLB_prgm_b),.carryOut_sel_mux(carry_conf_mux4));   
                                                                                                                                       
look_up_table_interconnect_config LUT_interconnect5(.bit_in(bit_in),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b_in(CLB_prgm_b_out_4),.CLB_prgm_b_out(CLB_prgm_b_out_5),
	.lut(look_up_t5),.interconnect_config_x1(interconnect_e1),.interconnect_config_x2(interconnect_e2),                                
	.interconnect_config_x3(interconnect_e3),.interconnect_config_x4(interconnect_e4),.mux_switch(switch5),.CLB_prgm_b(CLB_prgm_b),.carryOut_sel_mux(carry_conf_mux5));   
                                                                                                                                       
look_up_table_interconnect_config LUT_interconnect6(.bit_in(bit_in),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b_in(CLB_prgm_b_out_5),.CLB_prgm_b_out(CLB_prgm_b_out_6),
	.lut(look_up_t6),.interconnect_config_x1(interconnect_f1),.interconnect_config_x2(interconnect_f2),                                
	.interconnect_config_x3(interconnect_f3),.interconnect_config_x4(interconnect_f4),.mux_switch(switch6),.CLB_prgm_b(CLB_prgm_b),.carryOut_sel_mux(carry_conf_mux6));   
                                                                                                                                       
look_up_table_interconnect_config LUT_interconnect7(.bit_in(bit_in),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b_in(CLB_prgm_b_out_6),.CLB_prgm_b_out(CLB_prgm_b_out_7),
	.lut(look_up_t7),.interconnect_config_x1(interconnect_g1),.interconnect_config_x2(interconnect_g2),                                
	.interconnect_config_x3(interconnect_g3),.interconnect_config_x4(interconnect_g4),.mux_switch(switch7),.CLB_prgm_b(CLB_prgm_b),.carryOut_sel_mux(carry_conf_mux7));   
                                                                                                                                       
look_up_table_interconnect_config LUT_interconnect8(.bit_in(bit_in),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b_in(CLB_prgm_b_out_7),.CLB_prgm_b_out(CLB_prgm_b_out),
	.lut(look_up_t8),.interconnect_config_x1(interconnect_h1),.interconnect_config_x2(interconnect_h2),
	.interconnect_config_x3(interconnect_h3),.interconnect_config_x4(interconnect_h4),.mux_switch(switch8),.CLB_prgm_b(CLB_prgm_b),.carryOut_sel_mux(carry_conf_mux8));


//cnfiguration ends

//connecting the inputs of all 8 LUTs to the CLB interconnect matrix

//each inout line of the 4-input LUT can be connected to any one of the 18 input lines (I1-I18) or to any one of the 8 output lines of the LUT(IQ1-IQ8)




interconnect_unit A1(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_a1),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(a1));
interconnect_unit A2(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_a2),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(a2));
interconnect_unit A3(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_a3),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(a3));
interconnect_unit A4(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_a4),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(a4));

interconnect_unit B1(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_b1),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(b1));
interconnect_unit B2(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_b2),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(b2));
interconnect_unit B3(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_b3),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(b3));
interconnect_unit B4(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_b3),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(b4));

interconnect_unit C1(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_c1),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(c1));
interconnect_unit C2(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_c2),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(c2));
interconnect_unit C3(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_c3),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(c3));
interconnect_unit C4(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_c4),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(c4));

interconnect_unit D1(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_d1),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(d1));
interconnect_unit D2(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_d2),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(d2));
interconnect_unit D3(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_d3),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(d3));
interconnect_unit D4(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_d4),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(d4));

interconnect_unit E1(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_e1),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(e1));
interconnect_unit E2(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_e2),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(e2));
interconnect_unit E3(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_e3),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(e3));
interconnect_unit E4(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_e4),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(e4));

interconnect_unit F1(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_f1),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(f1));
interconnect_unit F2(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_f2),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(f2));
interconnect_unit F3(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_f3),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(f3));
interconnect_unit F4(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_f4),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(f4));

interconnect_unit G1(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_g1),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(g1));
interconnect_unit G2(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_g2),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(g2));
interconnect_unit G3(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_g3),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(g3));
interconnect_unit G4(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_g4),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(g4));

interconnect_unit H1(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_h1),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(h1));
interconnect_unit H2(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_h2),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(h2));
interconnect_unit H3(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_h3),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(h3));
interconnect_unit H4(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_h4),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.lut_inp(h4));

//interconnections made for all LUT inputs

//passing the values at each inout line to the LUT

logic_pair L1(.x1(a1),.x2(a2),.x3(a3),.x4(a4),.clk(clk),.reset(reset),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.look_up_t(look_up_t1),.switch(switch1),.out(IQ1),.carry_in(carry_in),.carry_out(carry_out1),.carryOut_sel_mux(carry_conf_mux1));

logic_pair L2(.x1(b1),.x2(b2),.x3(b3),.x4(b4),.clk(clk),.reset(reset),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.look_up_t(look_up_t2),.switch(switch2),.out(IQ2),.carry_in(carry_out1),.carry_out(carry_out2),.carryOut_sel_mux(carry_conf_mux2));

logic_pair L3(.x1(c1),.x2(c2),.x3(c3),.x4(c4),.clk(clk),.reset(reset),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.look_up_t(look_up_t3),.switch(switch3),.out(IQ3),.carry_in(carry_out2),.carry_out(carry_out3),.carryOut_sel_mux(carry_conf_mux3));

logic_pair L4(.x1(d1),.x2(d2),.x3(d3),.x4(d4),.clk(clk),.reset(reset),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.look_up_t(look_up_t4),.switch(switch4),.out(IQ4),.carry_in(carry_out3),.carry_out(carry_out4),.carryOut_sel_mux(carry_conf_mux4));

logic_pair L5(.x1(e1),.x2(e2),.x3(e3),.x4(e4),.clk(clk),.reset(reset),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.look_up_t(look_up_t5),.switch(switch5),.out(IQ5),.carry_in(carry_out4),.carry_out(carry_out5),.carryOut_sel_mux(carry_conf_mux5));

logic_pair L6(.x1(f1),.x2(f2),.x3(f3),.x4(f4),.clk(clk),.reset(reset),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.look_up_t(look_up_t6),.switch(switch6),.out(IQ6),.carry_in(carry_out5),.carry_out(carry_out6),.carryOut_sel_mux(carry_conf_mux6));

logic_pair L7(.x1(g1),.x2(g2),.x3(g3),.x4(g4),.clk(clk),.reset(reset),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.look_up_t(look_up_t7),.switch(switch7),.out(IQ7),.carry_in(carry_out6),.carry_out(carry_out7),.carryOut_sel_mux(carry_conf_mux7));

logic_pair L8(.x1(h1),.x2(h2),.x3(h3),.x4(h4),.clk(clk),.reset(reset),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.look_up_t(look_up_t8),.switch(switch8),.out(IQ8),.carry_in(carry_out7),.carry_out(carry_out),.carryOut_sel_mux(carry_conf_mux8)); 



endmodule
