module fast_carry_chain(x2,x1,carry_in,bypass,LUT_output,carry_out,sum_out,carryOut_sel_mux,CYMUX0_select);
input x2,x1,carry_in,LUT_output,carryOut_sel_mux,bypass;
input [2:0] CYMUX0_select;
output reg sum_out;
output carry_out;
wire carryOut_control_signal;
wire CYMUX0_inp;

CYMUX0_inp CY0 (.bypass(bypass),.x1(x1),.x2(x2),.select(CYMUX0_select),.CYMUX_inp(CYMUX0_inp));

MUX2X1 CYSEL(.in1(1),.in2(LUT_output),.sel(carryOut_sel_mux),.out(carryOut_control_signal));

MUX2X1 CYMUX(.in1(CYMUX0_inp),.in2(carry_in),.sel(carryOut_control_signal),.out(carry_out));

always@(*)
begin

sum_out=LUT_output^carry_in;


end



endmodule
