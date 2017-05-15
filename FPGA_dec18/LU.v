module LU(x0,x1,x2,x3,lut_out,prgm_b,config_data_in,CLB_prgm_b,CLB_prgm_b_in,WE,data_in,clk,reset,GWE,CLB_prgm_b_out);
reg [15:0] lut;
reg q15,q14,q13,q12,q11,q10,q9,q8,q7,q6,q5,q4,q3,q2,q1,q0;
 reg [3:0] in2;
 input x0,x1,x2,x3,CLB_prgm_b,WE,data_in,clk,reset,GWE,config_data_in,CLB_prgm_b_in,CLB_prgm_b_out,prgm_b;
//input shift_in;
MUX2X1 Din_config_din(.in1(config_data_in),.in2(data_in),.sel(prgm_b & WE),.out(LUT_in));

output reg lut_out;
//output reg shift_data_out;

always@(*)begin
if(prgm_b==1'b1) begin
	in2[3:0]={x3,x2,x1,x0};
end
	
end

initial begin

                q15 <= 0;
                q14 <= 0;
                q13 <= 0;
                q12 <= 0;
                q11 <= 0;
                q10 <= 0;
                q9 <= 0;
                q8 <= 0;
                q7 <= 0;
                q6 <= 0;
                q5 <= 0;
                q4 <= 0;
                q3 <= 0;
                q2 <= 0;
                q1 <= 0;
                q0 <= 0;                                     

end


always @ (posedge clk or posedge reset)

begin

  if (prgm_b==1'b0 &&  CLB_prgm_b_in==1'b1 && CLB_prgm_b_out!=1'b1) begin
//	if(1==1) begin
   if(reset) begin     
			
           
                q15 <= 0;           
                q14 <= 0;           
                q13 <= 0;           
                q12 <= 0;           
                q11 <= 0;           
                q10 <= 0;           
                q9 <= 0;           
                q8 <= 0;           
                q7 <= 0;           
                q6 <= 0;           
                q5 <= 0;           
                q4 <= 0;           
                q3 <= 0;           
                q2 <= 0;           
                q1 <= 0;           
                q0 <= 0;     
    end

    else begin         
		   
           
             q15 <= LUT_in;           
             q14 <= q15;           
             q13 <= q14;           
             q12 <= q13;           
             q11 <= q12;           
             q10 <= q11;           
             q9 <= q10;           
             q8 <= q9;           
             q7 <= q8;           
             q6 <= q7;           
             q5 <= q6;           
             q4 <= q5;           
             q3 <= q4;           
             q2 <= q3;           
             q1 <= q2;           
             q0 <= q1;
	    // shift_data_out <= q0;       

    end

  end

end

always@(posedge CLB_prgm_b_out)  //extra shifting to move the last bit in the LUT_in to q15

begin

	if(prgm_b==1'b0 &&  CLB_prgm_b_in==1'b1)
	begin
 		q15 <= LUT_in;           
             q14 <= q15;           
             q13 <= q14;           
             q12 <= q13;           
             q11 <= q12;           
             q10 <= q11;           
             q9 <= q10;           
             q8 <= q9;           
             q7 <= q8;           
             q6 <= q7;           
             q5 <= q6;           
             q4 <= q5;           
             q3 <= q4;           
             q2 <= q3;           
             q1 <= q2;           
             q0 <= q1;
	//     shift_data_out <= q0; 
	end    


end

always@(*)

begin

if(prgm_b==1'b1 && CLB_prgm_b==1'b0)

  lut[15:0]={q15,q14,q13,q12,q11,q10,q9,q8,q7,q6,q5,q4,q3,q2,q1,q0};

end

initial
begin
if(prgm_b==1'b1)
	lut_out=1'b0;
	else begin
		lut_out=1'bx;
	end
end	

always@(*)
begin
	if(prgm_b==1'b1 && CLB_prgm_b==1'b0 && WE==1'b0)
	begin

		case (in2)
		4'b0000:  lut_out = lut[0];
		4'b0001:  lut_out = lut[1];
		4'b0010:  lut_out = lut[2];
		4'b0011:  lut_out = lut[3];
		4'b0100:  lut_out = lut[4];
		4'b0101:  lut_out = lut[5];
		4'b0110:  lut_out = lut[6];
		4'b0111:  lut_out = lut[7];
		4'b1000:  lut_out = lut[8];
		4'b1001:  lut_out = lut[9];
		4'b1010:  lut_out = lut[10];
		4'b1011:  lut_out = lut[11];
		4'b1100:  lut_out = lut[12];
		4'b1101:  lut_out = lut[13];
		4'b1110:  lut_out = lut[14];
		4'b1111:  lut_out = lut[15];
		endcase
	end //if ends
	else 
	begin
		lut_out=1'bx;
	end //end of if-block
	end  //always block ends  


/*
always@(posedge clk)

begin
	if(prgm_b==1'b1 && CLB_prgm_b==1'b0 && WE==1'b1 && GWE==1'b1 )  //for shifting

	begin

		q0<=data_in;       
		q1<=q0;      
		q2<=q1;      
		q3<=q2;      
		q4<=q3;      
		q5<=q4;      
		q6<=q5;      
		q7<=q6;      
		q8<=q7;      
		q9<=q8;
		q10<=q9;        
		q11<=q10;        
		q12<=q11;        
		q13<=q12;        
		q14<=q13;        
		q15<=q14;
       	//	shift_data_out<=q15;

	end //if ends
	
end  //always block ends

*/

always@(posedge clk)

begin
	if(prgm_b==1'b1 && CLB_prgm_b==1'b0 && WE==1'b1 && GWE==1'b1 )

	begin

		case (in2)

		4'b0000:  q0<=data_in;       
		4'b0001:  q1<=data_in;       
		4'b0010:  q2<=data_in;       
		4'b0011:  q3<=data_in;       
		4'b0100:  q4<=data_in;       
		4'b0101:  q5<=data_in;       
		4'b0110:  q6<=data_in;       
		4'b0111:  q7<=data_in;       
		4'b1000:  q8<=data_in;       
		4'b1001:  q9<=data_in;
		4'b1010:  q10<=data_in;        
		4'b1011:  q11<=data_in;        
		4'b1100:  q12<=data_in;        
		4'b1101:  q13<=data_in;        
		4'b1110:  q14<=data_in;        
		4'b1111:  q15<=data_in;

		endcase
		lut_out=data_in;
	end //if ends
end  //always block ends

always@(*)

begin

if(prgm_b==1'b1 && CLB_prgm_b==1'b0)

lut[15:0]= {q15,q14,q13,q12,q11,q10,q9,q8,q7,q6,q5,q4,q3,q2,q1,q0};
  

end


endmodule
