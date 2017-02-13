from pyparsing import Word, Group, Combine, Suppress, OneOrMore, alphas, nums,\
alphanums, stringEnd, ParseException, oneOf, Literal, ParserElement, LineEnd

#ParserElement.setDefaultWhitespaceChars(' \t')

i_consider_whitespaces_to_be_only = ' '
ParserElement.setDefaultWhitespaceChars(i_consider_whitespaces_to_be_only)


state = oneOf("0 1")
CLB_code = oneOf("0 1 2 3")
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
rhs= Group(operand + comma + operand + comma + operand + comma + operand).setResultsName('rhs')
expression = output_port + equal + op + bopen + rhs + bclose
config_body = OneOrMore(expression)
#config = "CLB" + bopen + CLB_code('CLB_addr') + bclose + LineEnd + curlyop + config_body + curlyclose
#prgm = OneOrMore(config + LineEnd())
 

lut_table=[0 for i in range(256)]
counter=0


tests ="""\
Q1=&(I1,I2,I3,I4)
Q2=^(Q1,I3,I5,I6)
Q4=|(I5,I6,Q1,Q2)
""".splitlines()


for test in tests:
	stats = config_body.parseString(test)
	counter+=1
	print stats.asList()

print counter
	
i=0
while(i<4):
	print stats[i]
	i=i+1




