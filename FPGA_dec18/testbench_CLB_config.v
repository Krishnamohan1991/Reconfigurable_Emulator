
module testbench_CLB_config(); 

//reg clk,reset,prgm_b,CLB_prgm_b;

reg [110:0] config_stream ;
reg bit_in_CLB;

reg CLB_prgm_b_in,prgm_b,clk,reset,CLB_prgm_b;
	//wire prgm_b_out,CLB_prgm_b_out_1,prgm_b_out_1,CLB_prgm_b_out_2,prgm_b_out_2;

wire CLB_prgm_b_out,CLB_prgm_b_out_1,CLB_prgm_b_out_2;

wire [15:0] look_up_t1;     	
wire [15:0] look_up_t2;
wire [15:0] look_up_t3;
integer counter,lut_count;
wire switch1,switch2,switch3;

wire [4:0] interconnect_a1;     wire [4:0] interconnect_b1;    //interconnect configuration bits for each inout of LUT
wire [4:0] interconnect_a2;     wire [4:0] interconnect_b2;
wire [4:0] interconnect_a3;     wire [4:0] interconnect_b3;
wire [4:0] interconnect_a4;     wire [4:0] interconnect_b4;

wire [4:0] interconnect_c1;     wire [4:0] interconnect_g1;
wire [4:0] interconnect_c2;     wire [4:0] interconnect_g2;
wire [4:0] interconnect_c3;     wire [4:0] interconnect_g3;
wire [4:0] interconnect_c4;     wire [4:0] interconnect_g4;

look_up_table_interconnect_config LUT_interconnect1(.bit_in(bit_in_CLB),.CLB_prgm_b(CLB_prgm_b),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b_in(CLB_prgm_b_in),.CLB_prgm_b_out(CLB_prgm_b_out),
	.lut(look_up_t1),.interconnect_config_x1(interconnect_a1),.interconnect_config_x2(interconnect_a2),
	.interconnect_config_x3(interconnect_a3),.interconnect_config_x4(interconnect_a4),.mux_switch(switch1));

look_up_table_interconnect_config LUT_interconnect2(.bit_in(bit_in_CLB),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b_in(CLB_prgm_b_out),.CLB_prgm_b_out(CLB_prgm_b_out_1),
	.lut(look_up_t2),.interconnect_config_x1(interconnect_b1),.interconnect_config_x2(interconnect_b2),
	.interconnect_config_x3(interconnect_b3),.interconnect_config_x4(interconnect_b4),.mux_switch(switch2),.CLB_prgm_b(CLB_prgm_b));

look_up_table_interconnect_config LUT_interconnect3(.bit_in(bit_in_CLB),.prgm_b(prgm_b),.clk(clk),.reset(reset),.CLB_prgm_b_in(CLB_prgm_b_out_1),.CLB_prgm_b_out(CLB_prgm_b_out_2),
	.lut(look_up_t3),.interconnect_config_x1(interconnect_c1),.interconnect_config_x2(interconnect_c2),                                
	.interconnect_config_x3(interconnect_c3),.interconnect_config_x4(interconnect_c4),.mux_switch(switch3),.CLB_prgm_b(CLB_prgm_b));  

initial begin

config_stream[110:0]= 111'b100000000000000000000000000000000000110000000000000000000000000000000000011000000000000000000000000000000000001;
clk = 1'b0;
 reset=1'b0;
 
 prgm_b=1'b1;   //indicates start of bit_stream----active low
 CLB_prgm_b=1'b0;

 fork
 #1 reset=1'b1;
 #1 prgm_b=1'b0;
 #1 CLB_prgm_b=1'b1;
  #1 CLB_prgm_b_in=1'b1;
 #1 counter=0;lut_count=0;
 #1 reset=1'b1;
 #2 reset=1'b0;
 join
end


always@(posedge clk or posedge reset)
begin 

if(prgm_b!=1'b1 && CLB_prgm_b!=1'b0) begin

	
	
    if((counter == 38) && CLB_prgm_b!=1'b0) //(no of bits required for one CLB) + 1= 37+1=38  or (37 + (number of LUT -1))
	begin
	    
		lut_count=lut_count+1;
		
		counter=0;
		if(lut_count==3)
		begin
			
			CLB_prgm_b=1'b0;
            prgm_b=1'b1;
			
		end
	end 
	bit_in_CLB <= config_stream[0];
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
    $dumpvars(0,testbench_CLB_config);
    $timeformat(-9, 1, " ns", 6);
	$monitor("At t=%t prgm_b=%b reset=%b lut_count=%d bit_in_CLB=%b counter=%d",$time,prgm_b,reset,lut_count,bit_in_CLB,counter);
end

//Stimulus

endmodule

