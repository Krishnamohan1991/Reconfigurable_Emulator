module hope(switch,a,b);
parameter d=0;
parameter e=1;
//parameter switch=1;

inout a,b;
input switch;

generate
initial
case(switch)

0:  connect #(d) m1(.in(a),.out(b),.enable(1'b1));
1:  connect #(e) m2(.in(b),.out(a),.enable(1'b1));

endcase

end

endgenerate


endmodule


