module new_switch(a,b,enable_dir);
inout  a,b;
//input  dir;
input [1:0] enable_dir;

//reg enable=enable_dir[0];
//reg dir=;

reg out1;
//reg out1;

always@(*) 
begin
 
 out1=(enable_dir[1]==1'b1 )? ((enable_dir[0]==1'b1)? a:b): 1'bz;
 end

assign b=(enable_dir[1]==1'b1 )? ((enable_dir[0]==1'b1)? out1: 1'bz): 1'bz;
assign a=(enable_dir[1]==1'b1 )? ((enable_dir[0]==1'b0)? out1: 1'bz): 1'bz;
endmodule
