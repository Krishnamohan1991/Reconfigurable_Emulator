
module test_bench_SB_CB(); 

wire bit_out_CLB,bit_out_SB;
wire IQ1,IQ2,IQ3,IQ4,IQ5,IQ6,IQ7,IQ8;
wire IQ1_1,IQ2_1,IQ3_1,IQ4_1,IQ5_1,IQ6_1,IQ7_1,IQ8_1;
reg bit_in_CLB,bit_in_SB,sb_prgm_b,cb_prgm_b,bit_in_CB;
reg I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,I16,prgm_b;
wire a1,a2,a3,a4,a5,a6,a7,w1,w2,w3,w4,w5,w6,w7,w8,x1,x2,x3,x4,x5,x6,x7,x8,y1,y2,y3,y4,y5,y6,y7,y8;
wire G0,G1,G2,G3,G4,G5,G6,G7;
wire cx1,cx2,cx3,cx4,cx5,cx6,cx7,cx8;
//reg [3:0] sel;sel
reg clk,reset,switch;
reg [295:0] config_stream ;
reg [103:0] CB_config_stream;
reg CLB_prgm_b;
wire A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7,C0,C1,C2,C3,C4,C5,C6,C7,D0,D1,D2,D3,D4,D5,D6,D7;
integer counter,lut_count;
CLB CLB1(.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),.I8(I8),.I9(I9),.I10(I10),.I11(I11),.I12(I12),.I13(I13),.I14(I14),.I15(I15),.I16(I16),.clk(clk),
	.reset(reset),.prgm_b(prgm_b),.bit_out(bit_out_CLB),.bit_in(bit_in_CLB),.IQ1(IQ1),.IQ2(IQ2),.IQ3(IQ3),.IQ4(IQ4),.IQ5(IQ5),.IQ6(IQ6),.IQ7(IQ7),.IQ8(IQ8),.CLB_prgm_b(CLB_prgm_b));
  
CB CB1(.x1(cx1),.x2(cx2),.x3(cx3),.x4(cx4),.x5(cx5),.x6(cx6),.x7(cx7),.x8(cx8),.q1(IQ1_1),.q2(IQ2_1),.q3(IQ3_1),.q4(IQ4_1),.G0(G0),.G1(G1),.G2(G2),.G3(G3),.G4(G4),.G5(G5),.G6(G6),.G7(G7),
	.bit_in_CB(bit_in_CB),.bit_out_CB(bit_out_CB),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.prgm_b(prgm_b));

reg [383:0] SB_config_stream ;
integer counter_sb,SB_count,CB_count,counter_cb;
switch_block SB(.bit_in(bit_in_SB),.bit_out(bit_out_SB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.sb_prgm_b(sb_prgm_b),.A0(G6),.A1(G0),.A2(G0),.A3(G0),.A4(G1),.A5(G0),.A6(G0),.A7(G1),
	.B0(w1),.B1(w2),.B2(w3),.B3(w4),.B4(w5),.B5(w6),.B6(w7),.B7(w8),
.C0(x1),.C1(x2),.C2(x3),.C3(x4),.C4(x5),.C5(x6),.C6(x7),.C7(x8),
.D0(y1),.D1(y2),.D2(y3),.D3(y4),.D4(y5),.D5(y6),.D6(y7),.D7(y8)); 
initial begin
// first configuration
//time=0, send the configuration bit stream, clk =0,reset=0(lut has XXXXXXX), switch bit =x
//config_stream= 296'b00000000010001000110111111111111111100000000011000100011011111111111111110000010000100010001101111111111111111000100000010001000110111111111111111100000100001000100011011111111111111110000000001100010001101111111111111111000011000010001000110111111111111111100011000001000100011111111111111111110;
config_stream= 296'b0000000000000000000000001111111111111_0000000000000000000111111111111111111_0000000000000000000111111111111111111_1111111111111111111111111111111111111_11111111111111111111111111111111111_1111111111111111111111111111111111111_1111111111111111111111111111111111111_1111111111111111111111111111111111111;
SB_config_stream= 384'b000000000000000000000000_100000000000000000000000_000000000000000000000000_000000000000000000000000_000000000000000000000000_000000000000000000000000_000000000000000000000000_000000000000000000000000_0000000000000000_0000000000000000_0000000000000000_0000000000000000_0000000000000000_0000000000000000_0000000000000000_0000000000000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000_00000000;
CB_config_stream=104'b0000000001000_0000000001000_0000000000000_0000000000000_0000000000000_0000000000000_0000000000000_0000000000000;
clk = 1'b0;
 reset=1'b0;
 //switch=1'b0;
 prgm_b=1'b1;   //indicates start of bit_stream----active low
 CLB_prgm_b=1'b0;
 sb_prgm_b=1'b0;
 cb_prgm_b=1'b0;
 fork
 #1 reset=1'b1;
 #1 prgm_b=1'b0;
 #1 CLB_prgm_b=1'b1;
 #1 sb_prgm_b=1'b1;
 #1 cb_prgm_b=1'b1;
 #1 counter=0;lut_count=0;counter_sb=0;SB_count=0;CB_count=0;counter_cb=0;
 #1 reset=1'b1;
 #2 reset=1'b0;
 join
end


always@(posedge clk)
begin
 //always block begins
 //while (prgm_b==1'b0)
//begin //while loop starts
if(prgm_b!=1'b1 && CLB_prgm_b!=1'b0) begin

	bit_in_CLB <= config_stream[0];
	config_stream <=config_stream>>1;
	
	if((counter == 38) && CLB_prgm_b!=1'b0)
	begin
	    //config_stream=config_stream>>1;
		lut_count=lut_count+1;
		//switch=config_stream[1:0];
		//config_stream=config_stream>>1;
		counter=0;
		if(lut_count==8)
		begin
			//prgm_b=1'b1;
			CLB_prgm_b=1'b0;
			
		end
	end 
	counter=counter+1;//if endsj
end 
//#1 In = 16'b1100_0011_1011_0101; 
//#2 sel=4'b0000;
end //always block ends

always@(posedge clk)
begin
if(prgm_b!=1'b1 && sb_prgm_b!=1'b0) begin

	bit_in_SB <= SB_config_stream[0];
	SB_config_stream <=SB_config_stream>>1;
	
	if((counter_sb == 385) && sb_prgm_b!=1'b0)
	begin
	   
		SB_count=SB_count+1;

		counter_sb=0;
		if(SB_count==1)
		begin
			prgm_b=1'b1;
			sb_prgm_b=1'b0;
			
		end
	end 
	counter_sb=counter_sb+1;//if endsj
end 

end//alwys ends

always@(posedge clk)
begin
if(prgm_b!=1'b1 && cb_prgm_b!=1'b0) begin

	bit_in_CB <= CB_config_stream[0];
	CB_config_stream <=CB_config_stream>>1;
	
	if((counter_cb == 105) && cb_prgm_b!=1'b0)
	begin
	   
		CB_count=CB_count+1;
	
		counter_cb=0;
		if(CB_count==1)
		begin
			
			cb_prgm_b=1'b0;
			
		end
	end 
	counter_cb=counter_cb+1;//if endsj
end 

end//alwys ends

initial begin

forever #5 clk=!clk;
end

initial
begin 

#6350;               //time=5 seconds

I1=0;I2=0;I3=0;I4=1;I5=1;I6=1;I7=1;I8=0;
I9=0;I10=1;I11=1;I12=1;I13=0;I14=1;I15=1;
I16=0;
reset=1'b0;
//switch=0;
#6360;
I1=1;I2=0;I3=0;I4=1;I5=1;I6=0;I7=1;I8=0;
I9=0;I10=1;I11=1;I12=0;I13=0;I14=1;I15=1;
I16=0;
//switch=0;
reset=1'b0;
#6370;

 I1=1;I2=0;I3=0;I4=1;I5=1;I6=0;I7=1;I8=0;
I9=0;I10=0;I11=1;I12=1;I13=1;I14=1;I15=0;
I16=0;
//switch=0;
reset=1'b0;
#6380;
//reset=1'b1;
//switch=0;
I1=0;I2=0;I3=0;I4=1;I5=1;I6=0;I7=1;I8=0;
I9=0;I10=0;I11=1;I12=0;I13=0;I14=1;I15=1;
I16=1;
#20500 $finish;
end
initial begin
    $dumpfile("test.vcd");

    $dumpvars(0,test_bench_SB_CB);
   $timeformat(-9, 1, " ns", 6);
$monitor("At t=%t prgm_b=%b reset=%b lut_count=%d",$time,prgm_b,reset,lut_count);
end

//Stimulus



endmodule