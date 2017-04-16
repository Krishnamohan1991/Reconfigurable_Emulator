module MUX2X1(in1,in2,sel,out);
input in1,in2,sel;
output  reg out;
initial out=0;
always@(*)
begin
case (sel)
1'b0:  out = in1;
1'b1:  out = in2;

endcase
end
endmodule
