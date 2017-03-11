from pyparsing import*
from modules import*
from fpga_dict import*
import sys
#ParserElement.setDefaultWhitespaceChars(' \t')

#what happens if an object has already been configured and you write to reconfigure it

i_consider_whitespaces_to_be_only = ' '
ParserElement.setDefaultWhitespaceChars(i_consider_whitespaces_to_be_only)


class InputOutputClashError(Exception):
	def __init__(self,value):
		self.value=value
	def __str__(self):
		return repr(self.value)

def configureLUT(lutid,lutfunc,inp1,inp2,inp3,inp4,mux):
	s=str(lutid)
	lut.lutConfig(lutobjectDictionary[s],s,lutfunc,inp1,inp2,inp3,inp4,mux)




def begins(cls):
	
	
	if(LUT_connect.get(cls.LUTID,0)):
		if(LUT_connect.has_key(cls.op1) and (LUT_connect[cls.op1][0]!=LUT_connect[cls.LUTID][0])): #check if the input and output LUTs belong to the same group or not
			fromCB=LUT_connect[cls.op1][1] #the CB from which the input signal is transmited
			fromCBCode=str(CB_connect[fromCB][0]) #the code of the CB from which the input signal is transmited
			print 'from name: %s code: %s'%(fromCB,fromCBCode)
			toCB=LUT_connect[cls.LUTID][1]  #CB at the output to which the output LUT is connected
			toCBCode=str(CB_connect[toCB][0])    #CB code at the output to which the output LUT is connected
			print 'to name: %s code: %s'%(toCB,toCBCode)
			route=[]
			route=find_shortest_path(CB_SB_map,fromCBCode,toCBCode) # calling function to find the shortest route
			connectRoute(route,fromCB,toCB,cls.op1,cls.LUTID) #calling function which connects the from CB to the target CB
			#connectRoute(route,route_len,fromCB,toCB)
			print 'routing %s for %s'%(cls.op1,cls.LUTID)
			print route
		if(LUT_connect.has_key(cls.op2) and (LUT_connect[cls.op2][0]!=LUT_connect[cls.LUTID][0])):	#look intro sort & heap sort
			fromCB=LUT_connect[cls.op2][1]
			fromCBCode=str(CB_connect[fromCB][0])
			toCB=LUT_connect[cls.LUTID][1]
			toCBCode=str(CB_connect[toCB][0])
			route=[]
			route=find_shortest_path(CB_SB_map,fromCBCode,toCBCode)
			connectRoute(route,fromCB,toCB,cls.op2,cls.LUTID)
			#route_len= len(route)
			print 'routing %s for %s'%(cls.op2,cls.LUTID)
			print route
		if(LUT_connect.has_key(cls.op3) and (LUT_connect[cls.op3][0]!=LUT_connect[cls.LUTID][0])):
			fromCB=LUT_connect[cls.op3][1]
			toCB=LUT_connect[cls.LUTID][1]
			fromCBCode=str(CB_connect[fromCB][0])
			toCBCode=str(CB_connect[toCB][0])
			route=[]
			route=find_shortest_path(CB_SB_map,fromCBCode,toCBCode)
			connectRoute(route,fromCB,toCB,cls.op3,cls.LUTID)
			#route_len= len(route)
			print 'routing %s for %s'%(cls.op3,cls.LUTID)
			print route
		if(LUT_connect.has_key(cls.op4) and (LUT_connect[cls.op4][0]!=LUT_connect[cls.LUTID][0])):
			fromCB=LUT_connect[cls.op4][1]
			toCB=LUT_connect[cls.LUTID][1]
			fromCBCode=str(CB_connect[fromCB][0])
			toCBCode=str(CB_connect[toCB][0])
			route=[]
			route=find_shortest_path(CB_SB_map,fromCBCode,toCBCode)
			connectRoute(route,fromCB,toCB,cls.op4,cls.LUTID)
			#route_len= len(route)
			print 'routing %s for %s'%(cls.op4,cls.LUTID)
			print route
		
		configureLUT(cls.LUTID,LUT_function[cls.function],LUT_interconnect[cls.op1],LUT_interconnect[cls.op2],LUT_interconnect[cls.op3],LUT_interconnect[cls.op4],
		cls.MUXswitch)

		

	elif cls[0]=="SB":
		toFace=cls.toFace
		fromFace=cls.fromFace
		switchid=str(cls.switchID1+cls.switchID2)
		
		switchBlock.configSwitchBlock(SBobjectDictionary[switchid],switchid,fromFace,cls.fromFaceIndex,toFace,cls.toFaceIndex)

	elif cls[0]=='IO':
		IOBlocks.configIO(IOobjectDictionary[cls.IOId],cls.IOId,cls.SBport0,cls.SBport1,cls.SBport2,cls.SBport3,cls.SBport4,cls.SBport5,cls.SBport6,cls.SBport7)
	
	elif cls[0]=='CB':

		if(((cls.CB_q1==cls.CB_x1) | (cls.CB_q1==cls.CB_x2) | (cls.CB_q1==cls.CB_x3) | (cls.CB_q1==cls.CB_x4) | (cls.CB_q1==cls.CB_q2) and (cls.CB_q1!='X'))):#put inside config
			try:
				raise InputOutputClashError(-999)
				
			except InputOutputClashError as e:
				print 'EXCEPTION OCCURRED : output of CB connected to input line or two output lines of CB are connected to the same input line: ',e.value
				sys.exit(1)
				
		else:
			
			connectionBlock.configCB(CBobjectDictionary[cls.CBId],cls.CBId,cls.CB_x1,cls.CB_x2,cls.CB_x3,cls.CB_x4,cls.CB_q1,cls.CB_q2)
			

	return 1



input_port = (oneOf("I0 I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15 Q00 Q01 Q02 Q03 Q04 Q05 Q06 Q07 Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q30 Q31 Q32 Q33 Q34 Q35 Q36 Q37")).setResultsName('InputLine')

#inputLines=(oneOf("I0 I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15")).setResultsName('onlyInput')
output_port = (oneOf("Q00 Q01 Q02 Q03 Q04 Q05 Q06 Q07 Q10 Q11 Q12 Q13 Q14 Q15 Q16 Q17 Q20 Q21 Q22 Q23 Q24 Q25 Q26 Q27 Q30 Q31 Q32 Q33 Q34 Q35 Q36 Q37")).setResultsName('LUTID')
#operand= input_port | output_port


operand1 = (input_port | output_port).setResultsName('op1')
operand2 = (input_port | output_port).setResultsName('op2')
operand3 = (input_port | output_port).setResultsName('op3')
operand4 = (input_port | output_port).setResultsName('op4')
op = (oneOf("AND OR XOR")).setResultsName('function')

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
CB_x1=(oneOf("0 1 2 3 4 5 6 7 X")).setResultsName('CB_x1')
CB_x2=(oneOf("0 1 2 3 4 5 6 7 X")).setResultsName('CB_x2')
CB_x3=(oneOf("0 1 2 3 4 5 6 7 X")).setResultsName('CB_x3')
CB_x4=(oneOf("0 1 2 3 4 5 6 7 X")).setResultsName('CB_x4')
CB_q1=(oneOf("0 1 2 3 4 5 6 7 X")).setResultsName('CB_q1')
CB_q2=(oneOf("0 1 2 3 4 5 6 7 X")).setResultsName('CB_q2')

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


print 'Q7 bits'
print lutobjectDictionary['Q06'].bits()


print SBobjectDictionary['00'].switchDict['A0B0']
print SBobjectDictionary['00'].switchDict['A1B1']
print SBobjectDictionary['00'].switchDict['A2B2']
print SBobjectDictionary['00'].switchDict['A3B3']
print SBobjectDictionary['00'].switchDict['A4B4']
print SBobjectDictionary['00'].B
print SBobjectDictionary['01'].D
print SBobjectDictionary['01'].switchDict['B0D5']
print SBobjectDictionary['01'].B
print SBobjectDictionary['02'].D
print 'CBConfig'
print CBobjectDictionary['00'].printCBconfig()

print 'origin LUT status Q01'
print lutobjectDictionary['Q01'].status
print 'origin CB03 status and state'
print CBobjectDictionary['03'].status
print CBobjectDictionary['03'].CBstate

print 'face A of SB10 and face B of SB10'
print SBobjectDictionary['10'].A
print SBobjectDictionary['10'].B
print 'face D of SB11 and face C of SB11'
print SBobjectDictionary['11'].D
print SBobjectDictionary['11'].C

print 'target CB23 status and state'
print CBobjectDictionary['23'].status
print CBobjectDictionary['23'].CBstate

print 'Q21 bits'
print lutobjectDictionary['Q21'].bits()
print lutobjectDictionary['Q21'].inputPort1
