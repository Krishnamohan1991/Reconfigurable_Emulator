module test_bench();


//integer delay=5;
reg oe,inp;
wire outp;
reg I1,I2,I3;
inout A,B,C,D;
inout bidir;
value v1(.in(I1),.out(A));
value v2(.in(I2),.out(D));
bidirec b1(.oe(oe), .inp(A), .outp(C), .bidir(bidir));


initial begin
	
#4 oe=1; 
inp=0;  
//#5 interconnect_switch[4:0]=4'b0000;
#5 oe=1;I1=1; I2=0;

#5 oe=1;





//enable2=0;


 
end
initial begin
    $dumpfile("test.vcd");
$timeformat(-9, 1, " ns", 6);
//$monitor("At t=%t I1=%b I2=%b in1=%b",$time,I1,I2,in1);
    $dumpvars(0,test_bench);
  
end

endmodule








