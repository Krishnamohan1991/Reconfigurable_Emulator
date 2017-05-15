module CYMUX0_inp(bypass,x0,x1,x0ANDx1,select,CYMUX_inp);
input bypass,x0,x1,x0ANDx1;
input [2:0] select;
output reg CYMUX_inp;
initial CYMUX_inp=0;
always@(*)
begin
case (select)
3'b000:  CYMUX_inp = 1'b0;
3'b001:  CYMUX_inp = 1'b1;
3'b010:  CYMUX_inp = x1;
3'b011:  CYMUX_inp = x0ANDx1;
3'b100:  CYMUX_inp = x0;
//default : out <= lut;
endcase
end
endmodule
