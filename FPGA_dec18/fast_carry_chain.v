module fast_carry_chain(x1,x0,carry_in,bypass,LUT_output,carry_out,sum_out,CYO_MUX_SEL,CY0_MUX_SEL);
input x0,x1,carry_in,LUT_output,CYO_MUX_SEL,bypass;
input [2:0] CY0_MUX_SEL;
output reg sum_out;
output carry_out;
wire carryOutMuxSelSignal;
wire CYMUX0_inp;

CYMUX0_inp CYO_inp0 (.bypass(bypass),.x0(x0),.x1(x1),.x0ANDx1(x0&x1),.select(CY0_MUX_SEL),.CYMUX_inp(CYMUX0_inp));

MUX2X1 CYO_SEL(.in1(1),.in2(LUT_output),.sel(CYO_MUX_SEL),.out(carryOutMuxSelSignal));

MUX2X1 CYO_MUX(.in1(CYMUX0_inp),.in2(carry_in),.sel(carryOutMuxSelSignal),.out(carry_out));

always@(*)
begin

sum_out=LUT_output^carry_in;


end



endmodule
