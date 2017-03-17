module SRAM_switch(data_in,enable,data_out);
inout data_in;
input enable;
output reg data_out;


always@(data_in) begin
if (enable==1'b1 )

data_out=data_in;

else
	data_out=1'bz;

end

endmodule