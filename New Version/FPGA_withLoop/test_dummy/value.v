module value(in,out);
input in;
output reg out;

always@(*) begin 
#2 out=in;
end

endmodule
