module MUX_FF_LUT(lut,ff,sel,out);
input lut,ff,sel;
output  reg out;
initial out=0;
always@(*)
begin
case (sel)
1'b0:  out = lut;
1'b1:  out = ff;
//default : out <= lut;
endcase
end
endmodule