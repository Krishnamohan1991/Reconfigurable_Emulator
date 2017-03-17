
module IO_block(bit_in,clk,reset,prgm_b,io_prgm_b,io_prgm_b_in,io_prgm_b_out,G0,G1,G2,G3,G4,G5,G6,G7,S0,S1,S2,S3,S4,S5,S6,S7);



inout G0,G1,G2,G3,G4,G5,G6,G7,S0,S1,S2,S3,S4,S5,S6,S7;



output io_prgm_b_out;



input bit_in,prgm_b,io_prgm_b,io_prgm_b_in,clk,reset;




 wire [1:0]G0_S0; wire [1:0]G5_S5; 
              
 wire [1:0]G1_S1; wire [1:0]G6_S6; 
              
 wire [1:0]G2_S2; wire [1:0]G7_S7; 
              
 wire [1:0]G3_S3; 
              
 wire [1:0]G4_S4;



IO_config_behav IO_config(.bit_in(bit_in),.prgm_b(prgm_b),.io_prgm_b(io_prgm_b),.clk(clk),.reset(reset),.io_prgm_b_in(io_prgm_b_in),.io_prgm_b_out(io_prgm_b_out),

.G0_S0(G0_S0),.G1_S1(G1_S1),.G2_S2(G2_S2),.G3_S3(G3_S3),.G4_S4(G4_S4),.G5_S5(G5_S5),.G6_S6(G6_S6),.G7_S7(G7_S7));



bidir_switch SA1(.port1(G0),.port2(S0),.enable_dir(G0_S0));	  bidir_switch SA5(.port1(G4),.port2(S4),.enable_dir(G4_S4));
                                                                                                                     
bidir_switch SA2(.port1(G1),.port2(S1),.enable_dir(G1_S1));       bidir_switch SA6(.port1(G5),.port2(S5),.enable_dir(G5_S5));
                                                                                                                     
bidir_switch SA3(.port1(G2),.port2(S2),.enable_dir(G2_S2));       bidir_switch SA7(.port1(G6),.port2(S6),.enable_dir(G6_S6));
                                                                                                                     
bidir_switch SA4(.port1(G3),.port2(S3),.enable_dir(G3_S3));       bidir_switch SA8(.port1(G7),.port2(S7),.enable_dir(G7_S7));



endmodule
