
module IO_config_behav(bit_in,prgm_b,clk,reset,io_prgm_b,G0_S0,G1_S1,G2_S2,G3_S3,G4_S4,G5_S5,G6_S6,G7_S7,io_prgm_b_in,io_prgm_b_out);

input bit_in,prgm_b,io_prgm_b,io_prgm_b_in,clk,reset;

output reg io_prgm_b_out;

reg [4:0] count;



output reg [1:0]G0_S0;output reg [1:0]G1_S1;output reg [1:0]G2_S2;output reg [1:0]G3_S3;
output reg [1:0]G4_S4;output reg [1:0]G5_S5;output reg [1:0]G6_S6;output reg [1:0]G7_S7;
	
  initial begin

	count[4:0]=5'b00000;

	io_prgm_b_out=1'b0;

	G0_S0[1:0] <= 2'b00;	 G1_S1[1:0] <= 2'b00;    G2_S2[1:0] <= 2'b00;   G3_S3[1:0] <= 2'b00; 
	G4_S4[1:0] <= 2'b00;    G5_S5[1:0] <= 2'b00;   G6_S6[1:0] <= 2'b00;   G7_S7[1:0] <= 2'b00;

end



always @(posedge clk or posedge reset)

 begin

	if(prgm_b==1'b0 && io_prgm_b_in==1'b1 && io_prgm_b_out!=1'b1 && io_prgm_b==1'b1)	

	begin

	if(reset)

		io_prgm_b_out=1'b0;

		

	else begin

		count[4:0]=count[4:0]+1'b1; 

		if(count[4:0]==5'b10001)

		begin

			io_prgm_b_out= 1'b1;

			count[4:0]=5'b0000;

			
		end  //ends

	end //else ends

	end	 //first if ends



end //always block ends


	always @ (posedge clk or posedge reset)

	begin

	if (prgm_b==1'b0 && io_prgm_b_in==1'b1 && io_prgm_b_out!=1'b1 && io_prgm_b==1'b1) begin

	if(reset) begin

	G0_S0[1:0] <= 2'b00;	 G1_S1[1:0] <= 2'b00;    G2_S2[1:0] <= 2'b00;   G3_S3[1:0] <= 2'b00;   
	G4_S4[1:0] <= 2'b00;     G5_S5[1:0] <= 2'b00;    G6_S6[1:0] <= 2'b00;   G7_S7[1:0] <= 2'b00;

	


	end

	else begin

	G0_S0[1] <= bit_in  ;    G4_S4[1] <= G3_S3[0];
                             
	G0_S0[0] <= G0_S0[1];    G4_S4[0] <= G4_S4[1];
                             
	G1_S1[1] <= G0_S0[0];    G5_S5[1] <= G4_S4[0];
                             
	G1_S1[0] <= G1_S1[1];    G5_S5[0] <= G5_S5[1];
                             
	G2_S2[1] <= G1_S1[0];    G6_S6[1] <= G5_S5[0];
                             
	G2_S2[0] <= G2_S2[1];    G6_S6[0] <= G6_S6[1];
                             
	G3_S3[1] <= G2_S2[0];    G7_S7[1] <= G6_S6[0];
                             
	G3_S3[0] <= G3_S3[1];    G7_S7[0] <= G7_S7[1];


	end

  end
end

	

	endmodule

		
