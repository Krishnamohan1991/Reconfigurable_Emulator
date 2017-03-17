module config_cb_behav(bit_in_CB,bit_out_CB,clk,reset,prgm_b,cb_prgm_b,x1_G0,x1_G1,x1_G2,x1_G3,x2_G0,x2_G1,x2_G2,x2_G3,x3_G0,x3_G1,x3_G2,x3_G3,
x4_G0,x4_G1,x4_G2,x4_G3,x5_G0,x5_G1,x5_G2,x5_G3,
x6_G0,x6_G1,x6_G2,x6_G3,x7_G0,x7_G1,x7_G2,x7_G3,
x8_G0,x8_G1,x8_G2,x8_G3,x9_G0,x9_G1,x9_G2,x9_G3,
q1_G0,q1_G1,q1_G2,q1_G3,q2_G0,q2_G1,q2_G2,q2_G3,
q3_G0,q3_G1,q3_G2,q3_G3,q4_G0,q4_G1,q4_G2,q4_G3,
x1_G4,x1_G5,x1_G6,x1_G7,x2_G4,x2_G5,x2_G6,x2_G7,
x3_G4,x3_G5,x3_G6,x3_G7,x4_G4,x4_G5,x4_G6,x4_G7,
x5_G4,x5_G5,x5_G6,x5_G7,x6_G4,x6_G5,x6_G6,x6_G7,
x7_G4,x7_G5,x7_G6,x7_G7,x8_G4,x8_G5,x8_G6,x8_G7,
x9_G4,x9_G5,x9_G6,x9_G7,q1_G4,q1_G5,q1_G6,q1_G7,
q2_G4,q2_G5,q2_G6,q2_G7,q3_G4,q3_G5,q3_G6,q3_G7,
q4_G4,q4_G5,q4_G6,q4_G7);

output reg [1:0]x1_G0;output reg [1:0]x1_G1;output reg [1:0] x1_G2;output reg [1:0]x1_G3;output reg [1:0]x2_G0;output reg [1:0]x2_G1;output reg [1:0]x2_G2;output reg [1:0]x2_G3;
output reg [1:0]x3_G0;output reg [1:0]x3_G1;output reg [1:0] x3_G2;output reg [1:0]x3_G3;output reg [1:0]x4_G0;output reg [1:0]x4_G1;output reg [1:0]x4_G2;output reg [1:0]x4_G3;
output reg [1:0]x5_G0;output reg [1:0]x5_G1;output reg [1:0] x5_G2;output reg [1:0]x5_G3;output reg [1:0]x6_G0;output reg [1:0]x6_G1;output reg [1:0]x6_G2;output reg [1:0]x6_G3;
output reg [1:0]x7_G0;output reg [1:0]x7_G1;output reg [1:0] x7_G2;output reg [1:0]x7_G3;output reg [1:0]x8_G0;output reg [1:0]x8_G1;output reg [1:0]x8_G2;output reg [1:0]x8_G3;
output reg [1:0]x9_G0;output reg [1:0]x9_G1;output reg [1:0] x9_G2;output reg [1:0]x9_G3;output reg [1:0]q1_G0;output reg [1:0]q1_G1;output reg [1:0]q1_G2;output reg [1:0]q1_G3;
output reg [1:0]q2_G0;output reg [1:0]q2_G1;output reg [1:0] q2_G2;output reg [1:0]q2_G3;output reg [1:0]q3_G0;output reg [1:0]q3_G1;output reg [1:0]q3_G2;output reg [1:0]q3_G3;
output reg [1:0]q4_G0;output reg [1:0]q4_G1;output reg [1:0] q4_G2;output reg [1:0]q4_G3;output reg [1:0]x1_G4;output reg [1:0]x1_G5;output reg [1:0]x1_G6;output reg [1:0]x1_G7;
output reg [1:0]x2_G4;output reg [1:0]x2_G5;output reg [1:0] x2_G6;output reg [1:0]x2_G7;output reg [1:0]x3_G4;output reg [1:0]x3_G5;output reg [1:0]x3_G6;output reg [1:0]x3_G7;
output reg [1:0]x4_G4;output reg [1:0]x4_G5;output reg [1:0] x4_G6;output reg [1:0]x4_G7;output reg [1:0]x5_G4;output reg [1:0]x5_G5;output reg [1:0]x5_G6;output reg [1:0]x5_G7;
output reg [1:0]x6_G4;output reg [1:0]x6_G5;output reg [1:0] x6_G6;output reg [1:0]x6_G7;output reg [1:0]x7_G4;output reg [1:0]x7_G5;output reg [1:0]x7_G6;output reg [1:0]x7_G7;
output reg [1:0]x8_G4;output reg [1:0]x8_G5;output reg [1:0] x8_G6;output reg [1:0]x8_G7;output reg [1:0]x9_G4;output reg [1:0]x9_G5;output reg [1:0]x9_G6;output reg [1:0]x9_G7;
output reg [1:0]q1_G4;output reg [1:0]q1_G5;output reg [1:0] q1_G6;output reg [1:0]q1_G7;output reg [1:0]q2_G4;output reg [1:0]q2_G5;output reg [1:0]q2_G6;output reg [1:0]q2_G7;
output reg [1:0]q3_G4;output reg [1:0]q3_G5;output reg [1:0] q3_G6;output reg [1:0]q3_G7;output reg [1:0]q4_G4;output reg [1:0]q4_G5;output reg [1:0]q4_G6;output reg [1:0]q4_G7;
output reg bit_out_CB;  

input bit_in_CB,clk,reset,prgm_b,cb_prgm_b;

	

always @ (posedge clk or posedge reset)
begin
if (prgm_b==1'b0 && cb_prgm_b==1'b1) begin
	if(reset) begin
x1_G0[1:0] <= 2'b00;  x1_G2[1:0] <= 2'b00;   x1_G4[1:0] <= 2'b00;   x1_G6[1:0] <= 2'b00;
x2_G0[1:0] <= 2'b00;  x2_G2[1:0] <= 2'b00;   x2_G4[1:0] <= 2'b00;   x2_G6[1:0] <= 2'b00;
x3_G0[1:0] <= 2'b00;  x3_G2[1:0] <= 2'b00;   x3_G4[1:0] <= 2'b00;   x3_G6[1:0] <= 2'b00;
x4_G0[1:0] <= 2'b00;  x4_G2[1:0] <= 2'b00;   x4_G4[1:0] <= 2'b00;   x4_G6[1:0] <= 2'b00;
x5_G0[1:0] <= 2'b00;  x5_G2[1:0] <= 2'b00;   x5_G4[1:0] <= 2'b00;   x5_G6[1:0] <= 2'b00;
x6_G0[1:0] <= 2'b00;  x6_G2[1:0] <= 2'b00;   x6_G4[1:0] <= 2'b00;   x6_G6[1:0] <= 2'b00;
x7_G0[1:0] <= 2'b00;  x7_G2[1:0] <= 2'b00;   x7_G4[1:0] <= 2'b00;   x7_G6[1:0] <= 2'b00;
x8_G0[1:0] <= 2'b00;  x8_G2[1:0] <= 2'b00;   x8_G4[1:0] <= 2'b00;   x8_G6[1:0] <= 2'b00;
q1_G0[1:0] <= 2'b00;  q1_G2[1:0] <= 2'b00;   q1_G4[1:0] <= 2'b00;   q1_G6[1:0] <= 2'b00;
q2_G0[1:0] <= 2'b00;  q2_G2[1:0] <= 2'b00;   q2_G4[1:0] <= 2'b00;   q2_G6[1:0] <= 2'b00;
q3_G0[1:0] <= 2'b00;  q3_G2[1:0] <= 2'b00;   q3_G4[1:0] <= 2'b00;   q3_G6[1:0] <= 2'b00;
q4_G0[1:0] <= 2'b00;  q4_G2[1:0] <= 2'b00;   q4_G4[1:0] <= 2'b00;   q4_G6[1:0] <= 2'b00;
x1_G1[1:0] <= 2'b00;  x1_G3[1:0] <= 2'b00;   x1_G5[1:0] <= 2'b00;   x1_G7[1:0] <= 2'b00;
x2_G1[1:0] <= 2'b00;  x2_G3[1:0] <= 2'b00;   x2_G5[1:0] <= 2'b00;   x2_G7[1:0] <= 2'b00;
x3_G1[1:0] <= 2'b00;  x3_G3[1:0] <= 2'b00;   x3_G5[1:0] <= 2'b00;   x3_G7[1:0] <= 2'b00;
x4_G1[1:0] <= 2'b00;  x4_G3[1:0] <= 2'b00;   x4_G5[1:0] <= 2'b00;   x4_G7[1:0] <= 2'b00;
x5_G1[1:0] <= 2'b00;  x5_G3[1:0] <= 2'b00;   x5_G5[1:0] <= 2'b00;   x5_G7[1:0] <= 2'b00;
x6_G1[1:0] <= 2'b00;  x6_G3[1:0] <= 2'b00;   x6_G5[1:0] <= 2'b00;   x6_G7[1:0] <= 2'b00;
x7_G1[1:0] <= 2'b00;  x7_G3[1:0] <= 2'b00;   x7_G5[1:0] <= 2'b00;   x7_G7[1:0] <= 2'b00;
x8_G1[1:0] <= 2'b00;  x8_G3[1:0] <= 2'b00;   x8_G5[1:0] <= 2'b00;   x8_G7[1:0] <= 2'b00;
q1_G1[1:0] <= 2'b00;  q1_G3[1:0] <= 2'b00;   q1_G5[1:0] <= 2'b00;   q1_G7[1:0] <= 2'b00;
q2_G1[1:0] <= 2'b00;  q2_G3[1:0] <= 2'b00;   q2_G5[1:0] <= 2'b00;   q2_G7[1:0] <= 2'b00;
q3_G1[1:0] <= 2'b00;  q3_G3[1:0] <= 2'b00;   q3_G5[1:0] <= 2'b00;   q3_G7[1:0] <= 2'b00;
q4_G1[1:0] <= 2'b00;  q4_G3[1:0] <= 2'b00;   q4_G5[1:0] <= 2'b00;   q4_G7[1:0] <= 2'b00;
                                         bit_out_CB <= 0;


	end
else begin
x1_G0[0] <= bit_in_CB  ;   x1_G2[0] <= q4_G1[1];    x1_G4[0] <= q4_G3[1];   x1_G6[0] <= q4_G5[1];
x1_G0[1] <= x1_G0[0];   x1_G2[1] <= x1_G2[0];    x1_G4[1] <= x1_G4[0];   x1_G6[1] <= x1_G6[0];
x2_G0[0] <= x1_G0[1];   x2_G2[0] <= x1_G2[1];    x2_G4[0] <= x1_G4[1];   x2_G6[0] <= x1_G6[1];
x2_G0[1] <= x2_G0[0];   x2_G2[1] <= x2_G2[0];    x2_G4[1] <= x2_G4[0];   x2_G6[1] <= x2_G6[0];
x3_G0[0] <= x2_G0[1];   x3_G2[0] <= x2_G2[1];    x3_G4[0] <= x2_G4[1];   x3_G6[0] <= x2_G6[1];
x3_G0[1] <= x3_G0[0];   x3_G2[1] <= x3_G2[0];    x3_G4[1] <= x3_G4[0];   x3_G6[1] <= x3_G6[0];
x4_G0[0] <= x3_G0[1];   x4_G2[0] <= x3_G2[1];    x4_G4[0] <= x3_G4[1];   x4_G6[0] <= x3_G6[1];
x4_G0[1] <= x4_G0[0];   x4_G2[1] <= x4_G2[0];    x4_G4[1] <= x4_G4[0];   x4_G6[1] <= x4_G6[0];
x5_G0[0] <= x4_G0[1];   x5_G2[0] <= x4_G2[1];    x5_G4[0] <= x4_G4[1];   x5_G6[0] <= x4_G6[1];
x5_G0[1] <= x5_G0[0];   x5_G2[1] <= x5_G2[0];    x5_G4[1] <= x5_G4[0];   x5_G6[1] <= x5_G6[0];
x6_G0[0] <= x5_G0[1];   x6_G2[0] <= x5_G2[1];    x6_G4[0] <= x5_G4[1];   x6_G6[0] <= x5_G6[1];
x6_G0[1] <= x6_G0[0];   x6_G2[1] <= x6_G2[0];    x6_G4[1] <= x6_G4[0];   x6_G6[1] <= x6_G6[0];
x7_G0[0] <= x6_G0[1];   x7_G2[0] <= x6_G2[1];    x7_G4[0] <= x6_G4[1];   x7_G6[0] <= x6_G6[1];
x7_G0[1] <= x7_G0[0];   x7_G2[1] <= x7_G2[0];    x7_G4[1] <= x7_G4[0];   x7_G6[1] <= x7_G6[0];
x8_G0[0] <= x7_G0[1];   x8_G2[0] <= x7_G2[1];    x8_G4[0] <= x7_G4[1];   x8_G6[0] <= x7_G6[1];
x8_G0[1] <= x8_G0[0];   x8_G2[1] <= x8_G2[0];    x8_G4[1] <= x8_G4[0];   x8_G6[1] <= x8_G6[0];
x9_G0[0] <= x8_G0[1];   x9_G2[0] <= x8_G2[1];    x9_G4[0] <= x8_G4[1];   x9_G6[0] <= x8_G6[1];
x9_G0[1] <= x9_G0[0];   x9_G2[1] <= x9_G2[0];    x9_G4[1] <= x9_G4[0];   x9_G6[1] <= x9_G6[0];
q1_G0[0] <= x9_G0[1];   q1_G2[0] <= x9_G2[1];    q1_G4[0] <= x9_G4[1];   q1_G6[0] <= x9_G6[1];
q1_G0[1] <= q1_G0[0];   q1_G2[1] <= q1_G2[0];    q1_G4[1] <= q1_G4[0];   q1_G6[1] <= q1_G6[0];
q2_G0[0] <= q1_G0[1];   q2_G2[0] <= q1_G2[1];    q2_G4[0] <= q1_G4[1];   q2_G6[0] <= q1_G6[1];
q2_G0[1] <= q2_G0[0];   q2_G2[1] <= q2_G2[0];    q2_G4[1] <= q2_G4[0];   q2_G6[1] <= q2_G6[0];
q3_G0[0] <= q2_G0[1];   q3_G2[0] <= q2_G2[1];    q3_G4[0] <= q2_G4[1];   q3_G6[0] <= q2_G6[1];
q3_G0[1] <= q3_G0[0];   q3_G2[1] <= q3_G2[0];    q3_G4[1] <= q3_G4[0];   q3_G6[1] <= q3_G6[0];
q4_G0[0] <= q3_G0[1];   q4_G2[0] <= q3_G2[1];    q4_G4[0] <= q3_G4[1];   q4_G6[0] <= q3_G6[1];
q4_G0[1] <= q4_G0[0];   q4_G2[1] <= q4_G2[0];    q4_G4[1] <= q4_G4[0];   q4_G6[1] <= q4_G6[0];
x1_G1[0] <= q4_G0[1];   x1_G3[0] <= q4_G2[1];    x1_G5[0] <= q4_G4[1];   x1_G7[0] <= q4_G6[1];
x1_G1[1] <= x1_G1[0];   x1_G3[1] <= x1_G3[0];    x1_G5[1] <= x1_G5[0];   x1_G7[1] <= x1_G7[0];
x2_G1[0] <= x1_G1[1];   x2_G3[0] <= x1_G3[1];    x2_G5[0] <= x1_G5[1];   x2_G7[0] <= x1_G7[1];
x2_G1[1] <= x2_G1[0];   x2_G3[1] <= x2_G3[0];    x2_G5[1] <= x2_G5[0];   x2_G7[1] <= x2_G7[0];
x3_G1[0] <= x2_G1[1];   x3_G3[0] <= x2_G3[1];    x3_G5[0] <= x2_G5[1];   x3_G7[0] <= x2_G7[1];
x3_G1[1] <= x3_G1[0];   x3_G3[1] <= x3_G3[0];    x3_G5[1] <= x3_G5[0];   x3_G7[1] <= x3_G7[0];
x4_G1[0] <= x3_G1[1];   x4_G3[0] <= x3_G3[1];    x4_G5[0] <= x3_G5[1];   x4_G7[0] <= x3_G7[1];
x4_G1[1] <= x4_G1[0];   x4_G3[1] <= x4_G3[0];    x4_G5[1] <= x4_G5[0];   x4_G7[1] <= x4_G7[0];
x5_G1[0] <= x4_G1[1];   x5_G3[0] <= x4_G3[1];    x5_G5[0] <= x4_G5[1];   x5_G7[0] <= x4_G7[1];
x5_G1[1] <= x5_G1[0];   x5_G3[1] <= x5_G3[0];    x5_G5[1] <= x5_G5[0];   x5_G7[1] <= x5_G7[0];
x6_G1[0] <= x5_G1[1];   x6_G3[0] <= x5_G3[1];    x6_G5[0] <= x5_G5[1];   x6_G7[0] <= x5_G7[1];
x6_G1[1] <= x6_G1[0];   x6_G3[1] <= x6_G3[0];    x6_G5[1] <= x6_G5[0];   x6_G7[1] <= x6_G7[0];
x7_G1[0] <= x6_G1[1];   x7_G3[0] <= x6_G3[1];    x7_G5[0] <= x6_G5[1];   x7_G7[0] <= x6_G7[1];
x7_G1[1] <= x7_G1[0];   x7_G3[1] <= x7_G3[0];    x7_G5[1] <= x7_G5[0];   x7_G7[1] <= x7_G7[0];
x8_G1[0] <= x7_G1[1];   x8_G3[0] <= x7_G3[1];    x8_G5[0] <= x7_G5[1];   x8_G7[0] <= x7_G7[1];
x8_G1[1] <= x8_G1[0];   x8_G3[1] <= x8_G3[0];    x8_G5[1] <= x8_G5[0];   x8_G7[1] <= x8_G7[0];
x9_G1[0] <= x8_G1[1];   x9_G3[0] <= x8_G3[1];    x9_G5[0] <= x8_G5[1];   x9_G7[0] <= x8_G7[1];
x9_G1[1] <= x9_G1[0];   x9_G3[1] <= x9_G3[0];    x9_G5[1] <= x9_G5[0];   x9_G7[1] <= x9_G7[0];
q1_G1[0] <= x9_G1[1];   q1_G3[0] <= x9_G3[1];    q1_G5[0] <= x9_G5[1];   q1_G7[0] <= x9_G7[1];
q1_G1[1] <= q1_G1[0];   q1_G3[1] <= q1_G3[0];    q1_G5[1] <= q1_G5[0];   q1_G7[1] <= q1_G7[0];
q2_G1[0] <= q1_G1[1];   q2_G3[0] <= q1_G3[1];    q2_G5[0] <= q1_G5[1];   q2_G7[0] <= q1_G7[1];
q2_G1[1] <= q2_G1[0];   q2_G3[1] <= q2_G3[0];    q2_G5[1] <= q2_G5[0];   q2_G7[1] <= q2_G7[0];
q3_G1[0] <= q2_G1[1];   q3_G3[0] <= q2_G3[1];    q3_G5[0] <= q2_G5[1];   q3_G7[0] <= q2_G7[1];
q3_G1[1] <= q3_G1[0];   q3_G3[1] <= q3_G3[0];    q3_G5[1] <= q3_G5[0];   q3_G7[1] <= q3_G7[0];
q4_G1[0] <= q3_G1[1];   q4_G3[0] <= q3_G3[1];    q4_G5[0] <= q3_G5[1];   q4_G7[0] <= q3_G7[1];
q4_G1[1] <= q4_G1[0];   q4_G3[1] <= q4_G3[0];    q4_G5[1] <= q4_G5[0];   q4_G7[1] <= q4_G7[0];
                                                                       bit_out_CB <= q4_G7[1];
	end

end
end
 
 	
endmodule