module syn_D_FF(data_out,data_in,clk,reset); 
input wire data_in, clk,reset;

output reg data_out;
initial
begin
	data_out=1'b0;
end

always@(posedge clk or posedge reset)
begin
if(reset)
data_out<=1'd0;
else
data_out<=data_in; end

endmodule