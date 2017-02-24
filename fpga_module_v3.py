from pyparsing import*
from modules import*
from fpga_dict import*
#ParserElement.setDefaultWhitespaceChars(' \t')



i_consider_whitespaces_to_be_only = ' '
ParserElement.setDefaultWhitespaceChars(i_consider_whitespaces_to_be_only)

def configureLUT(lutid,lutfunc,inp1,inp2,inp3,inp4,mux):
	s=str(lutid)
	lut.lutConfig(lutobjectDictionary[s],s,lutfunc,inp1,inp2,inp3,inp4,mux)

'''
def configureLUT(lutid,lutfunc,inp1,inp2,inp3,inp4,mux):
	s=str(lutid)
	lut.lutConfig(lutobjectDictionary[s],s,lutfunc,inp1,inp2,inp3,inp4,mux)
'''	
	
def begins(cls):

	print cls
	
	if(LUT_connect.get(cls.LUTID,0)):
		configureLUT(cls.LUTID,LUT_function[cls.function],LUT_interconnect[cls.op1],LUT_interconnect[cls.op2],LUT_interconnect[cls.op3],LUT_interconnect[cls.op4],
		cls.MUXswitch)

		

	elif cls[0]=="SB":
		toFace=cls.toFace
		fromFace=cls.fromFace
		switchid=str(cls.switchID1+cls.switchID2)
		
		switchBlock.configSwitchBlock(SBobjectDictionary[switchid],switchid,fromFace,cls.fromFaceIndex,toFace,cls.toFaceIndex)

	elif cls[0]=='IO':
		IOBlocks.configIO(IOobjectDictionary[cls.IOId],cls.IOId,cls.SBport0,cls.SBport1,cls.SBport2,cls.SBport3,cls.SBport4,cls.SBport5,cls.SBport6,cls.SBport7)

	return 1



input_port = (oneOf("I0 I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15 Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q28  Q29 Q30 Q31 Q32")).setResultsName('InputLine')

#inputLines=(oneOf("I0 I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15")).setResultsName('onlyInput')
output_port = (oneOf("Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q18 Q19 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q28 Q29 Q30 Q31 Q32")).setResultsName('LUTID')
#operand= input_port | output_port


operand1 = (input_port | output_port).setResultsName('op1')
operand2 = (input_port | output_port).setResultsName('op2')
operand3 = (input_port | output_port).setResultsName('op3')
operand4 = (input_port | output_port).setResultsName('op4')
op = (oneOf("& | ^")).setResultsName('function')

switchId1 = (oneOf("0 1 2")).setResultsName('switchID1')
switchId2 = (oneOf("0 1 2")).setResultsName('switchID2')
fromFace=(oneOf("A B C D")).setResultsName('fromFace')
toFace=(oneOf("A B C D")).setResultsName('toFace')
toFaceIndex=(oneOf("0 1 2 3 4 5 6 7")).setResultsName('toFaceIndex')
fromFaceIndex=(oneOf("0 1 2 3 4 5 6 7")).setResultsName('fromFaceIndex')

bopen=Literal("(").suppress()
bclose=Literal(")").suppress()
comma=Literal(",").suppress()
sqopen=Literal("[").suppress()
sqclose=Literal("]").suppress()
equal=Literal("=").suppress()
MUXswitch=(oneOf("1 0")).setResultsName('MUXswitch')

SBport0 = (oneOf("X I O")).setResultsName('SBport0')
SBport1 = (oneOf("X I O")).setResultsName('SBport1') 
SBport2 = (oneOf("X I O")).setResultsName('SBport2') 
SBport3 = (oneOf("X I O")).setResultsName('SBport3') 
SBport4 = (oneOf("X I O")).setResultsName('SBport4') 
SBport5 = (oneOf("X I O")).setResultsName('SBport5') 
SBport6 = (oneOf("X I O")).setResultsName('SBport6') 
SBport7 = (oneOf("X I O")).setResultsName('SBport7')
IOId = (oneOf("00 01 02 10 11 20 21 30 31 40 41 42")).setResultsName('IOId')

CBId=(oneOf("00 01 02 03 10 11 12 13 20 21 22 23 30 31 32 33")).setResultsName('CBId')
CB_x1=(oneOf("G0 G1 G2 G3 G4 G5 G6 G7")).setResultsName('CB_x1')
CB_x2=(oneOf("G0 G1 G2 G3 G4 G5 G6 G7")).setResultsName('CB_x2')
CB_x3=(oneOf("G0 G1 G2 G3 G4 G5 G6 G7")).setResultsName('CB_x3')
CB_x4=(oneOf("G0 G1 G2 G3 G4 G5 G6 G7")).setResultsName('CB_x4')
CB_q1=(oneOf("G0 G1 G2 G3 G4 G5 G6 G7")).setResultsName('CB_q1')
CB_q2=(oneOf("G0 G1 G2 G3 G4 G5 G6 G7")).setResultsName('CB_q2')

#config_code=(oneOf('IO' 'SB' 'CB')).setResultsName('configCode')

config_code=(oneOf("IO SB CB")).setResultsName('configCode')


lut_rhs= operand1 + comma + operand2 + comma + operand3 + comma + operand4

#lut_rhs= operand + comma + operand + comma + operand + comma + operand
io_rhs= SBport0 + comma + SBport1 + comma + SBport2 + comma + SBport3 + comma + SBport4 + comma + SBport5 + comma + SBport6 + comma + SBport7
cb_rhs= CB_x1 + comma + CB_x2 + comma + CB_x3 + comma + CB_x4 + comma + CB_q1 + comma + CB_q2
	
expression = output_port + equal + op + bopen + lut_rhs + bclose + sqopen + MUXswitch + sqclose | \
             config_code + bopen + switchId1 + switchId2 + bclose + equal + bopen + fromFace + fromFaceIndex + comma + toFace + toFaceIndex + bclose | \
	     config_code + bopen + IOId + bclose + equal + sqopen + io_rhs + sqclose | \
	     config_code + bopen + CBId + bclose + equal + sqopen + cb_rhs + sqclose


config=OneOrMore(expression)


counter=0

tests=open("new_data.txt","r")
scr=tests.read()

scr_split=scr.splitlines()

#print scr_split

#tests ="""\
#Q1=&(I1,I2,I3,I4)[1]
#Q2=^(Q1,I3,I5,I6)[0]
#SB(00)=(A0,B0)
#IO(00)=[I,I,O,O,O,O,X,X]
#""".splitlines()





for test in scr_split:
	stats = config.parseString(test)
	#print stats
	begins(stats)
	
#print stats.dump()
#counter+=1
	
tests.close()


#print lutobjectDictionary['Q7'].status
#print lutobjectDictionary['Q1'].status
slk= ["0","1","2","3","4","5","6","7"]
print IOobjectDictionary['00'].ioConf
m=''
for i in slk:
	s= IOobjectDictionary['00'].ioDict[i]
	m=m+s
print 'IO bits are'
print m
print 'SB set bits'
print SBobjectDictionary['00'].A
print SBobjectDictionary['00'].B

print SBobjectDictionary['00'].switchDict['A0B1']

#print lutobjectDictionary['Q7'].outputPort
print 'Q3 bits'
print lutobjectDictionary['Q3'].bits() 
print 'Q1 bits'
print lutobjectDictionary['Q1'].bits()
print 'Q7 bits'
print lutobjectDictionary['Q7'].bits() 
print 'Q8 bits'
print lutobjectDictionary['Q5'].bits()
