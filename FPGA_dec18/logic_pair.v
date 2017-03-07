module logic_pair(x1,x2,x3,x4,look_up_t,clk,reset,prgm_b,CLB_prgm_b,switch,out);
input x1,x2,x3,x4,CLB_prgm_b;
reg [3:0] inp;
input [15:0] look_up_t;
//input sel;
input clk,reset,prgm_b,switch;
output out;
wire out_lut, out_ff;
//output wire bit_out;
//wire [15:0] look_up_t;  //look up table'



LU L1(.in1(look_up_t), .x1(x1),.x2(x2),.x3(x3),.x4(x4), .out2(out_lut),.prgm_b(prgm_b),.CLB_prgm_b(CLB_prgm_b));
syn_D_FF FF1(.data_in(out_lut),.clk(clk),.reset(reset),.data_out(out_ff));
MUX_FF_LUT FF_LUT(.lut(out_lut),.ff(out_ff),.sel(switch),.out(out));

endmodule