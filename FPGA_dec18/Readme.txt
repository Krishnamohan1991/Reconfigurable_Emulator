Commands to run the verilog code

Open cmd prompt in the folder location and run the following commands

1) iverilog -o test.vvp -c new_design.txt  --> creates a vvp file named 'test.vvp'
2) vvp test.vvp  --> execute the vvp file ehich creates a .vcd file named 'test.vcd'
3) gtkwave test.vcd --> use gtkwave to monitor the signals from each module based on the inputs 
			specified in the test bench

___________________________________________________________________

*clk - Clock sigal
*prgm_b - Programming bits signals. Its an active low signal that goes from high to low when CLB configuration starts
		After configuration the signal goes back to being high

*IQ1 to IQ8 - Output from the 8 LUT slices whithin the CLB
*I1 to I18  - Input lines to a CLB

* The interconnect unit inside the CLB has 26 input lines ([I1 to I18] + [IQ1 to IQ8]) which can be connected to any of the 32 output lines(Eight 4-input LUT) 

****Modules Involved in Each CLB*****

*Logic Pair - 				A 4-LUT connected to a synchronous D-Flip Flop

*look_up_table_interconnect_config - 	The module contains a shift register that is 37 bits long(configuration bit for a single Logic Pair).
					Last 16 bits configures the look up table
					17th bit  configues the 2X1 Mux switch to choose from either direct LUT output or the output of the D-Flip flop
					The first 20 bits are divided into four groups of  5-bits and they form the select bits which tell the 
						'interconnect_unit'module to connect one among the 26 input lines of interconnect unit([I1 to I18] + [IQ1 to IQ8])
						 to a certain input line of a LUT (x1,x2,x3,x4)

*'interconnect_unit' - 			Connects the LUT input line to one of the 26 input lines of the interconnect unit([I1 to I18] + [IQ1 to IQ8])
					based on the configuration bits

*LU 	-				Represents the 4-LUT as a 16 bit multiplexer

*syn_D_FF -				D-Flip flop associated with each LUT Logic pair

*MUX_FF_LUT - 				Multiplxer which connects th output of 'LU' and  'syn_D_FF'. Config bit 17 sets the select line  for this MUX.
					0 - Output of LUT
					1 - Output of D- Flip Flop



