module config_cb_behav(bit_in,clk,reset,prgm_b,cb_prgm_b,cb_prgm_b_in,cb_prgm_b_out,
	                    x1_G0,x1_G1,x1_G2,x1_G3,x1_G4,x1_G5,x1_G6,x1_G7,x2_G0,x2_G1,x2_G2,x2_G3,x2_G4,x2_G5,x2_G6,x2_G7,x3_G0,x3_G1,x3_G2,x3_G3,x3_G4,x3_G5,x3_G6,x3_G7,
x4_G0,x4_G1,x4_G2,x4_G3,q1_G0,q1_G1,q1_G2,q1_G3,q2_G0,q2_G1,q2_G2,q2_G3,x5_G4,x5_G5,x5_G6,x5_G7,
x4_G4,x4_G5,x4_G6,x4_G7,q1_G4,q1_G5,q1_G6,q1_G7,q2_G4,q2_G5,q2_G6,q2_G7,Rq1_G0,Rq1_G1,Rq1_G2,Rq1_G3,Rq1_G4,Rq1_G5,Rq1_G6,Rq1_G7,Rq2_G0,Rq2_G1,Rq2_G2,Rq2_G3,Rq2_G4,Rq2_G5,Rq2_G6,Rq2_G7,
Cy1_G0,Cy1_G1,Cy1_G2,Cy1_G3,Cy1_G4,Cy1_G5,Cy1_G6,Cy1_G7,Cy2_G0,Cy2_G1,Cy2_G2,Cy2_G3,Cy2_G4,Cy2_G5,Cy2_G6,Cy2_G7);

output reg x1_G0;output reg x1_G1;output reg x1_G2;output reg x1_G3;output reg x2_G0;output reg x2_G1;output reg x2_G2;output reg x2_G3;
output reg x3_G0;output reg x3_G1;output reg x3_G2;output reg x3_G3;output reg x4_G0;output reg x4_G1;output reg x4_G2;output reg x4_G3;
output reg q1_G0;output reg q1_G1;output reg q1_G2;output reg q1_G3;output reg q2_G0;output reg q2_G1;output reg q2_G2;output reg q2_G3;
output reg q3_G0;output reg q3_G1;output reg q3_G2;output reg q3_G3;output reg q4_G0;output reg q4_G1;output reg q4_G2;output reg q4_G3;
output reg x1_G4;output reg x1_G5;output reg x1_G6;output reg x1_G7;output reg x2_G4;output reg x2_G5;output reg x2_G6;output reg x2_G7;
output reg x3_G4;output reg x3_G5;output reg x3_G6;output reg x3_G7;output reg x4_G4;output reg x4_G5;output reg x4_G6;output reg x4_G7;
output reg q1_G4;output reg q1_G5;output reg q1_G6;output reg q1_G7;output reg q2_G4;output reg q2_G5;output reg q2_G6;output reg q2_G7;
output reg x5_G4;output reg x5_G5;output reg x5_G6;output reg x5_G7;output reg Rq1_G0;output reg Rq1_G1;output reg Rq1_G2;output reg Rq1_G3;	
output reg Rq1_G4;output reg Rq1_G5;output reg Rq1_G6;output reg Rq1_G7;output reg Rq2_G0;output reg Rq2_G1;output reg Rq2_G2;output reg Rq2_G3;
output reg Rq2_G4;output reg Rq2_G5;output reg Rq2_G6;output reg Rq2_G7;output reg Cy1_G0;output reg Cy1_G1;output reg Cy1_G2;output reg Cy1_G3;output reg Cy1_G4;
output reg Cy1_G5;output reg Cy1_G6;output reg Cy1_G7;output reg Cy2_G0;output reg Cy2_G1;output reg Cy2_G2;output reg Cy2_G3;output reg Cy2_G4;
output reg Cy2_G5;output reg Cy2_G6;output reg Cy2_G7;


output reg cb_prgm_b_out;  

input bit_in,clk,reset,prgm_b,cb_prgm_b,cb_prgm_b_in;
reg [6:0] count;

initial begin
	count[6:0]=7'b0000000;
	cb_prgm_b_out=1'b0;
	x1_G0 <= 1'b0;  x1_G2 <= 1'b0;   x1_G4 <= 1'b0;   x1_G6 <= 1'b0;
	x2_G0 <= 1'b0;  x2_G2 <= 1'b0;   x2_G4 <= 1'b0;   x2_G6 <= 1'b0;
	x3_G0 <= 1'b0;  x3_G2 <= 1'b0;   x3_G4 <= 1'b0;   x3_G6 <= 1'b0;
	x4_G0 <= 1'b0;  x4_G2 <= 1'b0;   x4_G4 <= 1'b0;   x4_G6 <= 1'b0;

	x1_G1 <= 1'b0;  x1_G3 <= 1'b0;   x1_G5 <= 1'b0;   x1_G7 <= 1'b0;
	x2_G1 <= 1'b0;  x2_G3 <= 1'b0;   x2_G5 <= 1'b0;   x2_G7 <= 1'b0;
	x3_G1 <= 1'b0;  x3_G3 <= 1'b0;   x3_G5 <= 1'b0;   x3_G7 <= 1'b0;
	x4_G1 <= 1'b0;  x4_G3 <= 1'b0;   x4_G5 <= 1'b0;   x4_G7 <= 1'b0;
		
	q1_G0 <= 1'b0;  q1_G2 <= 1'b0;   q1_G4 <= 1'b0;   q1_G6 <= 1'b0;
	q1_G1 <= 1'b0;  q1_G3 <= 1'b0;   q1_G5 <= 1'b0;   q1_G7 <= 1'b0;

	q2_G0 <= 1'b0;  q2_G2 <= 1'b0;   q2_G4 <= 1'b0;   q2_G6 <= 1'b0;	
	q2_G1 <= 1'b0;  q2_G3 <= 1'b0;   q2_G5 <= 1'b0;   q2_G7 <= 1'b0;

	Rq1_G0 <= 1'b0;  Rq1_G2 <= 1'b0;   Rq1_G4 <= 1'b0;   Rq1_G6 <= 1'b0;
	Rq1_G1 <= 1'b0;  Rq1_G3 <= 1'b0;   Rq1_G5 <= 1'b0;   Rq1_G7 <= 1'b0;

	Rq2_G0 <= 1'b0;  Rq2_G2 <= 1'b0;   Rq2_G4 <= 1'b0;   Rq2_G6 <= 1'b0;	
	Rq2_G1 <= 1'b0;  Rq2_G3 <= 1'b0;   Rq2_G5 <= 1'b0;   Rq2_G7 <= 1'b0;

	Cy1_G0 <= 1'b0;  Cy1_G2 <= 1'b0;   Cy1_G4 <= 1'b0;   Cy1_G6 <= 1'b0;
	Cy1_G1 <= 1'b0;  Cy1_G3 <= 1'b0;   Cy1_G5 <= 1'b0;   Cy1_G7 <= 1'b0;

	Cy2_G0 <= 1'b0;  Cy2_G2 <= 1'b0;   Cy2_G4 <= 1'b0;   Cy2_G6 <= 1'b0;	
	Cy2_G1 <= 1'b0;  Cy2_G3 <= 1'b0;   Cy2_G5 <= 1'b0;   Cy2_G7 <= 1'b0;
	
	

                                        
end
	

always @(posedge clk or posedge reset)
 begin
	if(prgm_b==1'b0 && cb_prgm_b_in==1'b1 && cb_prgm_b_out!=1'b1 && cb_prgm_b==1'b1)	
	begin
	if(reset)
		cb_prgm_b_out=1'b0;
		
	else begin
		count[6:0]=count[6:0]+1'b1; 
		if(count[6:0]==7'b1010000)  // MAKE IT 48+1 ??
		begin
			cb_prgm_b_out=1'b1;
			count[6:0]=7'b0000000;
			//prgm_b_out=1'b0;
		end  //ends
	end //else ends

	
	end	 //first if ends

end //always block ends


always @ (posedge clk or posedge reset)
begin
	if (prgm_b==1'b0 && cb_prgm_b_in==1'b1 && cb_prgm_b_out!=1'b1 && cb_prgm_b==1'b1) begin
		if(reset) begin
			x1_G0 <= 1'b0;  x1_G2 <= 1'b0;   x1_G4 <= 1'b0;   x1_G6 <= 1'b0;
			x2_G0 <= 1'b0;  x2_G2 <= 1'b0;   x2_G4 <= 1'b0;   x2_G6 <= 1'b0;
			x3_G0 <= 1'b0;  x3_G2 <= 1'b0;   x3_G4 <= 1'b0;   x3_G6 <= 1'b0;
			x4_G0 <= 1'b0;  x4_G2 <= 1'b0;   x4_G4 <= 1'b0;   x4_G6 <= 1'b0;
			
			q1_G0 <= 1'b0;  q1_G2 <= 1'b0;   q1_G4 <= 1'b0;   q1_G6 <= 1'b0;
			q2_G0 <= 1'b0;  q2_G2 <= 1'b0;   q2_G4 <= 1'b0;   q2_G6 <= 1'b0;
			
			x1_G1 <= 1'b0;  x1_G3 <= 1'b0;   x1_G5 <= 1'b0;   x1_G7 <= 1'b0;
			x2_G1 <= 1'b0;  x2_G3 <= 1'b0;   x2_G5 <= 1'b0;   x2_G7 <= 1'b0;
			x3_G1 <= 1'b0;  x3_G3 <= 1'b0;   x3_G5 <= 1'b0;   x3_G7 <= 1'b0;
			x4_G1 <= 1'b0;  x4_G3 <= 1'b0;   x4_G5 <= 1'b0;   x4_G7 <= 1'b0;
			
			q1_G1 <= 1'b0;  q1_G3 <= 1'b0;   q1_G5 <= 1'b0;   q1_G7 <= 1'b0;
			q2_G1 <= 1'b0;  q2_G3 <= 1'b0;   q2_G5 <= 1'b0;   q2_G7 <= 1'b0;
		
			Rq1_G0 <= 1'b0;  Rq1_G2 <= 1'b0;   Rq1_G4 <= 1'b0;   Rq1_G6 <= 1'b0;
			Rq1_G1 <= 1'b0;  Rq1_G3 <= 1'b0;   Rq1_G5 <= 1'b0;   Rq1_G7 <= 1'b0;

			Rq2_G0 <= 1'b0;  Rq2_G2 <= 1'b0;   Rq2_G4 <= 1'b0;   Rq2_G6 <= 1'b0;	
			Rq2_G1 <= 1'b0;  Rq2_G3 <= 1'b0;   Rq2_G5 <= 1'b0;   Rq2_G7 <= 1'b0;

			Cy1_G0 <= 1'b0;  Cy1_G2 <= 1'b0;   Cy1_G4 <= 1'b0;   Cy1_G6 <= 1'b0;
			Cy1_G1 <= 1'b0;  Cy1_G3 <= 1'b0;   Cy1_G5 <= 1'b0;   Cy1_G7 <= 1'b0;

			Cy2_G0 <= 1'b0;  Cy2_G2 <= 1'b0;   Cy2_G4 <= 1'b0;   Cy2_G6 <= 1'b0;	
			Cy2_G1 <= 1'b0;  Cy2_G3 <= 1'b0;   Cy2_G5 <= 1'b0;   Cy2_G7 <= 1'b0;
			

		end
		else begin
			x1_G0 <= bit_in;     x1_G2 <= Cy2_G1;   x1_G4 <= Cy2_G3;  x1_G6 <= Cy2_G5;
			x2_G0 <= x1_G0;      x2_G2 <= x1_G2;    x2_G4 <= x1_G4;   x2_G6 <= x1_G6;
			x3_G0 <= x2_G0;      x3_G2 <= x2_G2;    x3_G4 <= x2_G4;   x3_G6 <= x2_G6;
			x4_G0 <= x3_G0;      x4_G2 <= x3_G2;    x4_G4 <= x3_G4;   x4_G6 <= x3_G6;
			
			q1_G0 <= x4_G0;      q1_G2 <= x4_G2;    q1_G4 <= x4_G4;   q1_G6 <= x4_G6;
			q2_G0 <= q1_G0;      q2_G2 <= q1_G2;    q2_G4 <= q1_G4;   q2_G6 <= q1_G6;
			Rq1_G0 <= q2_G0;     Rq1_G2 <= q2_G2;   Rq1_G4 <= q2_G4;  Rq1_G6 <= q2_G6;
			Rq2_G0 <= Rq1_G0;    Rq2_G2 <= Rq1_G2;  Rq2_G4 <= Rq1_G4; Rq2_G6 <= Rq1_G6;
			Cy1_G0 <= Rq2_G0;    Cy1_G2 <= Rq2_G2;  Cy1_G4 <= Rq2_G4; Cy1_G6 <= Rq2_G6;
			Cy2_G0 <= Cy1_G0;    Cy2_G2 <= Cy1_G2;  Cy2_G4 <= Cy1_G4; Cy2_G6 <= Cy1_G6;

			x1_G1 <= Cy2_G0;     x1_G3 <= Cy2_G2;   x1_G5 <= Cy2_G4;  x1_G7 <= Cy2_G6;
			x2_G1 <= x1_G1;      x2_G3 <= x1_G3;    x2_G5 <= x1_G5;   x2_G7 <= x1_G7;
			x3_G1 <= x2_G1;      x3_G3 <= x2_G3;    x3_G5 <= x2_G5;   x3_G7 <= x2_G7;
			x4_G1 <= x3_G1;      x4_G3 <= x3_G3;    x4_G5 <= x3_G5;   x4_G7 <= x3_G7;
			q1_G1 <= x4_G1;      q1_G3 <= x4_G3;    q1_G5 <= x4_G5;   q1_G7 <= x4_G7;
			q2_G1 <= q1_G1;      q2_G3 <= q1_G3;    q2_G5 <= q1_G5;   q2_G7 <= q1_G7;
			Rq1_G1 <= q2_G1;     Rq1_G3 <= q2_G3;   Rq1_G5 <= q2_G5;  Rq1_G7 <= q2_G7;			
			Rq2_G1 <= Rq1_G1;    Rq2_G3 <= Rq1_G3;  Rq2_G5 <= Rq1_G5; Rq2_G7 <= Rq1_G7;			
			Cy1_G1 <= Rq2_G1;    Cy1_G3 <= Rq2_G3;  Cy1_G5 <= Rq2_G5; Cy1_G7 <= Rq2_G7;				
			Cy2_G1 <= Cy1_G1;    Cy2_G3 <= Cy1_G3;  Cy2_G5 <= Cy1_G5; Cy2_G7 <= Cy1_G7;
			

                                                         
		end

	end
end
 
 	
endmodule
