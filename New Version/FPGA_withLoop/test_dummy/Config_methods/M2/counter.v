module counter(prgm_b_in,cb_prgm_b_in,cb_prgm_b,cb_prgm_b_out,prgm_b_out,clk,reset);
input prgm_b_in,cb_prgm_b_in,cb_prgm_b,clk,reset;
output reg cb_prgm_b_out,prgm_b_out;
reg [4:0] count;

initial begin
	count[4:0]=5'b00000;
	cb_prgm_b_out=1'b0;
end

always @(posedge clk or posedge reset) begin
if(prgm_b_in==1'b0 && cb_prgm_b_in==1'b1 && cb_prgm_b_out!=1'b1 && cb_prgm_b==1'b1)	begin
	if(reset)
		cb_prgm_b_out=1'b0;
		
	else begin
		count[4:0]=count[4:0]+1'b1; 
		if(count[4:0]==5'b11010)
		begin
			cb_prgm_b_out=1'b1;
			count[4:0]=5'b00000;
			prgm_b_out=1'b0;
		end
	end
	
end	

end

endmodule	