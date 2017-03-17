module connect(in,out,enable);
parameter f=1;
input in,enable;
output reg out;
generate
always@(in)begin
out=in;
end

endgenerate

endmodule