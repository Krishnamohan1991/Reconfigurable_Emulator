module look_up_table_interconnect_config(bit_in,prgm_b,clk,reset,CLB_prgm_b,CLB_prgm_b_in,CLB_prgm_b_out,
  interconnect_config_x0,interconnect_config_x1,interconnect_config_x2,interconnect_config_x3,config_data_reg,Bypass_inp_conf,data_line_conf,
CYO_SEL_MUX,SUM_LUT_SEL_MUX,DFF_INP_SEL_MUX,CY_GEN_MUX);

input bit_in,prgm_b,clk,reset,CLB_prgm_b,CLB_prgm_b_in;
output reg CLB_prgm_b_out;

output reg [5:0] interconnect_config_x0;
output reg [5:0] interconnect_config_x1;
output reg [5:0] interconnect_config_x2;
output reg [5:0] interconnect_config_x3;
output reg [5:0] Bypass_inp_conf;
output reg [5:0] data_line_conf;
output reg config_data_reg;

output reg CYO_SEL_MUX,SUM_LUT_SEL_MUX,DFF_INP_SEL_MUX;
output reg [2:0] CY_GEN_MUX;


reg q23,q22,q21,q20,q19,q18,q17,q16,q15,q14,q13,q12,q11,q10,q9,q8,q7,q6,q5,q4,q3,q2,q1,q0,data_5,data_4,data_3,data_2,data_1,data_0,by5,by4,by3,by2,by1,by0;
reg [5:0] count;
reg CYO_MUX_SEL,SUM_LUT_MUX_SEL,DFF_INP_MUX_SEL;
reg [2:0] CYO_inp0_MUX_SEL;


initial begin

 count[5:0]=6'b000000;
  CLB_prgm_b_out=1'b0;  data_0 <=0;
  q23 <=0;              data_1 <=0;
  q22 <=0;              data_2 <=0;
  q21 <=0;              data_3 <=0;
  q20 <=0;              data_4 <=0;
  q19 <= 0;             data_5 <=0;
  q18 <= 0;             by0 <=0;
  q17 <= 0; 	        by1 <=0;
  q16 <= 0;             by2 <=0;
  q15 <= 0;             by3 <=0;
  q14 <= 0;             by4 <=0;
  q13 <= 0;             by5 <=0; 
  q12 <= 0;             CYO_inp0_MUX_SEL<=3'b000;
  q11 <= 0;             CYO_MUX_SEL<=0; 
  q10 <= 0;             SUM_LUT_MUX_SEL<=0;
  q9 <= 0;              DFF_INP_MUX_SEL<=0;
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




initial begin

 count[5:0]=6'b000000;
  CLB_prgm_b_out=1'b0;  data_0 <=0;
  q23 <=0;              data_1 <=0;
  q22 <=0;              data_2 <=0;
  q21 <=0;              data_3 <=0;
  q20 <=0;              data_4 <=0;
  q19 <= 0;             data_5 <=0;
  q18 <= 0;             by0 <=0;
  q17 <= 0; 	        by1 <=0;
  q16 <= 0;             by2 <=0;
  q15 <= 0;             by3 <=0;
  q14 <= 0;             by4 <=0;
  q13 <= 0;             by5 <=0; 
  q12 <= 0;             CYO_inp0_MUX_SEL<=3'b000;
  q11 <= 0;             CYO_MUX_SEL<=0; 
  q10 <= 0;             SUM_LUT_MUX_SEL<=0;
  q9 <= 0;              DFF_INP_MUX_SEL<=0;
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


always @(posedge clk or posedge reset)

 begin

  if(prgm_b==1'b0 && CLB_prgm_b_in==1'b1 && CLB_prgm_b_out!=1'b1 && CLB_prgm_b==1'b1)  

    begin

    if(reset)

     begin

    CLB_prgm_b_out=1'b0;

    count[5:0]=6'b000000;

      end

    

    else begin

     count[5:0]=count[5:0]+1'b1; 

      if(count[5:0]==6'b111010) //58

      begin
      CLB_prgm_b_out= #clk 1'b1;
	
      count[5:0]=6'b000000;
      //prgm_b_out=1'b0;

      end  //ends
 

     end //else ends
 

  end  //first if ends
end //always block endss


always @ (posedge clk or posedge reset)

begin

  if (prgm_b==1'b0 && CLB_prgm_b_in==1'b1 && CLB_prgm_b_out!=1'b1 && CLB_prgm_b==1'b1) begin

    if(reset) begin
         		              data_0 <=0;
 	  q23 <=0;              data_1 <=0;
  	q22 <=0;              data_2 <=0;
  	q21 <=0;              data_3 <=0;
  	q20 <=0;              data_4 <=0;
  	q19 <= 0;             data_5 <=0;
  	q18 <= 0;             by0 <=0;
  	q17 <= 0; 	      	  by1 <=0;
  	q16 <= 0;             by2 <=0;
  	q15 <= 0;             by3 <=0;
  	q14 <= 0;             by4 <=0;
  	q13 <= 0;             by5 <=0; 
  	q12 <= 0;             CYO_inp0_MUX_SEL<=3'b000;
  	q11 <= 0;             CYO_MUX_SEL<=0; 
  	q10 <= 0;             SUM_LUT_MUX_SEL<=0;
  	q9 <= 0;              DFF_INP_MUX_SEL<=0;
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

	    q23 <=bit_in;	       data_5 <=q0;
	    q22 <=q23;             data_4 <=data_5;
	    q21 <=q22;             data_3 <=data_4;
	    q20 <=q21;             data_2 <=data_3;
	    q19 <= q20;            data_1 <=data_2;
        q18 <= q19;            data_0 <=data_1;
        q17 <= q18; 	       by5 <=data_0;
        q16 <= q17;            by4 <=by5;
        q15 <= q16;            by3 <=by4;
        q14 <= q15;            by2 <=by3;
        q13 <= q14;            by1 <=by2;
        q12 <= q13;            by0 <=by1;
        q11 <= q12;           CYO_inp0_MUX_SEL[2] <= by0;				   
        q10 <= q11;           CYO_inp0_MUX_SEL[1] <=CYO_inp0_MUX_SEL[2];
        q9 <= q10;            CYO_inp0_MUX_SEL[0] <=CYO_inp0_MUX_SEL[1];
        q8 <= q9;             CYO_MUX_SEL<=CYO_inp0_MUX_SEL[0];
        q7 <= q8;             SUM_LUT_MUX_SEL<=CYO_MUX_SEL;
        q6 <= q7;             DFF_INP_MUX_SEL<=SUM_LUT_MUX_SEL;
        q5 <= q6;             config_data_reg <=DFF_INP_MUX_SEL;
        q4 <= q5;      
        q3 <= q4;      
        q2 <= q3;	  
        q1 <= q2;   
        q0 <= q1;
     
    end

  end

end


always@(*)

begin

if(prgm_b==1'b1 && CLB_prgm_b==1'b0)

  
  interconnect_config_x0[5:0]={q5,q4,q3,q2,q1,q0};
  interconnect_config_x1[5:0]={q11,q10,q9,q8,q7,q6};
  interconnect_config_x2[5:0]={q17,q16,q15,q14,q13,q12};
  interconnect_config_x3[5:0]={q23,q22,q21,q20,q19,q18};
  Bypass_inp_conf[5:0]={by5,by4,by3,by2,by1,by0};
  data_line_conf[5:0]={data_5,data_4,data_3,data_2,data_1,data_0};
 // Shft_inOrBy=Shft_inOrBy_SEL;
  CY_GEN_MUX=CYO_inp0_MUX_SEL;     		        
  CYO_SEL_MUX=CYO_MUX_SEL;                 	        
 // crryout_shftout_mux=crryout_shftout_mux_SEL;			        
 SUM_LUT_SEL_MUX=SUM_LUT_MUX_SEL;
  DFF_INP_SEL_MUX=DFF_INP_MUX_SEL;

end
endmodule
