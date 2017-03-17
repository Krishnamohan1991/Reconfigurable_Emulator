
module config_TB(); 

reg clk,reset,prgm_b,bit_in_CB,cb_prgm_b;

reg [77:0] config_stream ;

wire x1_G0,x2_G0,x3_G0,x4_G0,x5_G0,x6_G0,bit_in,
	x7_G0,x8_G0,x9_G0,q1_G0,q2_G0,q3_G0,q4_G0,x1_G1,x2_G1,x3_G1,x4_G1,x5_G1,x6_G1,x7_G1,x8_G1,x9_G1,q1_G1,
	q2_G1,q3_G1,q4_G1,bit_out_CB_1,bit_out_1;
	wire cb_prgm_b_out,prgm_b_out,cb_prgm_b_out_1,prgm_b_out_1,cb_prgm_b_out_2,prgm_b_out_2;

//wire x1_G0,x2_G0,x3_G0,x4_G0,x5_G0,x6_G0,x7_G0,x8_G0,x9_G0,q1_G0,q2_G0,q3_G0,q4_G0,x1_G1,x2_G1,x3_G1,x4_G1,x5_G1,x6_G1,x7_G1,x8_G1,x9_G1,q1_G1,q2_G1,q3_G1,q4_G1;

wire x1_G0_1,x2_G0_1,x3_G0_1,x4_G0_1,x5_G0_1,x6_G0_1, x7_G0_1,x8_G0_1,x9_G0_1,q1_G0_1,q2_G0_1,q3_G0_1,q4_G0_1,x1_G1_1,x2_G1_1,x3_G1_1,x4_G1_1,x5_G1_1, x6_G1_1,x7_G1_1,x8_G1_1,x9_G1_1,q1_G1_1,q2_G1_1,q3_G1_1,q4_G1_1;

integer counter,lut_count;
//value v1(.in(bit_in_CB),.out(x1_G0));
//value v2(.in(q4_G1),.out(bit_out_1));

test_config TC(.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.prgm_b_in(prgm_b),.cb_prgm_b_in(cb_prgm_b),.prgm_b_out(prgm_b_out),.cb_prgm_b_out(cb_prgm_b_out),.x1_G0(x1_G0),.x2_G0(x2_G0),
	.x3_G0(x3_G0),.x4_G0(x4_G0),.x5_G0(x5_G0),.x6_G0(x6_G0),.x7_G0(x7_G0),.x8_G0(x8_G0),.x9_G0(x9_G0),.q1_G0(q1_G0),.q2_G0(q2_G0),.q3_G0(q3_G0),.q4_G0(q4_G0),
	.x1_G1(x1_G1),.x2_G1(x2_G1),.x3_G1(x3_G1),.x4_G1(x4_G1),.x5_G1(x5_G1),.x6_G1(x6_G1),.x7_G1(x7_G1),.x8_G1(x8_G1),.x9_G1(x9_G1),.q1_G1(q1_G1),.q2_G1(q2_G1),.q3_G1(q3_G1),
	.q4_G1(q4_G1),.cb_prgm_b(cb_prgm_b));

test_config TC1(.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.prgm_b_in(prgm_b_out),.cb_prgm_b_in(cb_prgm_b_out),.prgm_b_out(prgm_b_out_1),.cb_prgm_b_out(cb_prgm_b_out_1),
.x1_G0(x1_G0_1),.x2_G0(x2_G0_1),.x3_G0(x3_G0_1),.x4_G0(x4_G0_1),.x5_G0(x5_G0_1),.x6_G0(x6_G0_1),.x7_G0(x7_G0_1),.x8_G0(x8_G0_1),.x9_G0(x9_G0_1),
.q1_G0(q1_G0_1),.q2_G0(q2_G0_1),.q3_G0(q3_G0_1),.q4_G0(q4_G0_1),.x1_G1(x1_G1_1),.x2_G1(x2_G1_1),.x3_G1(x3_G1_1),.x4_G1(x4_G1_1),.x5_G1(x5_G1_1),
.x6_G1(x6_G1_1),.x7_G1(x7_G1_1),.x8_G1(x8_G1_1),.x9_G1(x9_G1_1),.q1_G1(q1_G1_1),.q2_G1(q2_G1_1),.q3_G1(q3_G1_1),.q4_G1(q4_G1_1),.cb_prgm_b(cb_prgm_b));

test_config TC2(.bit_in_CB(bit_in_CB),.clk(clk),.reset(reset),.prgm_b_in(prgm_b_out_1),.cb_prgm_b_in(cb_prgm_b_out_1),.prgm_b_out(prgm_b_out_2),.cb_prgm_b_out(cb_prgm_b_out_2),
.x1_G0(x1_G0_2),.x2_G0(x2_G0_2),.x3_G0(x3_G0_2),.x4_G0(x4_G0_2),.x5_G0(x5_G0_2),.x6_G0(x6_G0_2),.x7_G0(x7_G0_2),.x8_G0(x8_G0_2),.x9_G0(x9_G0_2),
.q1_G0(q1_G0_2),.q2_G0(q2_G0_2),.q3_G0(q3_G0_2),.q4_G0(q4_G0_2),.x1_G1(x1_G1_2),.x2_G1(x2_G1_2),.x3_G1(x3_G1_2),.x4_G1(x4_G1_2),.x5_G1(x5_G1_2),
.x6_G1(x6_G1_2),.x7_G1(x7_G1_2),.x8_G1(x8_G1_2),.x9_G1(x9_G1_2),.q1_G1(q1_G1_2),.q2_G1(q2_G1_2),.q3_G1(q3_G1_2),.q4_G1(q4_G1_2),.cb_prgm_b(cb_prgm_b));


initial begin

config_stream[77:0]= 78'b11100000000000000000000001_10110000000000000000000001_11010000000000000000000011;
clk = 1'b0;
 reset=1'b0;
 
 prgm_b=1'b1;   //indicates start of bit_stream----active low
 cb_prgm_b=1'b0;

 fork
 #1 reset=1'b1;
 #1 prgm_b=1'b0;
 #1 cb_prgm_b=1'b1;
 #1 counter=0;lut_count=0;
 #1 reset=1'b1;
 #2 reset=1'b0;
 join
end


always@(posedge clk or posedge reset)
begin 

if(prgm_b!=1'b1 && cb_prgm_b!=1'b0) begin

	
	
	
	if((counter == 28) && cb_prgm_b!=1'b0) //(no of SB connected-1) +26
	begin
	    
		lut_count=lut_count+1;
		
		counter=0;
		if(lut_count==3)
		begin
			
			cb_prgm_b=1'b0;
			
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
//switch=0;
#6360;



#20500 $finish;
end
initial begin
    $dumpfile("test.vcd");

    $dumpvars(0,config_TB);
   $timeformat(-9, 1, " ns", 6);
$monitor("At t=%t prgm_b=%b reset=%b lut_count=%d bit_in_CB=%b counter=%d",$time,prgm_b,reset,lut_count,bit_in_CB,counter);
end

//Stimulus



endmodule