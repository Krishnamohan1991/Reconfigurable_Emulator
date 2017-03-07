module trial_bench();
reg I1,I2;
reg [1:0] enable_dir;
//reg  dir;
wire i1,i2,i3;
value v1(.in(I1),.out(i1));

new_switch n1(.a(i2),.b(i1),.enable_dir(enable_dir));
value v2(.in(i2),.out(i3));
initial
	begin
		#5  enable_dir[1:0]=2'b10;
        #5 I1=1'b1; enable_dir[1:0]=2'b10;

        #5 I1=1'b1; enable_dir[1:0]=2'b10;

	end

	initial begin
    $dumpfile("test.vcd");
$timeformat(-9, 1, " ns", 6);
//$monitor("At t=%t I1=%b I2=%b in1=%b",$time,I1,I2,in1);
    $dumpvars(0,trial_bench);
  
end


endmodule	