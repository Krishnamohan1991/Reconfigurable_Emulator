module logic_pair(x0,x1,x2,x3,clk,reset,prgm_b,CLB_prgm_b,carry_in,
carry_out,CYO_MUX_SEL,bypass_in,CY0_MUX_SEL,GWE,WE,data_in,config_data_in,CLB_prgm_b_in,
CLB_prgm_b_out,SUM_LUT_MUX_SEL,SUM_LUT_OUT,DFF_INP_MUX_SEL,DFF_OUT);


input x0,x1,x2,x3,CLB_prgm_b,bypass_in,config_data_in,data_in,CLB_prgm_b_in,
CLB_prgm_b_out,SUM_LUT_MUX_SEL;
input [2:0] CY0_MUX_SEL;

input clk,reset,prgm_b,CYO_MUX_SEL,carry_in,DFF_INP_MUX_SEL,GWE,WE;

output out,carry_out;
output SUM_LUT_OUT;
output DFF_OUT;
wire out_lut, DFF_OUT,sum_out,DFF_inp;

LU SLICEM(.x0(x0),.x1(x1),.x2(x2),.x3(x3),.lut_out(out_lut),.prgm_b(prgm_b),.config_data_in(config_data_in),.CLB_prgm_b(CLB_prgm_b),.CLB_prgm_b_in(CLB_prgm_b_in),.WE(WE),.data_in(data_in),.clk(clk),.reset(reset),.GWE(GWE),.CLB_prgm_b_out(CLB_prgm_b_out));

fast_carry_chain FCC(.x1(x1),.x0(x0),.carry_in(carry_in),.bypass(bypass_in),.LUT_output(out_lut),.carry_out(carry_out),.sum_out(sum_out),.CYO_MUX_SEL(CYO_MUX_SEL),.CY0_MUX_SEL(CY0_MUX_SEL));

MUX2X1 SUM_LUT_MUX(.in1(sum_out),.in2(out_lut),.sel(SUM_LUT_MUX_SEL),.out(SUM_LUT_OUT));
MUX2X1 DFF_INP_MUX(.in1(SUM_LUT_OUT),.in2(bypass_in),.sel(DFF_INP_MUX_SEL),.out(DFF_inp));
syn_D_FF D_FF(.data_in(DFF_inp),.clk(clk),.reset(reset),.data_out(DFF_OUT));

//bypass_out,
//output lines from a Logic Unit -- carry out,sum/lut_out,DFF_OUT,bypass_out

//input shift_in_data,shift_in,carry_out_shift_out_sel;
//wire data_LUT_in;
//output shift_data_out,Carry_outOrshift_out;
//output bypass_out;
//output shiftInData_Bypass;
//MUX2X1 carry_out_shift_out(.in1(carry_out),.in2(shift_data_out),.sel(carry_out_shift_out_sel),.out(Carry_outOrshift_out));
//MUX2X1 shift_data_in_BY(.in1(shift_in_data),.in2(bypass_in),.sel(SUM_LUT_MUX_SEL),.out(shiftInData_Bypass));
//MUX2X1 shift_data_in(.in1(shift_in_data),.in2(data_in),.sel(shift_data_in_sel),.out(data_LUT_in));
//MUX2X1 LUT_DATA_IN(.in1(config_data_in),.in2(data_sh_wr),.sel(prgm_b & GWE),.out(data_LUT_in));
//value Bypass_in_out(.in(bypass_in),.out(bypass_out));


endmodule
