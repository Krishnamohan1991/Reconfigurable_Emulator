
module CB(x1,x2,x3,x4,q1,q2,Rq1,Rq2,Cy1,Cy2,G0,G1,G2,G3,G4,G5,G6,G7,
	bit_in_CB,cb_prgm_b_in,cb_prgm_b_out,clk,reset,cb_prgm_b,prgm_b);

output  x1,x2,x3,x4,cb_prgm_b_out;
input q1,q2,Rq1,Rq2,Cy1,Cy2,bit_in_CB,clk,reset,prgm_b,cb_prgm_b,cb_prgm_b_in;
inout G0,G1,G2,G3,G4,G5,G6,G7;





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

unidir_switch G0_x1(.port1(G0),.port2(x1),.enable(x1_G0));    unidir_switch G1_x1(.port1(G1),.port2(x1),.enable(x1_G1));  
                                                                             
unidir_switch G0_x2(.port1(G0),.port2(x2),.enable(x2_G0));    unidir_switch G1_x2(.port1(G1),.port2(x2),.enable(x2_G1));  
                                                                         
unidir_switch G0_x3(.port1(G0),.port2(x3),.enable(x3_G0));      unidir_switch G1_x3(.port1(G1),.port2(x3),.enable(x3_G1));  
                                                                         
unidir_switch G0_x4(.port1(G0),.port2(x4),.enable(x4_G0));    unidir_switch G1_x4(.port1(G1),.port2(x4),.enable(x4_G1));  
                                                                         
unidir_switch G0_q2(.port1(q2),.port2(G0),.enable(q2_G0));    unidir_switch G1_q2(.port1(q2),.port2(G1),.enable(q2_G1));  
                                                                            
unidir_switch G0_q1(.port1(q1),.port2(G0),.enable(q1_G0));    unidir_switch G1_q1(.port1(q1),.port2(G1),.enable(q1_G1));  

 

unidir_switch G2_x1(.port1(G2),.port2(x1),.enable(x1_G2));   unidir_switch G3_x1(.port1(G3),.port2(x1),.enable(x1_G3));
                                                                      
unidir_switch G2_x2(.port1(G2),.port2(x2),.enable(x2_G2));   unidir_switch G3_x2(.port1(G3),.port2(x2),.enable(x2_G3));
                                                                      
unidir_switch G2_x3(.port1(G2),.port2(x3),.enable(x3_G2));   unidir_switch G3_x3(.port1(G3),.port2(x3),.enable(x3_G3));
                                                                      
unidir_switch G2_x4(.port1(G2),.port2(x4),.enable(x4_G2));   unidir_switch G3_x4(.port1(G3),.port2(x4),.enable(x4_G3));
                                                                      
unidir_switch G2_q2(.port1(q2),.port2(G2),.enable(q2_G2));   unidir_switch G3_q2(.port1(q2),.port2(G3),.enable(q2_G3));
                                                                      
unidir_switch G2_q1(.port1(q1),.port2(G2),.enable(q1_G2));   unidir_switch G3_q1(.port1(q1),.port2(G3),.enable(q1_G3));



unidir_switch G4_x1(.port1(G4),.port2(x1),.enable(x1_G4));   unidir_switch G5_x1(.port1(G5),.port2(x1),.enable(x1_G5));  
                                                            
unidir_switch G4_x2(.port1(G4),.port2(x2),.enable(x2_G4));   unidir_switch G5_x2(.port1(G5),.port2(x2),.enable(x2_G5));  
                                                            
unidir_switch G4_x3(.port1(G4),.port2(x3),.enable(x3_G4));    unidir_switch G5_x3(.port1(G5),.port2(x3),.enable(x3_G5));  
                                                            
unidir_switch G4_x4(.port1(G4),.port2(x4),.enable(x4_G4));    unidir_switch G5_x4(.port1(G5),.port2(x4),.enable(x4_G5));  
                                                            
unidir_switch G4_q1(.port1(q1),.port2(G4),.enable(q1_G4));   unidir_switch G5_q1(.port1(q1),.port2(G5),.enable(q1_G5));  
                                                            
unidir_switch G4_q2(.port1(q2),.port2(G4),.enable(q2_G4));   unidir_switch G5_q2(.port1(q2),.port2(G5),.enable(q2_G5));  





unidir_switch G6_x1 (.port1(G6),.port2(x1),.enable(x1_G6));   unidir_switch G7_x1(.port1(G7),.port2(x1),.enable(x1_G7));
                                                                           
unidir_switch G6_x2 (.port1(G6),.port2(x2),.enable(x2_G6));   unidir_switch G7_x2(.port1(G7),.port2(x2),.enable(x2_G7));
                                                                           
unidir_switch G6_x3(.port1(G6),.port2(x3),.enable(x3_G6));  unidir_switch G7_x3(.port1(G7),.port2(x3),.enable(x3_G7));
                                                                           
unidir_switch G6_x4(.port1(G6),.port2(x4),.enable(x4_G6));  unidir_switch G7_x4(.port1(G7),.port2(x4),.enable(x4_G7));
                                                                           
unidir_switch G6_q1(.port1(q1),.port2(G6),.enable(q1_G6));  unidir_switch G7_q1(.port1(q1),.port2(G7),.enable(q1_G7));
                                                                           
unidir_switch G6_q2(.port1(q2),.port2(G6),.enable(q2_G6));  unidir_switch G7_q2(.port1(q2),.port2(G7),.enable(q2_G7));

 


endmodule

