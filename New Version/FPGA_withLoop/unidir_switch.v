module unidir_switch(port1,port2,enable);
inout  port1,port2;
//input  dir;
input enable; //two bit vector whose bit 0 gives you direction of data flow
						//if enable_dir[0]==1  data flows from port1 to port2
						//if enable_dir[0]==0  data flows from port2 to port1
						// if enable_dir[1]==1  switch is turned on else if  enable_dir[1]==1  switch is turned off
reg out1;

always@(*) 
begin
 
 out1=(enable==1'b1 )? port1:1'bz;  //register holds value from either from wire 1 or wire 2 depending on data-flow direction
 end

assign port2= (enable==1'b1 )?  out1: 1'bz;  //port2 gets value from port1 
//assign port1=(enable_dir[1]==1'b1 )? ((enable_dir[0]==1'b0)? out1: 1'bz): 1'bz;  //port1 gets value from port2
endmodule
