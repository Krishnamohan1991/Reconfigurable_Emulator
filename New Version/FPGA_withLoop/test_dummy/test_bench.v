module test_bench();
parameter d=1'b1;
reg [4:0] interconnect_switch;
reg I1,I2,I3;
//integer delay=5;
reg in1,in2;
reg enable1,enable2;
inout A,B,C,D;
//SRAM_switch s1(.data_in(w2),.data_out(w3),.enable(1'b1));
// s2(.data_in(w3),.data_out(I1),.enable(1'b0));




value v1(.in(I1),.out(A));
value v2(.in(A),.out(C));
value v3(.in(A),.out(D));
//bufif1 a1(A,D,1'b1);
bufif1 a1(D,A,1'bz);
//switch_test s1(.a(A),.b(D),.enable(1'b1));
//switch_test s2(.a(D),.b(A),.enable(1'b0));

	/*if(d)
	SRAM_switch  u1(.data_in(A),.enable(1'b1),.data_out(B));
	else begin
	SRAM_switch u2(data_in,enable,data_out);
	end
*/

//switch_test ST(.a(w1),.b(w2),.enable(enable));

//sb_interconnect_unit SB_in(.I1(w1),.I2(w2),.I3(w3),.interconnect_switch(interconnect_switch));
initial begin
	
#4 I1=1; 
I2=0;  I3=0;
//#5 interconnect_switch[4:0]=4'b0000;
//#5 enable1=1;
//enable2=0;
#5 in1=1;

 
end
initial begin
    $dumpfile("test.vcd");
$timeformat(-9, 1, " ns", 6);
$monitor("At t=%t I1=%b I2=%b in1=%b",$time,I1,I2,in1);
    $dumpvars(0,test_bench);
  
end

endmodule