`define behavioral
module CB(x1,x2,x3,x4,q1,q2,G0,G1,G2,G3,G4,G5,G6,G7,
	bit_in_CB,cb_prgm_b_in,cb_prgm_b_out,clk,reset,cb_prgm_b,prgm_b);

output  x1,x2,x3,x4,cb_prgm_b_out;
input q1,q2,bit_in_CB,clk,reset,prgm_b,cb_prgm_b,cb_prgm_b_in;
inout G0,G1,G2,G3,G4,G5,G6,G7;


`ifdef behavioral


wire x1_G0;wire x1_G1;wire x1_G2;wire x1_G3;wire x2_G0;wire x2_G1;wire x2_G2;wire x2_G3;wire x3_G0;wire x3_G1;wire x3_G2;wire x3_G3;
wire x4_G0;wire x4_G1;wire x4_G2;wire x4_G3;wire q1_G0;wire q1_G1;wire q1_G2;wire q1_G3;wire q2_G0;wire q2_G1;wire q2_G2;wire q2_G3;
wire x1_G4;wire x1_G5;wire x1_G6;wire x1_G7;wire x2_G4;wire x2_G5;wire x2_G6;wire x2_G7;wire x3_G4;wire x3_G5;wire x3_G6;wire x3_G7;
wire x4_G4;wire x4_G5;wire x4_G6;wire x4_G7;wire q1_G4;wire q1_G5;wire q1_G6;wire q1_G7;wire q2_G4;wire q2_G5;wire q2_G6;wire q2_G7;

config_cb_behav CBehav(.bit_in(bit_in_CB),.prgm_b(prgm_b),.clk(clk),.reset(reset),.cb_prgm_b(cb_prgm_b),.cb_prgm_b_in(cb_prgm_b_in),.cb_prgm_b_out(cb_prgm_b_out),
	.x1_G0(x1_G0),.x1_G1(x1_G1),.x1_G2(x1_G2),.x1_G3(x1_G3),.x2_G0(x2_G0),.x2_G1(x2_G1),.x2_G2(x2_G2),.x2_G3(x2_G3),.x3_G0(x3_G0),
	.x3_G1(x3_G1),.x3_G2(x3_G2),.x3_G3(x3_G3),.x4_G0(x4_G0),.x4_G1(x4_G1),.x4_G2(x4_G2),.x4_G3(x4_G3),
.q1_G0(q1_G0),.q1_G1(q1_G1),.q1_G2(q1_G2),.q1_G3(q1_G3),.q2_G0(q2_G0),.q2_G1(q2_G1),.q2_G2(q2_G2),.q2_G3(q2_G3),
.x1_G4(x1_G4),.x1_G5(x1_G5),.x1_G6(x1_G6),.x1_G7(x1_G7),.x2_G4(x2_G4),.x2_G5(x2_G5),.x2_G6(x2_G6),.x2_G7(x2_G7),
.x4_G4(x4_G4),.x4_G5(x4_G5),.x4_G6(x4_G6),.x4_G7(x4_G7),.x5_G4(x5_G4),.x5_G5(x5_G5),.x5_G6(x5_G6),.x5_G7(x5_G7),
.q1_G4(q1_G4),.q1_G5(q1_G5),.q1_G6(q1_G6),.q1_G7(q1_G7),.q2_G4(q2_G4),.q2_G5(q2_G5),.q2_G6(q2_G6),.q2_G7(q2_G7),.x3_G4(x3_G4),.x3_G5(x3_G5),.x3_G6(x3_G6),.x3_G7(x3_G7));

unidir_switch CA1(.port1(G0),.port2(x1),.enable(x1_G0));    unidir_switch  CB1(.port1(G1),.port2(x1),.enable(x1_G1));  
unidir_switch CA2(.port1(G0),.port2(x2),.enable(x2_G0));    unidir_switch CB2(.port1(G1),.port2(x2),.enable(x2_G1));  
unidir_switch CA3(.port1(G0),.port2(x3),.enable(x3_G0));    unidir_switch CB3(.port1(G1),.port2(x3),.enable(x3_G1));  
unidir_switch CA4(.port1(G0),.port2(x4),.enable(x4_G0));    unidir_switch CB4(.port1(G1),.port2(x4),.enable(x4_G1));  
unidir_switch CA6(.port1(q2),.port2(G0),.enable(q2_G0));    unidir_switch CB6(.port1(q2),.port2(G1),.enable(q2_G1));  
unidir_switch CA7(.port1(q1),.port2(G0),.enable(q1_G0));    unidir_switch CB7(.port1(q1),.port2(G1),.enable(q1_G1));  
 
unidir_switch CC1(.port1(G2),.port2(x1),.enable(x1_G2));   unidir_switch CD1(.port1(G3),.port2(x1),.enable(x1_G3));
unidir_switch CC2(.port1(G2),.port2(x2),.enable(x2_G2));   unidir_switch CD2(.port1(G3),.port2(x2),.enable(x2_G3));
unidir_switch CC3(.port1(G2),.port2(x3),.enable(x3_G2));   unidir_switch CD3(.port1(G3),.port2(x3),.enable(x3_G3));
unidir_switch CC4(.port1(G2),.port2(x4),.enable(x4_G2));   unidir_switch CD4(.port1(G3),.port2(x4),.enable(x4_G3));
unidir_switch CC6(.port1(q2),.port2(G2),.enable(q2_G2));   unidir_switch CD6(.port1(q2),.port2(G3),.enable(q2_G3));
unidir_switch CC7(.port1(q1),.port2(G2),.enable(q1_G2));   unidir_switch CD7(.port1(q1),.port2(G3),.enable(q1_G3));

unidir_switch CA10(.port1(G4),.port2(x1),.enable(x1_G4));   unidir_switch CB10(.port1(G5),.port2(x1),.enable(x1_G5));  
unidir_switch CA11(.port1(G4),.port2(x2),.enable(x2_G4));   unidir_switch CB11(.port1(G5),.port2(x2),.enable(x2_G5));  
 unidir_switch CA8(.port1(G4),.port2(x3),.enable(x3_G4));    unidir_switch CB8(.port1(G5),.port2(x3),.enable(x3_G5));  
 unidir_switch CA9(.port1(G4),.port2(x4),.enable(x4_G4));    unidir_switch CB9(.port1(G5),.port2(x4),.enable(x4_G5));  
unidir_switch CA12(.port1(q1),.port2(G4),.enable(q1_G4));   unidir_switch CB12(.port1(q1),.port2(G5),.enable(q1_G5));  
unidir_switch SA13(.port1(q2),.port2(G4),.enable(q2_G4));   unidir_switch CB13(.port1(q2),.port2(G5),.enable(q2_G5));  


 unidir_switch CC8(.port1(G6),.port2(x1),.enable(x1_G6));   unidir_switch CD8(.port1(G7),.port2(x1),.enable(x1_G7));
 unidir_switch CC9(.port1(G6),.port2(x2),.enable(x2_G6));   unidir_switch CD9(.port1(G7),.port2(x2),.enable(x2_G7));
unidir_switch CC10(.port1(G6),.port2(x3),.enable(x3_G6));  unidir_switch CD10(.port1(G7),.port2(x3),.enable(x3_G7));
unidir_switch CC11(.port1(G6),.port2(x4),.enable(x4_G6));  unidir_switch CD11(.port1(G7),.port2(x4),.enable(x4_G7));
unidir_switch CC12(.port1(q1),.port2(G6),.enable(q1_G6));  unidir_switch CD12(.port1(q1),.port2(G7),.enable(q1_G7));
unidir_switch CC13(.port1(q2),.port2(G6),.enable(q2_G6));  unidir_switch CD13(.port1(q2),.port2(G7),.enable(q2_G7));

 

`else

wire x1_G0,x1_G1,x1_G2,x1_G3,x2_G0,x2_G1,x2_G2,x2_G3,x3_G0,x3_G1,x3_G2,x3_G3,
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
q4_G4,q4_G5,q4_G6,q4_G7;

config_cb CB_conf(.bit_in_CB(bit_in_CB),.bit_out_CB(bit_out_CB),.clk(clk),.reset(reset),.prgm_b(prgm_b),.cb_prgm_b(cb_prgm_b),
.x1_G0(x1_G0),.x1_G1(x1_G1),.x1_G2(x1_G2),.x1_G3(x1_G3),.x2_G0(x2_G0),.x2_G1(x2_G1),.x2_G2(x2_G2),.x2_G3(x2_G3),
.x3_G0(x3_G0),.x3_G1(x3_G1),.x3_G2(x3_G2),.x3_G3(x3_G3),.x4_G0(x4_G0),.x4_G1(x4_G1),.x4_G2(x4_G2),.x4_G3(x4_G3),

.q1_G0(q1_G0),.q1_G1(q1_G1),.q1_G2(q1_G2),.q1_G3(q1_G3),
.q2_G0(q2_G0),.q2_G1(q2_G1),.q2_G2(q2_G2),.q2_G3(q2_G3),.q3_G0(q3_G0),.q3_G1(q3_G1),.q3_G2(q3_G2),.q3_G3(q3_G3),
.q4_G0(q4_G0),.q4_G1(q4_G1),.q4_G2(q4_G2),.q4_G3(q4_G3),.x1_G4(x1_G4),.x1_G5(x1_G5),.x1_G6(x1_G6),.x1_G7(x1_G7),
.x2_G4(x2_G4),.x2_G5(x2_G5),.x2_G6(x2_G6),.x2_G7(x2_G7),.x3_G4(x3_G4),.x3_G5(x3_G5),.x3_G6(x3_G6),.x3_G7(x3_G7),
.x4_G4(x4_G4),.x4_G5(x4_G5),.x4_G6(x4_G6),.x4_G7(x4_G7),
.q1_G4(q1_G4),.q1_G5(q1_G5),.q1_G6(q1_G6),.q1_G7(q1_G7),.q2_G4(q2_G4),.q2_G5(q2_G5),.q2_G6(q2_G6),.q2_G7(q2_G7),
);

tranif1(x1,G0,x1_G0);	tranif1(x1,G1,x1_G1);   tranif1(x1,G2,x1_G2);	tranif1(x1,G3,x1_G3);
tranif1(x2,G0,x2_G0);   tranif1(x2,G1,x2_G1);   tranif1(x2,G2,x2_G2);   tranif1(x2,G3,x2_G3);
tranif1(x3,G0,x3_G0);   tranif1(x3,G1,x3_G1);   tranif1(x3,G2,x3_G2);   tranif1(x3,G3,x3_G3);
tranif1(x4,G0,x4_G0);   tranif1(x4,G1,x4_G1);   tranif1(x4,G2,x4_G2);   tranif1(x4,G3,x4_G3);
tranif1(q1,G0,q1_G0);   tranif1(q1,G1,q1_G1);   tranif1(q1,G2,q1_G2);   tranif1(q1,G3,q1_G3);
tranif1(q2,G0,q2_G0);   tranif1(q2,G1,q2_G1);   tranif1(q2,G2,q2_G2);   tranif1(q2,G3,q2_G3);

tranif1(x1,G4,x1_G4);	tranif1(x1,G5,x1_G5);   tranif1(x1,G6,x1_G6);	tranif1(x1,G7,x1_G7);
tranif1(x2,G4,x2_G4);   tranif1(x2,G5,x2_G5);   tranif1(x2,G6,x2_G6);   tranif1(x2,G7,x2_G7);
tranif1(x3,G4,x3_G4);   tranif1(x3,G5,x3_G5);   tranif1(x3,G6,x3_G6);   tranif1(x3,G7,x3_G7);
tranif1(x4,G4,x4_G4);   tranif1(x4,G5,x4_G5);   tranif1(x4,G6,x4_G6);   tranif1(x4,G7,x4_G7);
tranif1(q1,G4,q1_G4);   tranif1(q1,G5,q1_G5);   tranif1(q1,G6,q1_G6);   tranif1(q1,G7,q1_G7);
tranif1(q2,G4,q2_G4);   tranif1(q2,G5,q2_G5);   tranif1(q2,G6,q2_G6);   tranif1(q2,G7,q2_G7);

`endif
 


endmodule

