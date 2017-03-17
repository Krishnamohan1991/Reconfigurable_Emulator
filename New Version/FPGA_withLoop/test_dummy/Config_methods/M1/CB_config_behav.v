module config_cb_behav(bit_in,clk,reset,prgm_b,cb_prgm_b,cb_prgm_b_in,cb_prgm_b_out,
	                    x1_G0,x1_G1,x1_G2,x1_G3,x2_G0,x2_G1,x2_G2,x2_G3,x3_G0,x3_G1,x3_G2,x3_G3,
x4_G0,x4_G1,x4_G2,x4_G3,x5_G0,x5_G1,x5_G2,x5_G3,x6_G0,x6_G1,x6_G2,x6_G3,x7_G0,x7_G1,x7_G2,x7_G3,
x8_G0,x8_G1,x8_G2,x8_G3,q1_G0,q1_G1,q1_G2,q1_G3,q2_G0,q2_G1,q2_G2,q2_G3,q3_G0,q3_G1,q3_G2,q3_G3,
q4_G0,q4_G1,q4_G2,q4_G3,x1_G4,x1_G5,x1_G6,x1_G7,x2_G4,x2_G5,x2_G6,x2_G7,x3_G4,x3_G5,x3_G6,x3_G7,
x4_G4,x4_G5,x4_G6,x4_G7,x5_G4,x5_G5,x5_G6,x5_G7,x6_G4,x6_G5,x6_G6,x6_G7,x7_G4,x7_G5,x7_G6,x7_G7,
x8_G4,x8_G5,x8_G6,x8_G7,q1_G4,q1_G5,q1_G6,q1_G7,q2_G4,q2_G5,q2_G6,q2_G7,q3_G4,q3_G5,q3_G6,q3_G7,
q4_G4,q4_G5,q4_G6,q4_G7);

output reg x1_G0;output reg x1_G1;output reg x1_G2;output reg x1_G3;output reg x2_G0;output reg x2_G1;output reg x2_G2;output reg x2_G3;
output reg x3_G0;output reg x3_G1;output reg x3_G2;output reg x3_G3;output reg x4_G0;output reg x4_G1;output reg x4_G2;output reg x4_G3;
output reg x5_G0;output reg x5_G1;output reg x5_G2;output reg x5_G3;output reg x6_G0;output reg x6_G1;output reg x6_G2;output reg x6_G3;
output reg x7_G0;output reg x7_G1;output reg x7_G2;output reg x7_G3;output reg x8_G0;output reg x8_G1;output reg x8_G2;output reg x8_G3;
output reg q1_G0;output reg q1_G1;output reg q1_G2;output reg q1_G3;output reg q2_G0;output reg q2_G1;output reg q2_G2;output reg q2_G3;
output reg q3_G0;output reg q3_G1;output reg q3_G2;output reg q3_G3;output reg q4_G0;output reg q4_G1;output reg q4_G2;output reg q4_G3;
output reg x1_G4;output reg x1_G5;output reg x1_G6;output reg x1_G7;output reg x2_G4;output reg x2_G5;output reg x2_G6;output reg x2_G7;
output reg x3_G4;output reg x3_G5;output reg x3_G6;output reg x3_G7;output reg x4_G4;output reg x4_G5;output reg x4_G6;output reg x4_G7;
output reg x5_G4;output reg x5_G5;output reg x5_G6;output reg x5_G7;output reg x6_G4;output reg x6_G5;output reg x6_G6;output reg x6_G7;
output reg x7_G4;output reg x7_G5;output reg x7_G6;output reg x7_G7;output reg x8_G4;output reg x8_G5;output reg x8_G6;output reg x8_G7;
output reg q1_G4;output reg q1_G5;output reg q1_G6;output reg q1_G7;output reg q2_G4;output reg q2_G5;output reg q2_G6;output reg q2_G7;
output reg q3_G4;output reg q3_G5;output reg q3_G6;output reg q3_G7;output reg q4_G4;output reg q4_G5;output reg q4_G6;output reg q4_G7;

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
	x5_G0 <= 1'b0;  x5_G2 <= 1'b0;   x5_G4 <= 1'b0;   x5_G6 <= 1'b0;
	x6_G0 <= 1'b0;  x6_G2 <= 1'b0;   x6_G4 <= 1'b0;   x6_G6 <= 1'b0;
	x7_G0 <= 1'b0;  x7_G2 <= 1'b0;   x7_G4 <= 1'b0;   x7_G6 <= 1'b0;
	x8_G0 <= 1'b0;  x8_G2 <= 1'b0;   x8_G4 <= 1'b0;   x8_G6 <= 1'b0;
	q1_G0 <= 1'b0;  q1_G2 <= 1'b0;   q1_G4 <= 1'b0;   q1_G6 <= 1'b0;
	q2_G0 <= 1'b0;  q2_G2 <= 1'b0;   q2_G4 <= 1'b0;   q2_G6 <= 1'b0;
	q3_G0 <= 1'b0;  q3_G2 <= 1'b0;   q3_G4 <= 1'b0;   q3_G6 <= 1'b0;
	q4_G0 <= 1'b0;  q4_G2 <= 1'b0;   q4_G4 <= 1'b0;   q4_G6 <= 1'b0;
	x1_G1 <= 1'b0;  x1_G3 <= 1'b0;   x1_G5 <= 1'b0;   x1_G7 <= 1'b0;
	x2_G1 <= 1'b0;  x2_G3 <= 1'b0;   x2_G5 <= 1'b0;   x2_G7 <= 1'b0;
	x3_G1 <= 1'b0;  x3_G3 <= 1'b0;   x3_G5 <= 1'b0;   x3_G7 <= 1'b0;
	x4_G1 <= 1'b0;  x4_G3 <= 1'b0;   x4_G5 <= 1'b0;   x4_G7 <= 1'b0;
	x5_G1 <= 1'b0;  x5_G3 <= 1'b0;   x5_G5 <= 1'b0;   x5_G7 <= 1'b0;
	x6_G1 <= 1'b0;  x6_G3 <= 1'b0;   x6_G5 <= 1'b0;   x6_G7 <= 1'b0;
	x7_G1 <= 1'b0;  x7_G3 <= 1'b0;   x7_G5 <= 1'b0;   x7_G7 <= 1'b0;
	x8_G1 <= 1'b0;  x8_G3 <= 1'b0;   x8_G5 <= 1'b0;   x8_G7 <= 1'b0;
	q1_G1 <= 1'b0;  q1_G3 <= 1'b0;   q1_G5 <= 1'b0;   q1_G7 <= 1'b0;
	q2_G1 <= 1'b0;  q2_G3 <= 1'b0;   q2_G5 <= 1'b0;   q2_G7 <= 1'b0;
	q3_G1 <= 1'b0;  q3_G3 <= 1'b0;   q3_G5 <= 1'b0;   q3_G7 <= 1'b0;
	q4_G1 <= 1'b0;  q4_G3 <= 1'b0;   q4_G5 <= 1'b0;   q4_G7 <= 1'b0;

                                        
end
	

always @(posedge clk or posedge reset)
 begin
	if(prgm_b==1'b0 && cb_prgm_b_in==1'b1 && cb_prgm_b_out!=1'b1 && cb_prgm_b==1'b1)	
	begin
	if(reset)
		cb_prgm_b_out=1'b0;
		
	else begin
		count[6:0]=count[6:0]+1'b1; 
		if(count[6:0]==7'b1100000)  //96 => 1100000
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
			x5_G0 <= 1'b0;  x5_G2 <= 1'b0;   x5_G4 <= 1'b0;   x5_G6 <= 1'b0;
			x6_G0 <= 1'b0;  x6_G2 <= 1'b0;   x6_G4 <= 1'b0;   x6_G6 <= 1'b0;
			x7_G0 <= 1'b0;  x7_G2 <= 1'b0;   x7_G4 <= 1'b0;   x7_G6 <= 1'b0;
			x8_G0 <= 1'b0;  x8_G2 <= 1'b0;   x8_G4 <= 1'b0;   x8_G6 <= 1'b0;
			q1_G0 <= 1'b0;  q1_G2 <= 1'b0;   q1_G4 <= 1'b0;   q1_G6 <= 1'b0;
			q2_G0 <= 1'b0;  q2_G2 <= 1'b0;   q2_G4 <= 1'b0;   q2_G6 <= 1'b0;
			q3_G0 <= 1'b0;  q3_G2 <= 1'b0;   q3_G4 <= 1'b0;   q3_G6 <= 1'b0;
			q4_G0 <= 1'b0;  q4_G2 <= 1'b0;   q4_G4 <= 1'b0;   q4_G6 <= 1'b0;
			x1_G1 <= 1'b0;  x1_G3 <= 1'b0;   x1_G5 <= 1'b0;   x1_G7 <= 1'b0;
			x2_G1 <= 1'b0;  x2_G3 <= 1'b0;   x2_G5 <= 1'b0;   x2_G7 <= 1'b0;
			x3_G1 <= 1'b0;  x3_G3 <= 1'b0;   x3_G5 <= 1'b0;   x3_G7 <= 1'b0;
			x4_G1 <= 1'b0;  x4_G3 <= 1'b0;   x4_G5 <= 1'b0;   x4_G7 <= 1'b0;
			x5_G1 <= 1'b0;  x5_G3 <= 1'b0;   x5_G5 <= 1'b0;   x5_G7 <= 1'b0;
			x6_G1 <= 1'b0;  x6_G3 <= 1'b0;   x6_G5 <= 1'b0;   x6_G7 <= 1'b0;
			x7_G1 <= 1'b0;  x7_G3 <= 1'b0;   x7_G5 <= 1'b0;   x7_G7 <= 1'b0;
			x8_G1 <= 1'b0;  x8_G3 <= 1'b0;   x8_G5 <= 1'b0;   x8_G7 <= 1'b0;
			q1_G1 <= 1'b0;  q1_G3 <= 1'b0;   q1_G5 <= 1'b0;   q1_G7 <= 1'b0;
			q2_G1 <= 1'b0;  q2_G3 <= 1'b0;   q2_G5 <= 1'b0;   q2_G7 <= 1'b0;
			q3_G1 <= 1'b0;  q3_G3 <= 1'b0;   q3_G5 <= 1'b0;   q3_G7 <= 1'b0;
			q4_G1 <= 1'b0;  q4_G3 <= 1'b0;   q4_G5 <= 1'b0;   q4_G7 <= 1'b0;
                                         

		end
		else begin
			x1_G0 <= bit_in;     x1_G2 <= q4_G1;    x1_G4 <= q4_G3;   x1_G6 <= q4_G5;
			x2_G0 <= x1_G0;      x2_G2 <= x1_G2;    x2_G4 <= x1_G4;   x2_G6 <= x1_G6;
			x3_G0 <= x2_G0;      x3_G2 <= x2_G2;    x3_G4 <= x2_G4;   x3_G6 <= x2_G6;
			x4_G0 <= x3_G0;      x4_G2 <= x3_G2;    x4_G4 <= x3_G4;   x4_G6 <= x3_G6;
			x5_G0 <= x4_G0;      x5_G2 <= x4_G2;    x5_G4 <= x4_G4;   x5_G6 <= x4_G6;
			x6_G0 <= x5_G0;      x6_G2 <= x5_G2;    x6_G4 <= x5_G4;   x6_G6 <= x5_G6;
			x7_G0 <= x6_G0;      x7_G2 <= x6_G2;    x7_G4 <= x6_G4;   x7_G6 <= x6_G6;
			x8_G0 <= x7_G0;      x8_G2 <= x7_G2;    x8_G4 <= x7_G4;   x8_G6 <= x7_G6;
			q1_G0 <= x8_G0;      q1_G2 <= x8_G2;    q1_G4 <= x8_G4;   q1_G6 <= x8_G6;
			q2_G0 <= q1_G0;      q2_G2 <= q1_G2;    q2_G4 <= q1_G4;   q2_G6 <= q1_G6;
			q3_G0 <= q2_G0;      q3_G2 <= q2_G2;    q3_G4 <= q2_G4;   q3_G6 <= q2_G6;
			q4_G0 <= q3_G0;      q4_G2 <= q3_G2;    q4_G4 <= q3_G4;   q4_G6 <= q3_G6;
			x1_G1 <= q4_G0;      x1_G3 <= q4_G2;    x1_G5 <= q4_G4;   x1_G7 <= q4_G6;
			x2_G1 <= x1_G1;      x2_G3 <= x1_G3;    x2_G5 <= x1_G5;   x2_G7 <= x1_G7;
			x3_G1 <= x2_G1;      x3_G3 <= x2_G3;    x3_G5 <= x2_G5;   x3_G7 <= x2_G7;
			x4_G1 <= x3_G1;      x4_G3 <= x3_G3;    x4_G5 <= x3_G5;   x4_G7 <= x3_G7;
			x5_G1 <= x4_G1;      x5_G3 <= x4_G3;    x5_G5 <= x4_G5;   x5_G7 <= x4_G7;
			x6_G1 <= x5_G1;      x6_G3 <= x5_G3;    x6_G5 <= x5_G5;   x6_G7 <= x5_G7;
			x7_G1 <= x6_G1;      x7_G3 <= x6_G3;    x7_G5 <= x6_G5;   x7_G7 <= x6_G7;
			x8_G1 <= x7_G1;      x8_G3 <= x7_G3;    x8_G5 <= x7_G5;   x8_G7 <= x7_G7;
			q1_G1 <= x8_G1;      q1_G3 <= x8_G3;    q1_G5 <= x8_G5;   q1_G7 <= x8_G7;
			q2_G1 <= q1_G1;      q2_G3 <= q1_G3;    q2_G5 <= q1_G5;   q2_G7 <= q1_G7;
			q3_G1 <= q2_G1;      q3_G3 <= q2_G3;    q3_G5 <= q2_G5;   q3_G7 <= q2_G7;
			q4_G1 <= q3_G1;      q4_G3 <= q3_G3;    q4_G5 <= q3_G5;   q4_G7 <= q3_G7;
                                                         
		end

	end
end
 
 	
endmodule