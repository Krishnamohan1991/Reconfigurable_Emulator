module look_up_table_interconnect_config(bit_in,prgm_b,clk,reset,lut,CLB_prgm_b,CLB_prgm_b_in,CLB_prgm_b_out,
  interconnect_config_x1,interconnect_config_x2,interconnect_config_x3,interconnect_config_x4,mux_switch);
input bit_in,prgm_b,clk,reset,CLB_prgm_b,CLB_prgm_b_in;
reg q15,q14,q13,q12,q11,q10,q9,q8,q7,q6,q5,q4,q3,q2,q1,q0,
i_q19,i_q18,i_q17,i_q16,i_q15,i_q14,i_q13,i_q12,i_q11,i_q10,i_q9,i_q8,i_q7,i_q6,i_q5,i_q4,i_q3,i_q2,i_q1,i_q0,switch;
output reg mux_switch,CLB_prgm_b_out;
output reg [15:0] lut;
output reg [4:0] interconnect_config_x1;
output reg [4:0] interconnect_config_x2;
output reg [4:0] interconnect_config_x3;
output reg [4:0] interconnect_config_x4;

reg [5:0] count;

initial begin
  count[5:0]=6'b000000;
  CLB_prgm_b_out=1'b0;
           i_q19 <= 0;      switch <= 0;
           i_q18 <= 0;      q15 <= 0;
           i_q17 <= 0;      q14 <= 0;
           i_q16 <= 0;      q13 <= 0;
           i_q15 <= 0;      q12 <= 0;
           i_q14 <= 0;      q11 <= 0;
           i_q13 <= 0;      q10 <= 0;
           i_q12 <= 0;      q9 <= 0;
           i_q11 <= 0;      q8 <= 0;
           i_q10 <= 0;      q7 <= 0;
           i_q9 <= 0;       q6 <= 0;
           i_q8 <= 0;       q5 <= 0;
           i_q7 <= 0;       q4 <= 0;
           i_q6 <= 0;       q3 <= 0;
           i_q5 <= 0;       q2 <= 0;
           i_q4 <= 0;       q1 <= 0;
           i_q3 <= 0;       q0 <= 0;
           i_q2 <= 0;
           i_q1 <= 0;
           i_q0 <= 0;

                                        
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
      if(count[5:0]==6'b100101)  //37 => 100101
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
           i_q19 <= 0;      switch <= 0;
           i_q18 <= 0;      q15 <= 0;
           i_q17 <= 0;      q14 <= 0;
           i_q16 <= 0;      q13 <= 0;
           i_q15 <= 0;      q12 <= 0;
           i_q14 <= 0;      q11 <= 0;
           i_q13 <= 0;      q10 <= 0;
           i_q12 <= 0;      q9 <= 0;
           i_q11 <= 0;      q8 <= 0;
           i_q10 <= 0;      q7 <= 0;
           i_q9 <= 0;       q6 <= 0;
           i_q8 <= 0;       q5 <= 0;
           i_q7 <= 0;       q4 <= 0;
           i_q6 <= 0;       q3 <= 0;
           i_q5 <= 0;       q2 <= 0;
           i_q4 <= 0;       q1 <= 0;
           i_q3 <= 0;       q0 <= 0;
           i_q2 <= 0;
           i_q1 <= 0;
           i_q0 <= 0;

    end
    else begin
           i_q19 <= bit_in;     switch <= i_q0;
           i_q18 <= i_q19;      q15 <= switch;
           i_q17 <= i_q18;      q14 <= q15;
           i_q16 <= i_q17;      q13 <= q14;
           i_q15 <= i_q16;      q12 <= q13;
           i_q14 <= i_q15;      q11 <= q12;
           i_q13 <= i_q14;      q10 <= q11;
           i_q12 <= i_q13;      q9 <= q10;
           i_q11 <= i_q12;      q8 <= q9;
           i_q10 <= i_q11;      q7 <= q8;
           i_q9 <= i_q10;       q6 <= q7;
           i_q8 <= i_q9;        q5 <= q6;
           i_q7 <= i_q8;        q4 <= q5;
           i_q6 <= i_q7;        q3 <= q4;
           i_q5 <= i_q6;        q2 <= q3;
           i_q4 <= i_q5;        q1 <= q2;
           i_q3 <= i_q4;        q0 <= q1;
           i_q2 <= i_q3;      //bit_out <= q0;
           i_q1 <= i_q2;
           i_q0 <= i_q1;
       
    end
  end
end

always@(*)

begin
if(prgm_b==1'b1 && CLB_prgm_b==1'b0)
  lut[15:0]={q15,q14,q13,q12,q11,q10,q9,q8,q7,q6,q5,q4,q3,q2,q1,q0};
  
  interconnect_config_x1[4:0]={i_q4,i_q3,i_q2,i_q1,i_q0};
  interconnect_config_x2[4:0]={i_q9,i_q8,i_q7,i_q6,i_q5};
  interconnect_config_x3[4:0]={i_q14,i_q13,i_q12,i_q11,i_q10};
  interconnect_config_x4[4:0]={i_q19,i_q18,i_q17,i_q16,i_q15};
  mux_switch=switch;
end
endmodule