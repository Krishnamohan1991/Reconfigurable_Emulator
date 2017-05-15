module LUT_SLICEM(I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,
	IQ1,IQ2,IQ3,IQ4,IQ5,IQ6,IQ7,IQ8,
	lut_out,prgm_b,CLB_prgm_b,CLB_prgm_b_in,CLB_prgm_b_out,WE,data_in,config_data_in,shift_in,CLK,reset,GWE);

//input wire [15:0] in1;                              //WE- write enable signal   //WCLK-write clock GWE - Global write enable
// reg [3:0] in2;

input I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,IQ1,IQ2,IQ3,IQ4,IQ5,IQ6,IQ7,IQ8;


 input prgm_b,CLB_prgm_b,WE,data_in,config_data_in,shift_in,CLK,reset,GWE,CLB_prgm_b_in;
 output reg lut_out,CLB_prgm_b_out,mux_switch;

wire x1,x2,x3,x4;
wire LUT_in;  //input data for the LUT registers

wire D0_out,D1_out,D2_out,D3_out,D4_out,D5_out,D6_out,D7_out,D8_out,D9_out,D10_out,D11_out,D12_out,D13_out,D14_out,D15_out;

reg config_data_reg;

//value MUX_DATA_Input (.in(config_data_reg),.out(config_data_in));

MUX2X1 Din_config_din(.in1(config_data_in),.in2(data_in),.sel(prgm_b & GWE),.out(LUT_in));  //mux controls the data going into the LUT D-flip flops

syn_D_FF D0(.data_in(config_data_reg),.data_out(D0_out),.clk(CLK),.reset(reset));
syn_D_FF D1(.data_in(D0_out),.data_out(D1_out),.clk(CLK),.reset(reset));
syn_D_FF D2(.data_in(D1_out),.data_out(D2_out),.clk(CLK),.reset(reset));
syn_D_FF D3(.data_in(D2_out),.data_out(D3_out),.clk(CLK),.reset(reset));
syn_D_FF D4(.data_in(D3_out),.data_out(D4_out),.clk(CLK),.reset(reset));
syn_D_FF D5(.data_in(D4_out),.data_out(D5_out),.clk(CLK),.reset(reset));
syn_D_FF D6(.data_in(D5_out),.data_out(D6_out),.clk(CLK),.reset(reset));
syn_D_FF D7(.data_in(D6_out),.data_out(D7_out),.clk(CLK),.reset(reset));

syn_D_FF D8(.data_in(D7_out),.data_out(D8_out),.clk(CLK),.reset(reset));
syn_D_FF D9(.data_in(D8_out),.data_out(D9_out),.clk(CLK),.reset(reset));
syn_D_FF D10(.data_in(D9_out),.data_out(D10_out),.clk(CLK),.reset(reset));
syn_D_FF D11(.data_in(D10_out),.data_out(D11_out),.clk(CLK),.reset(reset));
syn_D_FF D12(.data_in(D11_out),.data_out(D12_out),.clk(CLK),.reset(reset));
syn_D_FF D13(.data_in(D12_out),.data_out(D13_out),.clk(CLK),.reset(reset));
syn_D_FF D14(.data_in(D13_out),.data_out(D14_out),.clk(CLK),.reset(reset));
syn_D_FF D15(.data_in(D14_out),.data_out(D15_out),.clk(CLK),.reset(reset));




reg q15,q14,q13,q12,q11,q10,q9,q8,q7,q6,q5,q4,q3,q2,q1,q0,
i_q19,i_q18,i_q17,i_q16,i_q15,i_q14,i_q13,i_q12,i_q11,i_q10,i_q9,i_q8,i_q7,i_q6,i_q5,i_q4,i_q3,i_q2,i_q1,i_q0,crry_sel_switch,switch;



reg [4:0] interconnect_config_x1;
reg [4:0] interconnect_config_x2;
reg [4:0] interconnect_config_x3;
reg [4:0] interconnect_config_x4;

wire [4:0] interconnect_config_X1;
wire [4:0] interconnect_config_X2;
wire [4:0] interconnect_config_X3;
wire [4:0] interconnect_config_X4;


LUT_input_interconnect LX1(.in(interconnect_config_x1),.out(interconnect_config_X1));

LUT_input_interconnect LX2(.in(interconnect_config_x2),.out(interconnect_config_X2));

LUT_input_interconnect LX3(.in(interconnect_config_x3),.out(interconnect_config_X3));

LUT_input_interconnect LX4(.in(interconnect_config_x4),.out(interconnect_config_X4));

output reg carryOut_sel_mux;

reg [5:0] count;

reg [3:0] in2;


initial begin
  count[5:0]=6'b000000;
  CLB_prgm_b_out=1'b0;
           i_q19 <= 0;      switch <= 0;
           i_q18 <= 0;      crry_sel_switch<=0;
           i_q17 <= 0;     
           i_q16 <= 0;     
           i_q15 <= 0;     
           i_q14 <= 0;      
           i_q13 <= 0;     
           i_q12 <= 0;     
           i_q11 <= 0;      
           i_q10 <= 0;      
           i_q9 <= 0;       
           i_q8 <= 0;       
           i_q7 <= 0;       
           i_q6 <= 0;       
           i_q5 <= 0;       
           i_q4 <= 0;       
           i_q3 <= 0;       
           i_q2 <= 0;	    
           i_q1 <= 0;
           i_q0 <= 0;

                                        
end






always @(posedge CLK or posedge reset)
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
      if(count[5:0]==6'b100110)  //38 => 100110
      begin
      CLB_prgm_b_out= #CLK 1'b1;
      count[5:0]=6'b000000;
      //prgm_b_out=1'b0;
      end  //ends
    
     end //else ends

  
  end  //first if ends

end //always block endss

always @ (posedge CLK or posedge reset)
begin
  if (prgm_b==1'b0 && CLB_prgm_b_in==1'b1 && CLB_prgm_b_out!=1'b1 && CLB_prgm_b==1'b1) begin
    if(reset) begin
          i_q19 <= 0;      switch <= 0;
           i_q18 <= 0;      
           i_q17 <= 0;      
           i_q16 <= 0;      
           i_q15 <= 0;      
           i_q14 <= 0;      
           i_q13 <= 0;      
           i_q12 <= 0;      
           i_q11 <= 0;      
           i_q10 <= 0;      
           i_q9 <= 0;       
           i_q8 <= 0;       
           i_q7 <= 0;       
           i_q6 <= 0;       
           i_q5 <= 0;       
           i_q4 <= 0;       
           i_q3 <= 0;       
           i_q2 <= 0;
           i_q1 <= 0;
           i_q0 <= 0;
    end
    else begin
           i_q19 <= LUT_in;     switch <= i_q0;
           i_q18 <= i_q19;      crry_sel_switch<= switch;
                                config_data_reg<= crry_sel_switch;
           i_q17 <= i_q18;      
           i_q16 <= i_q17;      
           i_q15 <= i_q16;      
           i_q14 <= i_q15;      
           i_q13 <= i_q14;      
           i_q12 <= i_q13;      
           i_q11 <= i_q12;      
           i_q10 <= i_q11;      
           i_q9 <= i_q10;       
           i_q8 <= i_q9;        
           i_q7 <= i_q8;        
           i_q6 <= i_q7;        
           i_q5 <= i_q6;        
           i_q4 <= i_q5;        
           i_q3 <= i_q4;        
           i_q2 <= i_q3;	
           i_q1 <= i_q2;
           i_q0 <= i_q1;
       
    end
  end
end

always@(*)

begin
if(prgm_b==1'b1 && CLB_prgm_b==1'b0)
  //lut[15:0]={q15,q14,q13,q12,q11,q10,q9,q8,q7,q6,q5,q4,q3,q2,q1,q0};
  
  interconnect_config_x1[4:0]={i_q4,i_q3,i_q2,i_q1,i_q0};
  interconnect_config_x2[4:0]={i_q9,i_q8,i_q7,i_q6,i_q5};
  interconnect_config_x3[4:0]={i_q14,i_q13,i_q12,i_q11,i_q10};
  interconnect_config_x4[4:0]={i_q19,i_q18,i_q17,i_q16,i_q15};
  mux_switch=switch;
  carryOut_sel_mux=crry_sel_switch;
end



interconnect_unit X1(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_config_x1),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),
	.lut_inp(x1));

interconnect_unit X2(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_config_x2),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),
.lut_inp(x2));

interconnect_unit X3(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_config_x3),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),
.lut_inp(x3));

interconnect_unit X4(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I0(I0)
	,.interconnect_switch(interconnect_config_x4),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),
.lut_inp(x4));



always@(*)begin
if(prgm_b==1'b1) begin
	in2[3:0]={x4,x3,x2,x1};
	//in2[3:0]={1'b0,1'b0,1'b0,1'b0};
end
	
end


initial
begin
if(prgm_b==1'b1)
	lut_out=1'b0;
	else begin
		lut_out=1'bx;
	end
end	

always@(in2)
	begin
if(prgm_b==1'b1 && CLB_prgm_b==1'b0 && WE==1'b0  && GWE==1'b0)
begin

case (in2)
4'b0000:  lut_out = D0_out;
4'b0001:  lut_out = D1_out;
4'b0010:  lut_out = D2_out;
4'b0011:  lut_out = D3_out;
4'b0100:  lut_out = D4_out;
4'b0101:  lut_out = D5_out;
4'b0110:  lut_out = D6_out;
4'b0111:  lut_out = D7_out;
4'b1000:  lut_out = D8_out;
4'b1001:  lut_out = D9_out;
4'b1010:  lut_out = D10_out;
4'b1011:  lut_out = D11_out;
4'b1100:  lut_out = D12_out;
4'b1101:  lut_out = D13_out;
4'b1110:  lut_out = D14_out;
4'b1111:  lut_out = D15_out;
endcase
end //if ends
else 
begin
	lut_out=1'bx;
end //end of if-block

if(prgm_b==1'b1 && CLB_prgm_b==1'b0 && WE==1'b1 && GWE==1'b1)
begin

case (in2)

4'b0000:  config_data_reg = lut_inp;
4'b0001:  D1_out=lut_inp;
4'b0010:  D2_out=lut_inp;
4'b0011:  D3_out=lut_inp;
4'b0100:  D4_out=lut_inp;
4'b0101:  D5_out=lut_inp;
4'b0110:  D6_out=lut_inp;
4'b0111:  D7_out=lut_inp;
4'b1000:  D8_out=lut_inp;
4'b1001:  D9_out=lut_inp;
4'b1010:  D10_out=lut_inp;
4'b1011:  D11_out=lut_inp;
4'b1100:  D12_out=lut_inp;
4'b1101:  D13_out=lut_inp;
4'b1110:  D14_out=lut_inp;
4'b1111:  D15_out=lut_inp;

endcase

lut_out=lut_inp;
end //if ends


end  //always block ends
endmodule
