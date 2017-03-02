from pyparsing import*
from modules import*
from fpga_dict import*
import sys
#ParserElement.setDefaultWhitespaceChars(' \t')

#what happens if an object has already been configured and you write to reconfigure it

i_consider_whitespaces_to_be_only = ' '
ParserElement.setDefaultWhitespaceChars(i_consider_whitespaces_to_be_only)
SBId=''
SBFace=''

class InputOutputClashError(Exception):
	def __init__(self,value):
		self.value=value
	def __str__(self):
		return repr(self.value)

def configureLUT(lutid,lutfunc,inp1,inp2,inp3,inp4,mux):
	s=str(lutid)
	lut.lutConfig(lutobjectDictionary[s],s,lutfunc,inp1,inp2,inp3,inp4,mux)

'''
def configureLUT(lutid,lutfunc,inp1,inp2,inp3,inp4,mux):
	s=str(lutid)
	lut.lutConfig(lutobjectDictionary[s],s,lutfunc,inp1,inp2,inp3,inp4,mux)
'''	


def checkFreeSBPort(SBId,SBFace):
	
	counter=0
	if(SBFace=='A'):
		print 'ooooooooooooooo'
		
		while(SBobjectDictionary[SBId].A[counter] !='X'):
			counter=counter+1
	elif(SBFace=='B'):
		while(SBobjectDictionary[SBId].B[counter] !='X'):
			counter=counter+1
	elif(SBFace=='C'):
		while(SBobjectDictionary[SBId].C[counter] !='X'):
			counter=counter+1
	else:
		while(SBobjectDictionary[SBId].D[counter] !='X'):
			counter=counter+1
	return counter

def FindNextSBPos(currentSBId,nextSBId):
	counterSB=0
	
	while(SB_connect[currentSBId][counterSB]!=SBobjectDictionary[nextSBId]):
		counterSB=counterSB+1
	
	return counterSB
	
def ConfNextSBPos(currentSBId,currentSBFace,nextSBId,fromSBPortIndex,route,route_len,count,freeport):
	
	while((count+1)<(route_len-1)):
		#freeport=ConfNextSBPos(route[count],route[count+1],fromSBPortIndex)
		#freeport=checkFreeSBPort(currentSBId,currentSBFace)
		nextSBId=route[count+1]	
		nextSBIndex=FindNextSBPos(route[count],route[count+1])
		if(nextSBIndex==0):
			freeport=checkFreeSBPort(currentSBId,'A')
			switchBlock.configSwitchBlock(SBobjectDictionary[currentSBId],currentSBId,currentSBFace,str(fromSBPortIndex),'A',str(freeport))
			fromSBPortIndex=freeport
			currentSBFace='C'
			currentSBId=nextSBId
			count=count+1
			ConfNextSBPos(currentSBId,currentSBFace,nextSBId,fromSBPortIndex,route,route_len,count,freeport)
		
		elif(nextSBIndex==1):
			freeport=checkFreeSBPort(currentSBId,'B')
			switchBlock.configSwitchBlock(SBobjectDictionary[currentSBId],currentSBId,currentSBFace,str(fromSBPortIndex),'B',str(freeport))
			fromSBPortIndex=freeport
			currentSBFace='D'
			currentSBId=nextSBId
			count=count+1
			ConfNextSBPos(currentSBId,currentSBFace,nextSBId,fromSBPortIndex,route,route_len,count,freeport)
		
		elif(nextSBIndex==2):
			freeport=checkFreeSBPort(currentSBId,'C')
			switchBlock.configSwitchBlock(SBobjectDictionary[currentSBId],currentSBId,currentSBFace,str(fromSBPortIndex),'C',str(freeport))
			fromSBPortIndex=freeport
			currentSBFace='A'
			currentSBId=nextSBId
			count=count+1
			ConfNextSBPos(currentSBId,currentSBFace,nextSBId,fromSBPortIndex,route,route_len,count,freeport)
		else:
			freeport=checkFreeSBPort(currentSBId,'D')
			switchBlock.configSwitchBlock(SBobjectDictionary[currentSBId],currentSBId,currentSBFace,str(fromSBPortIndex),'D',str(freeport))
			fromSBPortIndex=freeport
			currentSBFace='B'
			currentSBId=nextSBId
			count=count+1
			ConfNextSBPos(currentSBId,currentSBFace,nextSBId,fromSBPortIndex,route,route_len,count,freeport)
	currentport=freeport
	return {'currentport':currentport,'currentSBId':currentSBId,'currentSBFace':currentSBFace}			
			

def connectRoute(route,fromCB,toCB):
	s={}
	route_len= len(route)
	count=1
	if CB_connect[fromCB][1]==route[1]:
		SBId=CB_connect[fromCB][1]
		SBFace=CB_connect[fromCB][2]
		print SBId+'111'
		fromSBPortIndex=checkFreeSBPort(SBId,SBFace)
				
	elif CB_connect[fromCB][3]==route[1]:
		SBId=CB_connect[fromCB][3]
		SBFace=CB_connect[fromCB][4]
		print SBId
		fromSBPortIndex=checkFreeSBPort(SBId,SBFace)

	
	#CBobjectDictionary[fromCB].configCB(fromCB,'X','X','X','X',q1,q2)
	SBobjectDictionary[SBId].setFaceStatus(SBFace,fromSBPortIndex,'Q')
	'''
	while(count<(route_len-1)):
		freeport=ConfNextSBPos(route[count],route[count+1],fromSBPortIndex)
		fromSBPortIndex=freeport
			
		count=count+1
	'''
	print 'currentport currentSBId currentSBFace'
	switch_adj_toCB=ConfNextSBPos(SBId,SBFace,route[count+1],fromSBPortIndex,route,route_len,count,0)

	
	print switch_adj_toCB
	if CB_connect[toCB][1]==route[route_len-2]:
		SBId2=CB_connect[toCB][1]
		SBFace2=CB_connect[toCB][2]
		print SBId2+'111'
		toSBPortIndex=checkFreeSBPort(SBId2,SBFace2)
				
	elif CB_connect[toCB][3]==route[route_len-2]:
		SBId2=CB_connect[toCB][3]
		SBFace2=CB_connect[toCB][4]
		print SBId2
		toSBPortIndex=checkFreeSBPort(SBId2,SBFace2)

	switchBlock.configSwitchBlock(SBobjectDictionary[route[route_len-2]],route[route_len-2],switch_adj_toCB['currentSBFace'],str(switch_adj_toCB['currentport']),SBFace2,str(toSBPortIndex))
			
def find_shortest_path(graph, start, end, path=[]):	#finding route using backtracking
       	path = path + [start]
	#print path
        if start == end:
            	return path
        if not graph.has_key(start):
            	return None
        shortest = None
        for node in graph[start]:
            	if node not in path:
                	newpath = find_shortest_path(graph, node, end, path)
                	if newpath:
                    		if not shortest or len(newpath) < len(shortest):
                        		shortest = newpath
        return shortest	

def begins(cls):
	
	
	'''
	if(LUT_connect.get(cls.LUTID,0)):
		configureLUT(cls.LUTID,LUT_function[cls.function],LUT_interconnect[cls.op1],LUT_interconnect[cls.op2],LUT_interconnect[cls.op3],LUT_interconnect[cls.op4],
		cls.MUXswitch)
	'''
	if(LUT_connect.get(cls.LUTID,0)):
		if(LUT_connect.has_key(cls.op1) and (LUT_connect[cls.op1][0]!=LUT_connect[cls.LUTID][0])):
			fromCB=LUT_connect[cls.op1][1]
			fromCBCode=str(CB_connect[fromCB][0])
			print 'from name: %s code: %s'%(fromCB,fromCBCode)
			toCB=LUT_connect[cls.LUTID][1]
			toCBCode=str(CB_connect[toCB][0])
			print 'to name: %s code: %s'%(toCB,toCBCode)
			route=[]
			route=find_shortest_path(CB_SB_map,fromCBCode,toCBCode)
			connectRoute(route,fromCB,toCB)
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
			#route_len= len(route)
			print 'routing %s for %s'%(cls.op2,cls.LUTID)
		if(LUT_connect.has_key(cls.op3) and (LUT_connect[cls.op3][0]!=LUT_connect[cls.LUTID][0])):
			fromCB=LUT_connect[cls.op3][1]
			toCB=LUT_connect[cls.LUTID][1]
			fromCBCode=str(CB_connect[fromCB][0])
			toCBCode=str(CB_connect[toCB][0])
			route=[]
			route=find_shortest_path(CB_SB_map,fromCBCode,toCBCode)
			#route_len= len(route)
			print 'routing %s for %s'%(cls.op3,cls.LUTID)
		if(LUT_connect.has_key(cls.op4) and (LUT_connect[cls.op4][0]!=LUT_connect[cls.LUTID][0])):
			fromCB=LUT_connect[cls.op4][1]
			toCB=LUT_connect[cls.LUTID][1]
			fromCBCode=str(CB_connect[fromCB][0])
			toCBCode=str(CB_connect[toCB][0])
			route=[]
			route=find_shortest_path(CB_SB_map,fromCBCode,toCBCode)
			#route_len= len(route)
			print 'routing %s for %s'%(cls.op4,cls.LUTID)		
		
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

		if((cls.CB_q1==cls.CB_x1) | (cls.CB_q1==cls.CB_x2) | (cls.CB_q1==cls.CB_x3) | (cls.CB_q1==cls.CB_x4) | (cls.CB_q1==cls.CB_q2)):
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
CB_x1=(oneOf("G0 G1 G2 G3 G4 G5 G6 G7 X")).setResultsName('CB_x1')
CB_x2=(oneOf("G0 G1 G2 G3 G4 G5 G6 G7 X")).setResultsName('CB_x2')
CB_x3=(oneOf("G0 G1 G2 G3 G4 G5 G6 G7 X")).setResultsName('CB_x3')
CB_x4=(oneOf("G0 G1 G2 G3 G4 G5 G6 G7 X")).setResultsName('CB_x4')
CB_q1=(oneOf("G0 G1 G2 G3 G4 G5 G6 G7 X")).setResultsName('CB_q1')
CB_q2=(oneOf("G0 G1 G2 G3 G4 G5 G6 G7 X")).setResultsName('CB_q2')

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
print CBobjectDictionary['00'].printCBconfig()
print SBobjectDictionary['00'].A
print checkFreeSBPort('00','A')
print FindNextSBPos('00','01')
print ''
print ''

print CBobjectDictionary['03'].CBstate
print SBobjectDictionary['10'].A
print SBobjectDictionary['10'].B
print SBobjectDictionary['11'].D
print SBobjectDictionary['11'].C



'''
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
print lutobjectDictionary['Q02'].bits() 
print 'Q1 bits'
print lutobjectDictionary['Q00'].bits()
print 'Q7 bits'
print lutobjectDictionary['Q06'].bits() 
print 'Q8 bits'
print lutobjectDictionary['Q04'].bits()
print 'CB test'
print CBobjectDictionary['00'].printCBconfig()
print 'the new star'
print getting_SB_line_status('00','left','q1')	
'''
