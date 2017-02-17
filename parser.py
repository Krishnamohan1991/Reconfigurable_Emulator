from pyparsing import*

#ParserElement.setDefaultWhitespaceChars(' \t')

i_consider_whitespaces_to_be_only = ' '
ParserElement.setDefaultWhitespaceChars(i_consider_whitespaces_to_be_only)


x = oneOf("0 1 2 3")
y = oneOf("0 1 2 3")
state = oneOf("1 0 X")
CLB_code = oneOf("0 1 2 3")
face= oneOf("A B C D")
port  = oneOf("0 1 2 3 4 5 6 7")

input_port = oneOf("I0 I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15")
output_port = oneOf("Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8")
operand = input_port | output_port
op = oneOf("& | ^")
bopen=Literal("(").suppress()
bclose=Literal(")").suppress()
comma=Literal(",").suppress()
equal=Literal("=")
curlyop=Literal("[").suppress()
curlyclose=Literal("]").suppress()

coordinates=Group(bopen + x + comma + y + bclose).setResultsName('coordinates')

lut_rhs= Group(operand + comma + operand + comma + operand + comma + operand).setResultsName('rhs')
io_rhs= Group(state + comma + state + comma + state + comma + state + comma + state + comma + state + comma + state \
+ comma + state).setResultsName('io_port_config')
sb_rhs= Group(state + comma + state + comma + state + comma + state + comma + state + comma + state + comma + state \
+ comma + state).setResultsName('sb_port_config')

	
expression = output_port + equal + op + bopen + rhs + bclose | \
	     "IO" + bopen + x + comma + y + bclose + equal + curlyop + io_port_config + curlyclose | \
       	     "SB" + bopen + x + comma + y + bclose + equal + curlyop + sb_port_config + curlyclose

config=OneOrMore(expression)
#config = "CLB" + bopen + CLB_code('CLB_addr') + bclose + LineEnd + curlyop + config_body + curlyclose
#prgm = OneOrMore(config + LineEnd())
 

lut_table=[0 for i in range(256)]
counter=0


tests ="""\
IO(0,0)=[1,1,1,1,X,X,0,0]
SB(1,2)=[1,1,1,X,X,0,1,0]
Q1=&(I1,I2,I3,I4)
Q2=^(Q1,I3,I5,I6)
Q4=|(I5,I6,Q1,Q2)
""".splitlines()



for test in tests:
	bnf = Dict(OneOrMore(Group(config)))
	stats = bnf.parseString(test)
	counter+=1
	print stats

print counter
	




