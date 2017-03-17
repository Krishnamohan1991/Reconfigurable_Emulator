module FPGA_testbench();
//reg clk,reset,prgm_b,cb_prgm_b;

integer input_file;

reg [767:0] CB_config_stream ;
reg [1183:0] CLB_config_stream;
reg [191:0] IO_config_stream;
reg [6912:0] SB_config_stream;


reg [767:0] CB_config_stream_final ;
reg [1183:0] CLB_config_stream_final;
reg [191:0] IO_config_stream_final;
reg [6912:0] SB_config_stream_final;
//reg [3071:0] SB_config_stream;


//reg [1535:0] SB_config_stream;
//reg [1535:0] SB_config_stream_2;

//reg [3071:0] SB_config_stream_3;
wire cb_prgm_b_out,cb_prgm_b_out_1;
wire G0,G1,G2,G3,G4,G5,G6,G7;
integer i;


inout V00_0,V00_1,V00_2,V00_3,V00_4,V00_5,V00_6,V00_7,V01_0,V01_1,V01_2,V01_3,V01_4,V01_5,V01_6,V01_7,
	    V02_0,V02_1,V02_2,V02_3,V02_4,V02_5,V02_6,V02_7,V10_0,V10_1,V10_2,V10_3,V10_4,V10_5,V10_6,V10_7,
	    V11_0,V11_1,V11_2,V11_3,V11_4,V11_5,V11_6,V11_7,V12_0,V12_1,V12_2,V12_3,V12_4,V12_5,V12_6,V12_7,
            H00_0,H00_1,H00_2,H00_3,H00_4,H00_5,H00_6,H00_7,H01_0,H01_1,H01_2,H01_3,H01_4,H01_5,H01_6,H01_7,
	    H10_0,H10_1,H10_2,H10_3,H10_4,H10_5,H10_6,H10_7,H11_0,H11_1,H11_2,H11_3,H11_4,H11_5,H11_6,H11_7,
	    H20_0,H20_1,H20_2,H20_3,H20_4,H20_5,H20_6,H20_7,H21_0,H21_1,H21_2,H21_3,H21_4,H21_5,H21_6,H21_7;

 reg H00,H01,H02,H03,H04,H05,H06,H07;
 reg V00,V01,V02,V03,V04;
 reg V10,V11;
 value v1(.in(V00),.out(V00_0));  
 value v2(.in(V01),.out(V00_1));  
 value v3(.in(V02),.out(V00_2));  
 value v4(.in(V03),.out(V00_3)); 

 value v5(.in(H00),.out(H00_0));  
 value v6(.in(H01),.out(H00_1));  
 value v7(.in(H02),.out(H00_2));  
 value v8(.in(H03),.out(H00_3)); 

 //value v5(.in(V10),.out(V1_0));  
 //value v6(.in(V11),.out(V1_1));  
 //value v7(.in(H07),.out(H0_6));  
 //value v8(.in(H08),.out(H0_7));       

reg clk,reset,prgm_b,CLB_prgm_b,cb_prgm_b,sb_prgm_b,bit_in_CLB,bit_in_CB,bit_in_SB,bit_in_SB_2,sb_prgm_b_in,
cb_prgm_b_in,CLB_prgm_b_in,sb_prgm_b_2,io_prgm_b_in,bit_in_IO,io_prgm_b;

integer CB_count,SB_count,SB_count_2,CLB_count,CLB_counter,CB_counter,SB_counter,SB_counter_2,IO_counter,IO_count;


FPGA FPGA1(.V00_0(V00_0),.V00_1(V00_1),.V00_2(V00_2),.V00_3(V00_3),
.V00_4(V00_4),.V00_5(V00_5),.V00_6(V00_6),.V00_7(V00_7),.V01_0(V01_0),
.V01_1(V01_1),.V01_2(V01_2),.V01_3(V01_3),.V01_4(V01_4),.V01_5(V01_5),
.V01_6(V01_6),.V01_7(V01_7),.V02_0(V02_0),.V02_1(V02_1),.V02_2(V02_2),
.V02_3(V02_3),.V02_4(V02_4),.V02_5(V02_5),.V02_6(V02_6),.V02_7(V02_7),
.V10_0(V10_0),.V10_1(V10_1),.V10_2(V10_2),.V10_3(V10_3),.V10_4(V10_4),
.V10_5(V10_5),.V10_6(V10_6),.V10_7(V10_7),.V11_0(V11_0),.V11_1(V11_1),
.V11_2(V11_2),.V11_3(V11_3),.V11_4(V11_4),.V11_5(V11_5),.V11_6(V11_6),
.V11_7(V11_7),.V12_0(V12_0),.V12_1(V12_1),.V12_2(V12_2),.V12_3(V12_3),
.V12_4(V12_4),.V12_5(V12_5),.V12_6(V12_6),.V12_7(V12_7),.H00_0(H00_0),
.H00_1(H00_1),.H00_2(H00_2),.H00_3(H00_3),.H00_4(H00_4),.H00_5(H00_5),
.H00_6(H00_6),.H00_7(H00_7),.H01_0(H01_0),.H01_1(H01_1),.H01_2(H01_2),
.H01_3(H01_3),.H01_4(H01_4),.H01_5(H01_5),.H01_6(H01_6),.H01_7(H01_7),
.H10_0(H10_0),.H10_1(H10_1),.H10_2(H10_2),.H10_3(H10_3),.H10_4(H10_4),
.H10_5(H10_5),.H10_6(H10_6),.H10_7(H10_7),.H11_0(H11_0),.H11_1(H11_1),
.H11_2(H11_2),.H11_3(H11_3),.H11_4(H11_4),.H11_5(H11_5),.H11_6(H11_6),
.H11_7(H11_7),.H20_0(H20_0),.H20_1(H20_1),.H20_2(H20_2),.H20_3(H20_3),
.H20_4(H20_4),.H20_5(H20_5),.H20_6(H20_6),.H20_7(H20_7),.H21_0(H21_0),
.H21_1(H21_1),.H21_2(H21_2),.clk(clk),.reset(reset),.prgm_b(prgm_b),
.CLB_prgm_b(CLB_prgm_b),.cb_prgm_b(cb_prgm_b),.sb_prgm_b(sb_prgm_b),
.sb_prgm_b_2(sb_prgm_b_2),.bit_in_CLB(bit_in_CLB),.bit_in_CB(bit_in_CB),
.sb_prgm_b_in(sb_prgm_b_in),.cb_prgm_b_in(cb_prgm_b_in),.CLB_prgm_b_in(CLB_prgm_b_in),
.bit_in_SB(bit_in_SB),.bit_in_SB_2(bit_in_SB_2),.io_prgm_b(io_prgm_b),.bit_in_IO(bit_in_IO),.io_prgm_b_in(io_prgm_b_in)); 
/*

FPGA FPGA1(.V00_0(V00_0),.V00_1(V00_1),.V00_2(V00_2),.V00_3(V00_3),
.V00_4(V00_4),.V00_5(V00_5),.V00_6(V00_6),.V00_7(V00_7),.V01_0(V01_0),
.V01_1(V01_1),.V01_2(V01_2),.V01_3(V01_3),.V01_4(V01_4),.V01_5(V01_5),
.V01_6(V01_6),.V01_7(V01_7),.V02_0(V02_0),.V02_1(V02_1),.V02_2(V02_2),
.V02_3(V02_3),.V02_4(V02_4),.V02_5(V02_5),.V02_6(V02_6),.V02_7(V02_7),
.V10_0(V10_0),.V10_1(V10_1),.V10_2(V10_2),.V10_3(V10_3),.V10_4(V10_4),
.V10_5(V10_5),.V10_6(V10_6),.V10_7(V10_7),.V11_0(V11_0),.V11_1(V11_1),
.V11_2(V11_2),.V11_3(V11_3),.V11_4(V11_4),.V11_5(V11_5),.V11_6(V11_6),
.V11_7(V11_7),.V12_0(V12_0),.V12_1(V12_1),.V12_2(V12_2),.V12_3(V12_3),
.V12_4(V12_4),.V12_5(V12_5),.V12_6(V12_6),.V12_7(V12_7),.H00_0(H00_0),
.H00_1(H00_1),.H00_2(H00_2),.H00_3(H00_3),.H00_4(H00_4),.H00_5(H00_5),
.H00_6(H00_6),.H00_7(H00_7),.H01_0(H01_0),.H01_1(H01_1),.H01_2(H01_2),
.H01_3(H01_3),.H01_4(H01_4),.H01_5(H01_5),.H01_6(H01_6),.H01_7(H01_7),
.H10_0(H10_0),.H10_1(H10_1),.H10_2(H10_2),.H10_3(H10_3),.H10_4(H10_4),
.H10_5(H10_5),.H10_6(H10_6),.H10_7(H10_7),.H11_0(H11_0),.H11_1(H11_1),
.H11_2(H11_2),.H11_3(H11_3),.H11_4(H11_4),.H11_5(H11_5),.H11_6(H11_6),
.H11_7(H11_7),.H20_0(H20_0),.H20_1(H20_1),.H20_2(H20_2),.H20_3(H20_3),
.H20_4(H20_4),.H20_5(H20_5),.H20_6(H20_6),.H20_7(H20_7),.H21_0(H21_0),
.H21_1(H21_1),.H21_2(H21_2),
      .clk(clk),.reset(reset),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b),.cb_prgm_b(cb_prgm_b),.sb_prgm_b(sb_prgm_b),.sb_prgm_b_2(sb_prgm_b_2),
	  .bit_in_CLB(bit_in_CLB),.bit_in_CB(bit_in_CB),.sb_prgm_b_in(sb_prgm_b_in),.cb_prgm_b_in(cb_prgm_b_in),.CLB_prgm_b_in(CLB_prgm_b_in),.bit_in_SB(bit_in_SB),.bit_in_SB_2(bit_in_SB_2));
*/

//For all bit-streams the bits are arranged in the decreasing order of their coordinate positions. eg. The bits belonging to the first CLB CLB_00 will be placed at the end of the CLB bitstream

initial begin
input_file=$fopen("/home/krishna/Downloads/DEV_Git/conf_bit_stream.txt","r");
clk = 1'b0;
 reset=1'b0;
 
 prgm_b=1'b1;   //indicates start of bit_stream----active low
 cb_prgm_b=1'b0;
 cb_prgm_b_in=1'b0;
 sb_prgm_b=1'b0;
 sb_prgm_b_in=1'b0;
 sb_prgm_b_2=1'b0;
 CLB_prgm_b=1'b0;
 io_prgm_b_in=1'b0;
 io_prgm_b=1'b0;

 fork
 #1 while(!$feof(input_file))
	begin
	CB_config_stream_final=$fscanf(input_file,"%b\n",CB_config_stream);
	SB_config_stream_final=$fscanf(input_file,"%b\n",SB_config_stream);
	CLB_config_stream_final=$fscanf(input_file,"%b\n",CLB_config_stream);
	IO_config_stream_final=$fscanf(input_file,"%b\n",IO_config_stream);
	end
	$fclose(input_file);
 #1 reset=1'b1;
 #1 prgm_b=1'b0;
 #1 cb_prgm_b=1'b1;
 #1 cb_prgm_b_in=1'b1;
 #1 sb_prgm_b=1'b1;
 #1 sb_prgm_b_2=1'b1;
 #1 sb_prgm_b_in=1'b1;
 #1 CLB_prgm_b=1'b1;
 #1 CLB_prgm_b_in=1'b1;
 #1 io_prgm_b_in=1'b1;
 #1 io_prgm_b=1'b1;

 #1 CB_counter=0;CB_count=0;
 #1 CLB_counter=0;CLB_count=0;
 #1 SB_counter=0;SB_count=0;
 #1 SB_counter_2=0;SB_count_2=0;
 #1 IO_counter=0;IO_count=0;
 #1 reset=1'b1;
 #2 reset=1'b0;

 join
end

initial begin
//for(i=0;i<=6074;i++)
//begin

forever #5 clk=!clk;

end



always@(posedge clk or posedge reset)
begin 

if(prgm_b!=1'b1 && cb_prgm_b!=1'b0) begin

	
	
    if((CB_counter == 49) && cb_prgm_b!=1'b0) //(no of bits required for one CB) + 1= 48+1=49
	begin
	    
		CB_count=CB_count+1;
		
		CB_counter=0;
		if(CB_count==16)
		begin
			
			cb_prgm_b=1'b0;
           // prgm_b=1'b1;
			
		end
	end 
	bit_in_CB <= CB_config_stream_final[0];
	CB_config_stream_final <=CB_config_stream_final>>1;
	CB_counter=CB_counter+1;//if endsj
end 

end //always block ends


always@(posedge clk or posedge reset)
begin 

	if(prgm_b!=1'b1 && sb_prgm_b!=1'b0) begin
	
		if((SB_counter == 769) && sb_prgm_b!=1'b0) //(no of bits required for one SB +1 = 769)
			begin
	    
			SB_count=SB_count+1;
			SB_counter=0;
			if(SB_count==9)
			begin
			
				sb_prgm_b=1'b0;
			//sb_prgm_b_in=1'b1;
			 prgm_b=1'b1;
			
			end
		end 
	bit_in_SB <= SB_config_stream_final[0];
	SB_config_stream_final <=SB_config_stream_final>>1;
	SB_counter=SB_counter+1;//if endsj
	end 

end //always block ends
/*
always@(posedge clk or posedge reset)
begin 

	if(prgm_b!=1'b1 && sb_prgm_b_2!=1'b0) begin
	
		if((SB_counter_2 == 769) && sb_prgm_b_2!=1'b0) //(no of bits required for one SB +1 = 769)
			begin
	    
			SB_count_2=SB_count_2+1;
			SB_counter_2=0;
			if(SB_count_2==2)
			begin
			
				sb_prgm_b_2=1'b0;
			sb_prgm_b_in=1'b1;
			if(sb_prgm_b_2==1'b0)
			 	 prgm_b=1'b1;
			
			end
		end 
	bit_in_SB_2 <= SB_config_stream_2[0];
	SB_config_stream_2 <=SB_config_stream_2>>1;
	SB_counter_2=SB_counter_2+1;//if endsj
	end 

end //always block ends  

 */

always@(posedge clk or posedge reset)
begin 

if(prgm_b!=1'b1 && CLB_prgm_b!=1'b0) 
begin

    if((CLB_counter == 297) && CLB_prgm_b!=1'b0) //(no of bits required for one CLB) + 1= 37+1=38  or (37 + (number of LUT -1))
	begin
	    
		CLB_count=CLB_count+1;
		
		CLB_counter=0;
		if(CLB_count==32)
		begin
			
			CLB_prgm_b=1'b0;
          
			
		end
	end 
	bit_in_CLB <= CLB_config_stream_final[0];
	CLB_config_stream_final <=CLB_config_stream_final>>1;
	CLB_counter=CLB_counter+1;//if endsj
end 

end //always block ends

always@(posedge clk or posedge reset)
begin 

if(prgm_b!=1'b1 && io_prgm_b!=1'b0) 
begin	
	
    if((IO_counter == 17) && io_prgm_b!=1'b0) //(no of bits required for one IO block configuration + 1= 16+1=17
	begin
	    
		IO_count=IO_count+1;
		
		IO_counter=0;
		if(IO_count==12)
		begin
			
			io_prgm_b=1'b0;
           // prgm_b=1'b1;
			
		end
	end 
	bit_in_IO <= IO_config_stream_final[0];
	IO_config_stream_final <=IO_config_stream_final>>1;
	IO_counter=IO_counter+1;//if endsj
end 

end //always block ends

//end  

initial
	begin 
#800;               //time=5 seconds
V00=1;V01=1;V02=1;V03=1;//H05=1;H06=1;H07=1;H08=1;
H00=0;H01=1;H02=0;H03=1;
//V10=1;V11=1;
#500;
	//reset=1'b0;
V00=1;V01=1;V02=1;V03=1;//H05=1;H06=1;H07=1;H08=1;
H00=0;H01=1;H02=0;H03=1;
//V10=1;V11=1;
#86400 $finish;
end
initial begin
    $dumpfile("test.vcd");

    $dumpvars(0,FPGA_testbench);
    $timeformat(-9, 1, " ns", 6);
	$monitor("At prgm_b=%b reset=%b SB_count=%d CB_config_stream_final=%b",prgm_b,reset,SB_count,CB_config_stream_final);
end

//Stimulus

endmodule
