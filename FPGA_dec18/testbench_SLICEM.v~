module testbench_SLICEM();
//reg clk,reset,prgm_b,cb_prgm_b;

integer input_file;


reg [37:0] CLB_config_stream;



reg [37:0] CLB_config_stream_final;


wire G0,G1,G2,G3,G4,G5,G6,G7;
integer i,k,l,m;


wire V00_0,V00_1,V00_2,V00_3,V00_4,V00_5,V00_6,V00_7, V00_8,V00_9,V00_10,V00_11,V00_12,V00_13,V00_14,V00_15;
	    
 
 reg V000,V001,V002,V003,V004,V005,V006,V007,V008,V009,V010,V011,V012,V013,V014,V015;
 
value v0(.in(V000),.out(V00_0));         value v24(.in(V010),.out(V00_10));
value v1(.in(V001),.out(V00_1));         value v25(.in(V011),.out(V00_11));
value v2(.in(V002),.out(V00_2));         value v26(.in(V012),.out(V00_12));
value v3(.in(V003),.out(V00_3));         value v27(.in(V013),.out(V00_13));
value v4(.in(V004),.out(V00_4));         value v28(.in(V014),.out(V00_14));
value v5(.in(V005),.out(V00_5));         value v29(.in(V015),.out(V00_15));     
value v6(.in(V006),.out(V00_6));         
value v7(.in(V007),.out(V00_7));         
value v8(.in(V08),.out(V00_8));          
value v9(.in(V09),.out(V00_9));          

wire IQ1,IQ2,IQ3,IQ4,IQ5,IQ6,IQ7,IQ8;

reg clk,reset,prgm_b,CLB_prgm_b,bit_in_CLB,CLB_prgm_b_in,lut_inp,shift_in,GWE,WE;

wire CLB_prgm_b_out,lut_out;

integer CB_count,SB_count,SB_count_2,CLB_count,CLB_counter,CB_counter,SB_counter,SB_counter_2,IO_counter,IO_count;


LUT_SLICEM LS(.I0(V00_0),.I1(V00_1),.I2(V00_2),.I3(V00_3),.I4(V00_4),.I5(V00_5),.I6(V00_6),.I7(V00_7),.I8(V00_8),.I9(V00_9),.I10(V00_10),.I11(V00_11),.I12(V00_12)
	,.I13(V00_13),.I14(V00_14),.I15(V00_15),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ7),
	.lut_out(lut_out),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.CLB_prgm_b_in(CLB_prgm_b_in),.CLB_prgm_b_out(CLB_prgm_b_out),
	.WE(WE),.data_in(data_in),.config_data_in(bit_in_CLB),.shift_in(shift_in),.CLK(clk),.reset(reset),.GWE(GWE)); 

//For all bit-streams the bits are arranged in the decreasing order of their coordinate positions. eg. The bits belonging to the first CLB CLB_00 will be placed at the end of the CLB bitstream

initial begin

clk = 1'b0;
 reset=1'b0;
 
 prgm_b=1'b1;   //indicates start of bit_stream----active low
 GWE=1'b0;
 CLB_prgm_b=1'b0; 
 WE=1'b0;
 shift_in=1'b0;

 fork

 #1 reset=1'b1;
 #1 prgm_b=1'b0;
 #1 CLB_prgm_b=1'b1;
 #1 CLB_prgm_b_in=1'b1;
 #1 WE=1'b0;
 #1 GWE=1'b1;
 #1 CLB_counter=0;CLB_count=0;
 #1 shift_in=1'b0;
 #1 reset=1'b1;
 #2 reset=1'b0;

 join
end

initial begin


forever #5 clk=!clk;

end

initial
begin

CLB_config_stream[37:0]= 38'b00000000000000000000111111111111111111;


for(k=0;k<38;k=k+1)
CLB_config_stream_final[k]=CLB_config_stream[k];



end



always@(posedge clk or posedge reset)
begin 

if(prgm_b!=1'b1 && CLB_prgm_b!=1'b0) 
begin

    if((CLB_counter == 38) && CLB_prgm_b!=1'b0) //(no of bits required for one CLB) + 1= 38+1=39  or (38 + (number of LUT -1))
	begin
	    
		CLB_count=CLB_count+1;
		
		CLB_counter=0;
		if(CLB_count==1)
		begin
			
			CLB_prgm_b=1'b0;
			prgm_b=1'b1;
          
			
		end
	end 
	bit_in_CLB <= CLB_config_stream_final[0];
	CLB_config_stream_final <=CLB_config_stream_final>>1;
	CLB_counter=CLB_counter+1;//if endsj
end 

end //always block ends


initial
	begin 
#600;               //time=5 seconds
V000=1;V001=1;V002=1;V003=1;V004=1;V005=1;V006=1;V007=1;
V008=1;V009=1;V010=1;V011=1;V012=1;V013=1;V014=1;V015=1;
//V10=1;V11=1;
#800;
	//reset=1'b0;
V000=1;V001=1;V002=1;V003=1;V004=1;V005=1;V006=1;V007=1;
V008=1;V009=1;V010=1;V011=1;V012=1;V013=1;V014=1;V015=1;
#800;
	//reset=1'b0;
V000=1;V001=1;V002=1;V003=1;V004=1;V005=1;V006=1;V007=1;
V008=1;V009=1;V010=1;V011=1;V012=1;V013=1;V014=1;V015=1;
//V10=1;V11=1;
#86400 $finish;
end
initial begin
    $dumpfile("test.vcd");

    $dumpvars(0,testbench_SLICEM);
    $timeformat(-9, 1, " ns", 6);
	$monitor("At prgm_b=%b reset=%b CLB_count=%d",prgm_b,reset,CLB_count);
end

//Stimulus

endmodule
