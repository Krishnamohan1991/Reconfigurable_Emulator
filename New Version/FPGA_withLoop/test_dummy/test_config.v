module test_config(bit_in_CB,bit_out_CB,clk,reset,prgm_b_in,prgm_b_out,cb_prgm_b,cb_prgm_b_in,cb_prgm_b_out,x1_G0,x2_G0,x3_G0,x4_G0,x5_G0,x6_G0,
	x7_G0,x8_G0,x9_G0,q1_G0,q2_G0,q3_G0,q4_G0,x1_G1,x2_G1,x3_G1,x4_G1,x5_G1,x6_G1,x7_G1,x8_G1,x9_G1,q1_G1,
	q2_G1,q3_G1,q4_G1,cb_prgm_b);
input cb_prgm_b;
output reg cb_prgm_b_out,prgm_b_out;
reg [4:0] count;
output reg x1_G0,x2_G0,x3_G0,x4_G0,x5_G0,x6_G0,x7_G0,x8_G0,x9_G0,q1_G0,q2_G0,q3_G0,q4_G0,x1_G1,x2_G1,x3_G1,x4_G1,x5_G1,x6_G1,x7_G1,x8_G1,x9_G1,q1_G1,q2_G1,q3_G1,q4_G1,bit_out_CB;

input bit_in_CB,clk,reset,prgm_b_in,cb_prgm_b_in;

initial begin
	count[4:0]=5'b00000;
	cb_prgm_b_out=1'b0;
		x1_G0 <= 0;  
		x2_G0 <= 0;  
		x3_G0 <= 0;  
		x4_G0 <= 0;  
		x5_G0 <= 0;  
		x6_G0 <= 0;  
		x7_G0 <= 0;  
		x8_G0 <= 0;  
		x9_G0 <= 0;  
		q1_G0 <= 0;   
		q2_G0 <= 0;  
		q3_G0 <= 0;  
		q4_G0 <= 0;  
		x1_G1 <= 0;  
		x2_G1 <= 0;  
		x3_G1 <= 0;  
		x4_G1 <= 0;  
		x5_G1 <= 0;  
		x6_G1 <= 0;  
		x7_G1 <= 0;  
		x8_G1 <= 0;  
		x9_G1 <= 0;  
		q1_G1 <= 0;  
		q2_G1 <= 0;  
		q3_G1 <= 0;  
		q4_G1 <= 0; 
		bit_out_CB <= 0; 
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

always @ (posedge clk or posedge reset)
begin

if (prgm_b_in==1'b0 && cb_prgm_b_in==1'b1 && cb_prgm_b_out!=1'b1 && cb_prgm_b==1'b1) begin
	if(reset) begin
		x1_G0 <= 0;  
		x2_G0 <= 0;  
		x3_G0 <= 0;  
		x4_G0 <= 0;  
		x5_G0 <= 0;  
		x6_G0 <= 0;  
		x7_G0 <= 0;  
		x8_G0 <= 0;  
		x9_G0 <= 0;  
		q1_G0 <= 0;  
		q2_G0 <= 0;  
		q3_G0 <= 0;  
		q4_G0 <= 0;  
		x1_G1 <= 0;  
		x2_G1 <= 0;  
		x3_G1 <= 0;  
		x4_G1 <= 0;  
		x5_G1 <= 0;  
		x6_G1 <= 0;  
		x7_G1 <= 0;  
		x8_G1 <= 0;  
		x9_G1 <= 0;  
		q1_G1 <= 0;  
		q2_G1 <= 0;  
		q3_G1 <= 0;  
		q4_G1 <= 0;  
		bit_out_CB <= 0;

	end
	else begin
	
		x1_G0 <= bit_in_CB; 
		x2_G0 <= x1_G0;     
		x3_G0 <= x2_G0;     
		x4_G0 <= x3_G0;     
		x5_G0 <= x4_G0;     
		x6_G0 <= x5_G0;     
		x7_G0 <= x6_G0;     
		x8_G0 <= x7_G0;     
		x9_G0 <= x8_G0;     
		q1_G0 <= x9_G0;     
		q2_G0 <= q1_G0;     
		q3_G0 <= q2_G0;     
		q4_G0 <= q3_G0;     
		x1_G1 <= q4_G0;     
		x2_G1 <= x1_G1;     
		x3_G1 <= x2_G1;     
		x4_G1 <= x3_G1;     
		x5_G1 <= x4_G1;     
		x6_G1 <= x5_G1;     
		x7_G1 <= x6_G1;     
		x8_G1 <= x7_G1;     
		x9_G1 <= x8_G1;     
		q1_G1 <= x9_G1;     
		q2_G1 <= q1_G1;     
		q3_G1 <= q2_G1;     
		q4_G1 <= q3_G1;     

	end

end //outer if ends

end //always ends
 
 	
endmodule