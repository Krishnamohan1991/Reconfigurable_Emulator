module fast_carry_chain(multiplier_bit,carry_in,LUT_output,carry_out,sum_out,carryOut_sel_mux);
input multiplier_bit,carry_in,LUT_output,carryOut_sel_mux;
output reg sum_out;
output carry_out;
wire carryOut_control_signal;


MUX2X1 carryOut_control(.in1(LUT_output),.in2(1),.sel(carryOut_sel_mux),.out(carryOut_control_signal));

MUX2X1 carryOut_mux(.in1(multiplier_bit),.in2(carry_in),.sel(carryOut_control_signal),.out(carry_out));

always@(*)
begin

sum_out=LUT_output^carry_in;


end



endmodule
