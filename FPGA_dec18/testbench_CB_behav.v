
module testbench_CB_behav(); 

//reg clk,reset,prgm_b,cb_prgm_b;

reg [191:0] config_stream ;
reg bit_in_CB;

reg cb_prgm_b_in,prgm_b,clk,reset,cb_prgm_b;
	//wire prgm_b_out,cb_prgm_b_out_1,prgm_b_out_1,cb_prgm_b_out_2,prgm_b_out_2;

wire cb_prgm_b_out,cb_prgm_b_out_1;

wire x1_G0;wire x1_G1;wire x1_G2;wire x1_G3;wire x2_G0;wire x2_G1;wire x2_G2;wire x2_G3;wire x3_G0;wire x3_G1;wire x3_G2;wire x3_G3;
wire x4_G0;wire x4_G1;wire x4_G2;wire x4_G3;wire x5_G0;wire x5_G1;wire x5_G2;wire x5_G3;wire x6_G0;wire x6_G1;wire x6_G2;wire x6_G3;wire x7_G0;wire x7_G1;wire x7_G2;wire x7_G3;
wire x8_G0;wire x8_G1;wire x8_G2;wire x8_G3;wire q1_G0;wire q1_G1;wire q1_G2;wire q1_G3;wire q2_G0;wire q2_G1;wire q2_G2;wire q2_G3;wire q3_G0;wire q3_G1;wire q3_G2;wire q3_G3;
wire q4_G0;wire q4_G1;wire q4_G2;wire q4_G3;wire x1_G4;wire x1_G5;wire x1_G6;wire x1_G7;wire x2_G4;wire x2_G5;wire x2_G6;wire x2_G7;wire x3_G4;wire x3_G5;wire x3_G6;wire x3_G7;
wire x4_G4;wire x4_G5;wire x4_G6;wire x4_G7;wire x5_G4;wire x5_G5;wire x5_G6;wire x5_G7;wire x6_G4;wire x6_G5;wire x6_G6;wire x6_G7;wire x7_G4;wire x7_G5;wire x7_G6;wire x7_G7;
wire x8_G4;wire x8_G5;wire x8_G6;wire x8_G7;wire q1_G4;wire q1_G5;wire q1_G6;wire q1_G7;wire q2_G4;wire q2_G5;wire q2_G6;wire q2_G7;wire q3_G4;wire q3_G5;wire q3_G6;wire q3_G7;
wire q4_G4;wire q4_G5;wire q4_G6;wire q4_G7;

wire x1_G0_1;wire x1_G1_1;wire x1_G2_1;wire x1_G3_1;wire x2_G0_1;wire x2_G1_1;wire x2_G2_1;wire x2_G3_1;wire x3_G0_1;wire x3_G1_1;wire x3_G2_1;wire x3_G3_1;
wire x4_G0_1;wire x4_G1_1;wire x4_G2_1;wire x4_G3_1;wire x5_G0_1;wire x5_G1_1;wire x5_G2_1;wire x5_G3_1;wire x6_G0_1;wire x6_G1_1;wire x6_G2_1;wire x6_G3_1;wire x7_G0_1;wire x7_G1_1;wire x7_G2_1;wire x7_G3_1;
wire x8_G0_1;wire x8_G1_1;wire x8_G2_1;wire x8_G3_1;wire q1_G0_1;wire q1_G1_1;wire q1_G2_1;wire q1_G3_1;wire q2_G0_1;wire q2_G1_1;wire q2_G2_1;wire q2_G3_1;wire q3_G0_1;wire q3_G1_1;wire q3_G2_1;wire q3_G3_1;
wire q4_G0_1;wire q4_G1_1;wire q4_G2_1;wire q4_G3_1;wire x1_G4_1;wire x1_G5_1;wire x1_G6_1;wire x1_G7_1;wire x2_G4_1;wire x2_G5_1;wire x2_G6_1;wire x2_G7_1;wire x3_G4_1;wire x3_G5_1;wire x3_G6_1;wire x3_G7_1;
wire x4_G4_1;wire x4_G5_1;wire x4_G6_1;wire x4_G7_1;wire x5_G4_1;wire x5_G5_1;wire x5_G6_1;wire x5_G7_1;wire x6_G4_1;wire x6_G5_1;wire x6_G6_1;wire x6_G7_1;wire x7_G4_1;wire x7_G5_1;wire x7_G6_1;wire x7_G7_1;
wire x8_G4_1;wire x8_G5_1;wire x8_G6_1;wire x8_G7_1;wire q1_G4_1;wire q1_G5_1;wire q1_G6_1;wire q1_G7_1;wire q2_G4_1;wire q2_G5_1;wire q2_G6_1;wire q2_G7_1;wire q3_G4_1;wire q3_G5_1;wire q3_G6_1;wire q3_G7_1;
wire q4_G4_1;wire q4_G5_1;wire q4_G6_1;wire q4_G7_1;

integer counter,lut_count;

config_cb_behav CB1(.bit_in(bit_in_CB),.prgm_b(prgm_b),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.cb_prgm_b_in(cb_prgm_b_in),.cb_prgm_b_out(cb_prgm_b_out),
	.x1_G0(x1_G0),.x1_G1(x1_G1),.x1_G2(x1_G2),.x1_G3(x1_G3),.x2_G0(x2_G0),.x2_G1(x2_G1),.x2_G2(x2_G2),.x2_G3(x2_G3),.x3_G0(x3_G0),.x3_G1(x3_G1),.x3_G2(x3_G2),.x3_G3(x3_G3),
.x4_G0(x4_G0),.x4_G1(x4_G1),.x4_G2(x4_G2),.x4_G3(x4_G3),.x5_G0(x5_G0),.x5_G1(x5_G1),.x5_G2(x5_G2),.x5_G3(x5_G3),.x6_G0(x6_G0),.x6_G1(x6_G1),.x6_G2(x6_G2),.x6_G3(x6_G3),.x7_G0(x7_G0),.x7_G1(x7_G1),.x7_G2(x7_G2),.x7_G3(x7_G3),
.x8_G0(x8_G0),.x8_G1(x8_G1),.x8_G2(x8_G2),.x8_G3(x8_G3),.q1_G0(q1_G0),.q1_G1(q1_G1),.q1_G2(q1_G2),.q1_G3(q1_G3),.q2_G0(q2_G0),.q2_G1(q2_G1),.q2_G2(q2_G2),.q2_G3(q2_G3),.q3_G0(q3_G0),.q3_G1(q3_G1),.q3_G2(q3_G2),.q3_G3(q3_G3),
.q4_G0(q4_G0),.q4_G1(q4_G1),.q4_G2(q4_G2),.q4_G3(q4_G3),.x1_G4(x1_G4),.x1_G5(x1_G5),.x1_G6(x1_G6),.x1_G7(x1_G7),.x2_G4(x2_G4),.x2_G5(x2_G5),.x2_G6(x2_G6),.x2_G7(x2_G7),.x3_G4(x3_G4),.x3_G5(x3_G5),.x3_G6(x3_G6),.x3_G7(x3_G7),
.x4_G4(x4_G4),.x4_G5(x4_G5),.x4_G6(x4_G6),.x4_G7(x4_G7),.x5_G4(x5_G4),.x5_G5(x5_G5),.x5_G6(x5_G6),.x5_G7(x5_G7),.x6_G4(x6_G4),.x6_G5(x6_G5),.x6_G6(x6_G6),.x6_G7(x6_G7),.x7_G4(x7_G4),.x7_G5(x7_G5),.x7_G6(x7_G6),.x7_G7(x7_G7),
.x8_G4(x8_G4),.x8_G5(x8_G5),.x8_G6(x8_G6),.x8_G7(x8_G7),.q1_G4(q1_G4),.q1_G5(q1_G5),.q1_G6(q1_G6),.q1_G7(q1_G7),.q2_G4(q2_G4),.q2_G5(q2_G5),.q2_G6(q2_G6),.q2_G7(q2_G7),.q3_G4(q3_G4),.q3_G5(q3_G5),.q3_G6(q3_G6),.q3_G7(q3_G7),
.q4_G4(q4_G4),.q4_G5(q4_G5),.q4_G6(q4_G6),.q4_G7(q4_G7));

config_cb_behav CB2(.bit_in(bit_in_CB),.prgm_b(prgm_b),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.cb_prgm_b_in(cb_prgm_b_out),.cb_prgm_b_out(cb_prgm_b_out_1),
	.x1_G0(x1_G0_1),.x1_G1(x1_G1_1),.x1_G2(x1_G2_1),.x1_G3(x1_G3_1),.x2_G0(x2_G0_1),.x2_G1(x2_G1_1),.x2_G2(x2_G2_1),.x2_G3(x2_G3_1),.x3_G0(x3_G0_1),.x3_G1(x3_G1_1),.x3_G2(x3_G2_1),.x3_G3(x3_G3_1),
.x4_G0(x4_G0_1),.x4_G1(x4_G1_1),.x4_G2(x4_G2_1),.x4_G3(x4_G3_1),.x5_G0(x5_G0_1),.x5_G1(x5_G1_1),.x5_G2(x5_G2_1),.x5_G3(x5_G3_1),.x6_G0(x6_G0_1),.x6_G1(x6_G1_1),.x6_G2(x6_G2_1),.x6_G3(x6_G3_1),.x7_G0(x7_G0_1),.x7_G1(x7_G1_1),.x7_G2(x7_G2_1),.x7_G3(x7_G3_1),
.x8_G0(x8_G0_1),.x8_G1(x8_G1_1),.x8_G2(x8_G2_1),.x8_G3(x8_G3_1),.q1_G0(q1_G0_1),.q1_G1(q1_G1_1),.q1_G2(q1_G2_1),.q1_G3(q1_G3_1),.q2_G0(q2_G0_1),.q2_G1(q2_G1_1),.q2_G2(q2_G2_1),.q2_G3(q2_G3_1),.q3_G0(q3_G0_1),.q3_G1(q3_G1_1),.q3_G2(q3_G2_1),.q3_G3(q3_G3_1),
.q4_G0(q4_G0_1),.q4_G1(q4_G1_1),.q4_G2(q4_G2_1),.q4_G3(q4_G3_1),.x1_G4(x1_G4_1),.x1_G5(x1_G5_1),.x1_G6(x1_G6_1),.x1_G7(x1_G7_1),.x2_G4(x2_G4_1),.x2_G5(x2_G5_1),.x2_G6(x2_G6_1),.x2_G7(x2_G7_1),.x3_G4(x3_G4_1),.x3_G5(x3_G5_1),.x3_G6(x3_G6_1),.x3_G7(x3_G7_1),
.x4_G4(x4_G4_1),.x4_G5(x4_G5_1),.x4_G6(x4_G6_1),.x4_G7(x4_G7_1),.x5_G4(x5_G4_1),.x5_G5(x5_G5_1),.x5_G6(x5_G6_1),.x5_G7(x5_G7_1),.x6_G4(x6_G4_1),.x6_G5(x6_G5_1),.x6_G6(x6_G6_1),.x6_G7(x6_G7_1),.x7_G4(x7_G4_1),.x7_G5(x7_G5_1),.x7_G6(x7_G6_1),.x7_G7(x7_G7_1),
.x8_G4(x8_G4_1),.x8_G5(x8_G5_1),.x8_G6(x8_G6_1),.x8_G7(x8_G7_1),.q1_G4(q1_G4_1),.q1_G5(q1_G5_1),.q1_G6(q1_G6_1),.q1_G7(q1_G7_1),.q2_G4(q2_G4_1),.q2_G5(q2_G5_1),.q2_G6(q2_G6_1),.q2_G7(q2_G7_1),.q3_G4(q3_G4_1),.q3_G5(q3_G5_1),.q3_G6(q3_G6_1),.q3_G7(q3_G7_1),
.q4_G4(q4_G4_1),.q4_G5(q4_G5_1),.q4_G6(q4_G6_1),.q4_G7(q4_G7_1));



initial begin

config_stream[191:0]= 192'b100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001_100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001;
clk = 1'b0;
 reset=1'b0;
 
 prgm_b=1'b1;   //indicates start of bit_stream----active low
 cb_prgm_b=1'b0;

 fork
 #1 reset=1'b1;
 #1 prgm_b=1'b0;
 #1 cb_prgm_b=1'b1;
  #1 cb_prgm_b_in=1'b1;
 #1 counter=0;lut_count=0;
 #1 reset=1'b1;
 #2 reset=1'b0;
 join
end


always@(posedge clk or posedge reset)
begin 

if(prgm_b!=1'b1 && cb_prgm_b!=1'b0) begin

	
	
    if((counter == 97) && cb_prgm_b!=1'b0) //(no of bits required for one CB) + 1= 96+1=97
	begin
	    
		lut_count=lut_count+1;
		
		counter=0;
		if(lut_count==2)
		begin
			
			cb_prgm_b=1'b0;
            prgm_b=1'b1;
			
		end
	end 
	bit_in_CB <= config_stream[0];
	config_stream <=config_stream>>1;
	counter=counter+1;//if endsj
end 

end //always block ends

initial begin

forever #5 clk=!clk;
end

initial
	begin 

	#6350;               //time=5 seconds


	reset=1'b0;


	#20500 $finish;
end

initial begin
    $dumpfile("test.vcd");

    $dumpvars(0,testbench_CB_behav);
    $timeformat(-9, 1, " ns", 6);
	$monitor("At t=%t prgm_b=%b reset=%b lut_count=%d bit_in_CB=%b counter=%d",$time,prgm_b,reset,lut_count,bit_in_CB,counter);
end

//Stimulus

endmodule