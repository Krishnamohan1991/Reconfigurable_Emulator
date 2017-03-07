module value(in,out);
input in;
output reg out;

//assign out= in;
always@(*) begin 
#2 out=in;
end 

endmodule
