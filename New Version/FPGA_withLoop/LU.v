module LU(in1,x1,x2,x3,x4,out2,prgm_b,CLB_prgm_b);
input wire [15:0] in1;
 reg [3:0] in2;
 input x1,x2,x3,x4,CLB_prgm_b;
input prgm_b;
always@(*)begin
if(prgm_b==1'b1) begin
	in2[3:0]={x4,x3,x2,x1};
end
	
end

output reg out2;
initial
begin
if(prgm_b==1'b1)
	out2=1'b0;
	else begin
		out2=1'bx;
	end
end	

always@(in2 or in1)
begin
if(prgm_b==1'b1 && CLB_prgm_b==1'b0)
begin

case (in2)
4'b0000:  out2 = in1[0];
4'b0001:  out2 = in1[1];
4'b0010:  out2 = in1[2];
4'b0011:  out2 = in1[3];
4'b0100:  out2 = in1[4];
4'b0101:  out2 = in1[5];
4'b0110:  out2 = in1[6];
4'b0111:  out2 = in1[7];
4'b1000:  out2 = in1[8];
4'b1001:  out2 = in1[9];
4'b1010:  out2 = in1[10];
4'b1011:  out2 = in1[11];
4'b1100:  out2 = in1[12];
4'b1101:  out2 = in1[13];
4'b1110:  out2 = in1[14];
4'b1111:  out2 = in1[15];
endcase
end //if ends
else 
begin
	out2=1'bx;
end //end of if-block
end  //always block ends
endmodule