from pyparsing import*
from modules import*
from fpga_dict import*
#ParserElement.setDefaultWhitespaceChars(' \t')



i_consider_whitespaces_to_be_only = ' '
ParserElement.setDefaultWhitespaceChars(i_consider_whitespaces_to_be_only)

def configureLUT(lutid,lutfunc,inp1,inp2,inp3,inp4,mux):
	s=str(lutid)
	#print lutobjectDictionary[s]
	
	lut.lutConfig(lutobjectDictionary[s],s,lutfunc,inp1,inp2,inp3,inp4,mux)
	#print lut.bits(lutobjectDictionary[s])
	
	
	#print Q1.lutTable
	#print Q2.lutTable
	#print lutObject
	#lutObject.lutTable=lutfunc
	#print lutObject.lutTable
	#lutObject.muxSwitch=mux
	#print lutObject.muxSwitch
	#lutObject.outputPort=lutid
	#print lutObject.outputPort
	#lutObject.inputPort1=inp1
	#lutObject.inputPort2=inp2
	#lutObject.inputPort3=inp3
	#lutObject.inputPort4=inp4
	
def begins(cls):

	
	if(LUT_connect.get(cls.LUTID,0)):
		configureLUT(cls.LUTID,LUT_function[cls.function],LUT_interconnect[cls.op1],LUT_interconnect[cls.op2],LUT_interconnect[cls.op3],LUT_interconnect[cls.op4],
		cls.MUXswitch)
	
	'''	

	if (cls.LUTID=='Q1' or cls.LUTID=='Q2' or cls.LUTID=='Q3' or cls.LUTID=='Q4' or cls.LUTID=='Q5' or 
	   cls.LUTID=='Q6' or cls.LUTID=='Q7' or cls.LUTID=='Q8' or cls.LUTID=='Q9' or cls.LUTID=='Q10' or cls.LUTID=='Q11'
	   or cls.LUTID=='Q12' or cls.LUTID=='Q13' or cls.LUTID=='Q14' or cls.LUTID=='Q15' or cls.LUTID=='Q16' or cls.LUTID=='Q17' 
	   or  cls.LUTID=='Q18' or cls.LUTID=='Q19' or cls.LUTID=='Q20' or cls.LUTID=='Q21' or cls.LUTID=='Q22' or cls.LUTID=='Q23' 
	   or cls.LUTID=='Q24' or cls.LUTID=='Q25' or cls.LUTID=='Q26' or cls.LUTID=='Q27' or cls.LUTID=='Q28' or cls.LUTID=='Q29' 
	   or  cls.LUTID=='Q30' or cls.LUTID=='Q31' or     cls.LUTID=='Q32') :
		configureLUT(cls.LUTID,LUT_function[cls.function],LUT_interconnect[cls.op1],LUT_interconnect[cls.op2],LUT_interconnect[cls.op3],LUT_interconnect[cls.op4],
		cls.MUXswitch)
	'''
			
		
	
	return 1

input_port = (oneOf("I0 I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15 Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q28 Q29 Q30 Q31 Q32")).setResultsName('InputLine')

#inputLines=(oneOf("I0 I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15")).setResultsName('onlyInput')
output_port = (oneOf("Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q28 Q29 Q30 Q31 Q32")).setResultsName('LUTID')
#operand= input_port | output_port

operand1 = (input_port | output_port).setResultsName('op1')
operand2 = (input_port | output_port).setResultsName('op2')
operand3 = (input_port | output_port).setResultsName('op3')
operand4 = (input_port | output_port).setResultsName('op4')
op = (oneOf("& | ^")).setResultsName('function')

switchId = (oneOf("00 01 02 10 11 12 20 21 22")).setResultsName('switchID')
fromFace=(oneOf("A B C D")).setResultsName('fromFace')
toFace=(oneOf("A B C D")).setResultsName('toFace')
faceIndex=(oneOf("0 1 2 3 4 5 6 7")).setResultsName('faceIndex')

bopen=Literal("(").suppress()
bclose=Literal(")").suppress()
comma=Literal(",").suppress()
sqopen=Literal("[").suppress()
sqclose=Literal("]").suppress()
equal=Literal("=").suppress()
MUXswitch=(oneOf("1 0")).setResultsName('MUXswitch')
config_code=(oneOf('IO' 'SB' 'CB')).setResultsName('configCode')

#config_code=(oneOf('IO' 'SB' 'CB')).setResultsName('configCode')


lut_rhs= operand1 + comma + operand2 + comma + operand3 + comma + operand4

#lut_rhs= operand + comma + operand + comma + operand + comma + operand

	
expression = output_port + equal + op + bopen + lut_rhs + bclose + sqopen + MUXswitch + sqclose  | \
		config_code + switchId + bopen + fromFace + faceIndex + comma + toFace + faceIndex + bclose
config=OneOrMore(expression)


counter=0

tests=open("data.txt","r")
scr=tests.read()

scr_split=scr.splitlines()
#print scr_split

#tests ="""\
#Q1=&(I1,I2,I3,I4)[1]
#Q2=^(Q1,I3,I5,I6)[0]
#""".splitlines()





for test in scr_split:
	stats = config.parseString(test)
	#print stats
	begins(stats)
	
#print stats.dump()
#	counter+=1
	
tests.close()

print lutobjectDictionary['Q7'].status
print lutobjectDictionary['Q1'].status

print lutobjectDictionary['Q7'].outputPort
print lutobjectDictionary['Q3'].bits() 
print lutobjectDictionary['Q1'].bits()
print lutobjectDictionary['Q7'].bits() 
print lutobjectDictionary['Q5'].bits()
    #print name

#print Q1.bits()
#print Q2.bits()
#print Q2.lutTable
#print Q3.lutTable
#print counter
	
