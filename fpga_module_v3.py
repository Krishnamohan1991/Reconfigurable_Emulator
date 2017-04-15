from pyparsing import*
from modules import*
from fpga_dict import*
import sys
#ParserElement.setDefaultWhitespaceChars(' \t')

#what happens if an object has already been configured and you write to reconfigure it

i_consider_whitespaces_to_be_only = ' '
ParserElement.setDefaultWhitespaceChars(i_consider_whitespaces_to_be_only)

LUTId=''
class InputOutputClashError(Exception):
	def __init__(self,value):
		self.value=value
	def __str__(self):
		return repr(self.value)

def configureLUT(lutid,lutfunc,inp1,inp2,inp3,inp4,mux):
	LUT_ID=str(lutid)
	lutobjectDictionary[LUT_ID].lutConfig(LUT_ID,lutfunc,inp1,inp2,inp3,inp4,mux)




def begins(cls):
	
	if(LUT_connect.get(cls.LUTID,0)):
		#LUTId=cls.LUTID
		op1=cls.op1
		op2=cls.op2
		op3=cls.op3
		op4=cls.op4
		target_CB=LUT_connect[cls.LUTID][1] #its the ID of the connection block to which the currently programmed LUT is connected to
		if(LUT_connect.has_key(cls.op1) and (LUT_connect[cls.op1][0]!=LUT_connect[cls.LUTID][0])): #check if the input and output LUTs belong to the same group or not
			print "INPUT 1"			
			fromCB=LUT_connect[cls.op1][1] #the CB from which the input signal is transmited
			fromCBCode=str(CB_connect[fromCB][0]) #the global code of the CB from which the input signal to be routed originates
			print 'from name: %s code: %s'%(fromCB,fromCBCode)
			toCB=LUT_connect[cls.LUTID][1]  #CB at the output to which the output LUT is connected
			print "LUTID= %s to CB= %s "%(cls.LUTID,toCB)
			toCBCode=str(CB_connect[toCB][0])    #CB code at the output to which the output LUT is connected
			print 'to name: %s code: %s'%(toCB,toCBCode)
			op=find_signal_CLB(cls.LUTID,cls.op1)
			if(op==999):
				route=[]
				route=find_shortest_path(CB_SB_map,fromCBCode,toCBCode) # calling function to find the shortest route
				target_CB_port=routing(route,fromCB,fromCBCode,toCB,toCBCode,cls.op1,cls.LUTID)
			#last_SB_to_CB=connectRoute(route,fromCB,toCB,cls.op1,cls.LUTID) #calling function which connects the from CB to the target CB
			#target_CB_port=conf_lastSB(last_SB_to_CB['currentSBId'],last_SB_to_CB['currentSBFace'],last_SB_to_CB['currentport'],toCB,route,cls.LUTID)
				if(target_CB_port!=999):
					op1=CB_input_output_connect[target_CB][target_CB_port]
					for key in CLB_INDEX_TO_INPUT.keys():
						if (CLB_INDEX_TO_INPUT[key]==op1):
							CLB_INP_STATS[LUT_connect[cls.LUTID][0]][int(key)]=cls.op1
				else:
					print 'No target CB port available'
			#connectRoute(route,route_len,fromCB,toCB)
				print 'routing %s for %s input1'%(cls.op1,cls.LUTID)
				print route
			else:
				#op1=CLB_INDEX_TO_INPUT[str(op)]
				op1=op
		if(LUT_connect.has_key(cls.op2) and (LUT_connect[cls.op2][0]!=LUT_connect[cls.LUTID][0])):	#look intro sort & heap sort
			print "INPUT 2"
			fromCB=LUT_connect[cls.op2][1]
			fromCBCode=str(CB_connect[fromCB][0])
			toCB=LUT_connect[cls.LUTID][1]
			toCBCode=str(CB_connect[toCB][0])
			print 'from name: %s code: %s'%(fromCB,fromCBCode)
			print "LUTID= %s to CB= %s "%(cls.LUTID,toCB)
			print 'to name: %s code: %s'%(toCB,toCBCode)
			op=find_signal_CLB(cls.LUTID,cls.op2)
			if(op==999):
				route=[]
				route=find_shortest_path(CB_SB_map,fromCBCode,toCBCode)
			#last_SB_to_CB=connectRoute(route,fromCB,toCB,cls.op2,cls.LUTID) #calling function which connects the from CB to the target CB
			#target_CB_port=conf_lastSB(last_SB_to_CB['currentSBId'],last_SB_to_CB['currentSBFace'],last_SB_to_CB['currentport'],toCB,route,cls.LUTID)
				target_CB_port=routing(route,fromCB,fromCBCode,toCB,toCBCode,cls.op2,cls.LUTID)
				if(target_CB_port!=999):
					op2=CB_input_output_connect[target_CB][target_CB_port]
					for key in CLB_INDEX_TO_INPUT.keys():
						if (CLB_INDEX_TO_INPUT[key]==op2):
							CLB_INP_STATS[LUT_connect[cls.LUTID][0]][int(key)]=cls.op2
				else:
					print 'No target CB port available'
				#print "oppppp2 %s"%op2
			#route_len= len(route)
				print 'routing %s for %s input2'%(cls.op2,cls.LUTID)
				print route
			else:
				#op2=CLB_INDEX_TO_INPUT[str(op)]
				op2=op
		if(LUT_connect.has_key(cls.op3) and (LUT_connect[cls.op3][0]!=LUT_connect[cls.LUTID][0])):
			print "INPUT 3"
			fromCB=LUT_connect[cls.op3][1]
			toCB=LUT_connect[cls.LUTID][1]
			fromCBCode=str(CB_connect[fromCB][0])
			toCBCode=str(CB_connect[toCB][0])
			op=find_signal_CLB(cls.LUTID,cls.op3)
			print 'from name: %s code: %s'%(fromCB,fromCBCode)
			print "LUTID= %s to CB= %s "%(cls.LUTID,toCB)
			print 'to name: %s code: %s'%(toCB,toCBCode)
			if(op==999):
				route=[]
				route=find_shortest_path(CB_SB_map,fromCBCode,toCBCode)
			#last_SB_to_CB=connectRoute(route,fromCB,toCB,cls.op3,cls.LUTID) #calling function which connects the from CB to the target CB
			#target_CB_port=conf_lastSB(last_SB_to_CB['currentSBId'],last_SB_to_CB['currentSBFace'],last_SB_to_CB['currentport'],toCB,route,cls.LUTID)
				target_CB_port=routing(route,fromCB,fromCBCode,toCB,toCBCode,cls.op3,cls.LUTID)
				if(target_CB_port!=999):
					op3=CB_input_output_connect[target_CB][target_CB_port]
					for key in CLB_INDEX_TO_INPUT.keys():
						if (CLB_INDEX_TO_INPUT[key]==op3):
							CLB_INP_STATS[LUT_connect[cls.LUTID][0]][int(key)]=cls.op3
				else:
					print 'No target CB port available'
			#route_len= len(route)
				print 'routing %s for %s input3'%(cls.op3,cls.LUTID)
				print route
			else:
				#op3=CLB_INDEX_TO_INPUT[str(op)]
				op3=op
		if(LUT_connect.has_key(cls.op4) and (LUT_connect[cls.op4][0]!=LUT_connect[cls.LUTID][0])):
			print "INPUT 4"
			fromCB=LUT_connect[cls.op4][1]
			toCB=LUT_connect[cls.LUTID][1]
			fromCBCode=str(CB_connect[fromCB][0])
			toCBCode=str(CB_connect[toCB][0])
			print 'from name: %s code: %s'%(fromCB,fromCBCode)
			print "LUTID= %s to CB= %s "%(cls.LUTID,toCB)
			print 'to name: %s code: %s'%(toCB,toCBCode)
			op=find_signal_CLB(cls.LUTID,cls.op4)
			if(op==999):
				route=[]
				route=find_shortest_path(CB_SB_map,fromCBCode,toCBCode)
			#last_SB_to_CB=connectRoute(route,fromCB,toCB,cls.op4,cls.LUTID) #calling function which connects the from CB to the target CB
			#target_CB_port=conf_lastSB(last_SB_to_CB['currentSBId'],last_SB_to_CB['currentSBFace'],last_SB_to_CB['currentport'],toCB,route,cls.LUTID)
				target_CB_port=routing(route,fromCB,fromCBCode,toCB,toCBCode,cls.op4,cls.LUTID)
				if(target_CB_port!=999):
					op4=CB_input_output_connect[target_CB][target_CB_port]
					for key in CLB_INDEX_TO_INPUT.keys():
						if (CLB_INDEX_TO_INPUT[key]==op4):
							CLB_INP_STATS[LUT_connect[cls.LUTID][0]][int(key)]=cls.op4
				else:
					print 'No target CB port available'
			#route_len= len(route)
				print 'routing %s for %s input4'%(cls.op4,cls.LUTID)
				print route
			else:
				#op4=CLB_INDEX_TO_INPUT[str(op)]
				op4=op
		print'lutid %s inpu1 %s input2 %s input3 %s input4 %s'%(cls.LUTID,op1,op2,op3,op4)
		configureLUT(cls.LUTID,LUT_function[cls.function],LUT_interconnect[op1],LUT_interconnect[op2],LUT_interconnect[op3],LUT_interconnect[op4],
		cls.MUXswitch)

		

	elif cls[0]=="SB":
		toFace=cls.toFace
		fromFace=cls.fromFace
		switchid=cls.switchID
		
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



input_port = (oneOf("I0 I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15 Q00_0 Q00_1 Q00_2 Q00_3 Q00_4 Q00_5 Q00_6 Q00_7 Q01_0 Q01_1 Q01_2 Q01_3 Q01_4 Q01_5 Q01_6 Q01_7 Q10_0 Q10_1 Q10_2 Q10_3 Q10_4 Q10_5 Q10_6 Q10_7 Q11_0 Q11_1 Q11_2 Q11_3 Q11_4 Q11_5 Q11_6 Q11_7")).setResultsName('InputLine')

#inputLines=(oneOf("I0 I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15")).setResultsName('onlyInput')
output_port = (oneOf("Q00_0 Q00_1 Q00_2 Q00_3 Q00_4 Q00_5 Q00_6 Q00_7 Q10 Q01_1 Q01_2 Q01_3 Q01_4 Q01_5 Q01_6 Q01_7 Q11_0 Q11_1 Q11_2 Q11_3 Q11_4 Q11_5 Q11_6 Q11_7 Q10_0 Q10_1 Q10_2 Q10_3 Q10_4 Q10_5 Q10_6 Q10_7")).setResultsName('LUTID')
#operand= input_port | output_port


operand1 = (input_port | output_port).setResultsName('op1')
operand2 = (input_port | output_port).setResultsName('op2')
operand3 = (input_port | output_port).setResultsName('op3')
operand4 = (input_port | output_port).setResultsName('op4')
op = (oneOf("AND OR XOR HADD_SUM HADD_CARRY")).setResultsName('function')

switchId = (oneOf("00 01 02 10 11 12 20 21 22")).setResultsName('switchID')
#switchId2 = (oneOf("0 1 2")).setResultsName('switchID2')
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

CBId=(oneOf("00_0 00_1 00_2 00_3 01_0 01_1 01_2 01_3 11_0 11_1 11_2 11_3 10_0 10_1 10_2 10_3")).setResultsName('CBId')
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
             config_code + bopen + switchId+ bclose + equal + bopen + fromFace + fromFaceIndex + comma + toFace + toFaceIndex + bclose | \
	     config_code + bopen + IOId + bclose + equal + sqopen + io_rhs + sqclose | \
	     config_code + bopen + CBId + bclose + equal + sqopen + cb_rhs + sqclose


config=OneOrMore(expression)


counter=0

tests=open("Test6.txt","r")
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

# For Test 2
print 'from CB 00_3 state %s '%CBobjectDictionary['00_3'].CBstate
print 'from SB 00 face A %s '%SBobjectDictionary['00'].A
print 'from SB 00 face C %s '%SBobjectDictionary['00'].C
print 'from SB 10 face A %s '%SBobjectDictionary['10'].A
print 'from SB 10 face B %s '%SBobjectDictionary['10'].B
print 'from SB 11 face D %s '%SBobjectDictionary['11'].D
print 'from SB 11 face C %s '%SBobjectDictionary['11'].C
print 'from SB 21 face A %s '%SBobjectDictionary['21'].A
print 'from SB 21 face B %s '%SBobjectDictionary['21'].B
print 'from CB 11_2 state  %s '%CBobjectDictionary['11_2'].CBstate
print 'from CB 11_2 state  %s '%CBobjectDictionary['11_2'].printCBconfig()


print 'from IO 00 state  %s '%IOobjectDictionary['00'].ioConf

print 'from IO 00 state  %s '%IOobjectDictionary['00'].printIObits()



print 'from CB 00_3 state %s '%CBobjectDictionary['00_3'].CBstate
print 'from SB 00 face A %s '%SBobjectDictionary['00'].A
print 'from SB 00 face C %s '%SBobjectDictionary['00'].C
print 'from SB 10 face A %s '%SBobjectDictionary['10'].A
print 'from SB 10 face B %s '%SBobjectDictionary['10'].B
print 'from SB 11 face D %s '%SBobjectDictionary['11'].D
print 'from SB 11 face B %s '%SBobjectDictionary['11'].B
print 'from SB 12 face D %s '%SBobjectDictionary['12'].D
print 'from SB 12 face C %s '%SBobjectDictionary['12'].C
print 'from CB 11_1 state  %s '%CBobjectDictionary['11_1'].CBstate
print 'from CB 11_1 state  %s '%CBobjectDictionary['11_1'].printCBconfig()
print 'from CB 11_2 state  %s '%CBobjectDictionary['11_2'].CBstate
print 'from CB 11_2 state  %s '%CBobjectDictionary['11_2'].printCBconfig()
print 'from SB 22 face A %s '%SBobjectDictionary['22'].A


#print 'the new one 00 %s'%CLB_INP_STATS['00']
#print 'the new one 01 %s'%CLB_INP_STATS['01']
#print 'the new one 10 %s'%CLB_INP_STATS['10']
#print 'the new one 11 %s'%CLB_INP_STATS['11']
#####################################################printing bits######################################################################################

CB_print_order=["11_3","11_2","11_1","11_0","10_3","10_2","10_1","10_0","01_3","01_2","01_1","01_0","00_3","00_2","00_1","00_0"]
CB_bit_stream=''
for i in CB_print_order:
	CB_bit_stream=CB_bit_stream+CBobjectDictionary[i].printCBconfig()	


SB_print_order = [ "22","21","20","12","11","10","02","01","00"]
SB_bit_stream=''      
for k in SB_print_order:
	SB_bit_stream=SB_bit_stream+SBobjectDictionary[k].gen_SB_bits()

IO_print_order=["42","41","40","31","30","21","20","11","10","02","01","00"]
IO_bit_stream=''      
for j in IO_print_order:  
	IO_bit_stream=IO_bit_stream+IOobjectDictionary[j].printIObits()

LUT_print_order=["Q11_7","Q11_6","Q11_5","Q11_4","Q11_2","Q11_2","Q11_1","Q11_0","Q10_7","Q10_6","Q10_5","Q10_4","Q10_3","Q10_2","Q10_1","Q10_0","Q01_7","Q01_6","Q01_5","Q01_4",
"Q01_3","Q01_2","Q01_1","Q01_0","Q00_7","Q00_6","Q00_5","Q00_4","Q00_3","Q00_2","Q00_1","Q00_0"]
LUT_bit_stream=''
for lut in LUT_print_order:
	LUT_bit_stream=LUT_bit_stream+lutobjectDictionary[lut].bits()

file=open('conf_bit_stream.txt','w')
file.write("CB_config_stream[767:0]= 768'b"+CB_bit_stream+";\n")
file.write("SB_config_stream[6911:0]= 6912'b"+SB_bit_stream+";\n")
file.write("CLB_config_stream[1183:0]= 1184'b"+LUT_bit_stream+";\n")
file.write("IO_config_stream[191:0]=192'b"+IO_bit_stream+";")

file.close()

'''
file=open('conf_bit_stream.txt','w')
file.write(CB_bit_stream+"\n")
file.write(SB_bit_stream+"\n")
file.write(LUT_bit_stream+"\n")
file.write(IO_bit_stream+"\n")

file.close()
'''
###########################################################################################################################################################
'''
#Total 16 CB blocks each having 48 bits
print "CB_config_stream[767:0]= 768'b"+CB_bit_stream+";"

#Total 9 SB blocks each having 768 bits
print "SB_config_stream[6911:0]= 6912'b"+SB_bit_stream+";"

#Total 32 LUTs each having 37 bits
print "CLB_config_stream[1183:0]= 1184'b"+LUT_bit_stream+";"

#Total 12 IO blocks each having 16 bits
print "IO_config_stream[191:0]=192'b"+IO_bit_stream+";"
'''
