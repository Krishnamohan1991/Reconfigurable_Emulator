#!/usr/bin/env python
from pyparsing import*
from modules import*
from fpga_dict import*
import sys
#ParserElement.setDefaultWhitespaceChars(' \t')

#what happens if an object has already been configured and you write to reconfigure it

i_consider_whitespaces_to_be_only = ' '
ParserElement.setDefaultWhitespaceChars(i_consider_whitespaces_to_be_only)

LUTId=''

CB_SB_RouteMap = Graph()
for vertice in graph_nodes:
	CB_SB_RouteMap.add_vertex(vertice,CB_SB_map[vertice])

class InputOutputClashError(Exception):
	def __init__(self,value):
		self.value=value
	def __str__(self):
		return repr(self.value)

def configureLUT(lutid,lutfunc,inp1,inp2,inp3,inp4,CarryGenerateConfig,data_write):  #helper fucntion to set the configuration bits of an LUT
	LUT_ID=str(lutid)
	lutobjectDictionary[Logic_Objects[LUT_ID]].lutConfig(LUT_ID,lutfunc,inp1,inp2,inp3,inp4,CarryGenerateConfig,data_write)




def begins(cls):
	#print 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXX %s'%cls.LUTID[0:2]
	if(LUT_connect.get(cls.LUTID,0)):
		isRegOutput=cls.LUTID[-3:]
		Reg_obj_key=cls.LUTID[:6]+'R'+cls.LUTID[-1:]
		if(isRegOutput[0]=='R' and LUTReg_objectDictionary[Reg_obj_key].status==1 and LUTReg_objectDictionary[Reg_obj_key].src!='X'):
			print 'ERROR: cannot configure the registered output of LUT %s as the register in the logic pair is already used by %s '%(cls.LUTID,LUTReg_objectDictionary[Reg_obj_key].src)
			return 1

	if(LUT_connect.get(cls.LUTID,0) or LUT_connect.get(cls.LUT_Reg,0)): #revisit this condition
		op1=cls.op1
		op2=cls.op2
		op3=cls.op3
		op4=cls.op4
		RegWr_enable=0
		if(cls.write_input==''):
			data_write='I0'
		else:
			data_write=cls.write_input
		
		if(cls.LUT_Reg=='' and cls.DReg_inp==''):
			bypass='I0'
		else:
			bypass=cls.DReg_inp

		if(cls.LUT_Reg==''):
			target_CB=LUT_connect[cls.LUTID][1] #its the ID of the connection block to which the currently programmed LUT is connected to
		else:
			target_CB=LUT_connect[cls.LUT_Reg][1]
		freeCB=[]
		CB_target_port=0
		k=0	#to check the free port in target CB
		
		CB_code=0
		config_IO_input=0
		fromSB='' #to store the orgin SB code when an IO port is given as input of a LUT
		
		print 'INITIAL VALUE OF BYPASS %s'%bypass
		#catch conditon when bypass and/or data line is absent
		print 'DRegInp = %s LUT_Reg = %s'%(cls.DReg_inp,cls.LUT_Reg)

	

		if(cls.LUT_Reg!='' and cls.DReg_inp!='' and (cls.DReg_inp!=cls.LUT_Reg)):  #cls.LUTID and cls.
			Reg_obj_key=cls.LUT_Reg[:6]+'R'+cls.LUT_Reg[-1:] #MAKES CLB00_RQ0 TO CLB0_R0 ---?KEY FOR THE OBJECT DICT --
			RegWr_enable=1
			if(LUTReg_objectDictionary[Reg_obj_key].status==0 and LUTReg_objectDictionary[Reg_obj_key].src=='X'): #checking if the register has already been used or not
				lutobjectDictionary[Logic_Objects[cls.LUT_Reg]].DY_SEL='1'  #configuring the Logic Pair Registers
				LUTReg_objectDictionary[Reg_obj_key].confDReg(cls.DReg_inp)
				#print "Bypass connection %s "%bypass
				if(cls.DReg_inp[0:2]!='IO'):			
					fromCB=LUT_connect[cls.DReg_inp][1] #the CB from which the input signal is transmited
					fromCBCode=str(CB_connect[fromCB][0]) #the global code of the CB from which the input signal to be routed originates
					print 'from name: %s code: %s'%(fromCB,fromCBCode)

				freeCB=check_free_CB_port(LUT_connect[cls.LUT_Reg][0])  #finding all available CB ports around the LUT in the target CLB
				print 'free CB %s'%freeCB 
				for i in freeCB:  
					if i!=999:
						CB_target_port=i
						i=i*0
						CB_code=k
						break
					else:
						k=k+1
						continue					
			
				toCB=CLB_CB_List[LUT_connect[cls.LUT_Reg][0]][CB_code] #finding the target CB
				k=k*0 #resetting k to 0
				print "LUTID= %s to CB= %s "%(cls.LUT_Reg,toCB)
				toCBCode=str(CB_connect[toCB][0])    #CB code at the output to which the output LUT is connected
				print 'to name: %s code: %s'%(toCB,toCBCode)
				op=find_signal_CLB(cls.LUT_Reg,cls.DReg_inp)  #see if the signal has already been routed or not
				if(op==999):
					route=[]
					if(cls.DReg_inp[0:2]!='IO'):
						route=CB_SB_RouteMap.shortest_path(fromCBCode,toCBCode)
						route.append(fromCBCode)
						route.reverse()
						target_CB_port=routing(route,fromCB,fromCBCode,toCB,toCBCode,cls.DReg_inp,cls.LUT_Reg,RegWr_enable)

					elif(cls.DReg_inp[0:2]=='IO' and IOobjectDictionary[cls.DReg_inp[3:5]].status==1 ):
						if(IOobjectDictionary[cls.DReg_inp[3:5]].ioConf[int(cls.DReg_inp[7])]!='I'):
							print 'ERROR THE IO PORT %s IS NOT CONFIGURED AS INPUT PORT'%(cls.DReg_inp)
							return cls.DReg_inp
						fromSB=IO_SB_Connect[cls.DReg_inp[3:5]][0]
						route=CB_SB_RouteMap.shortest_path(fromSB,toCBCode)
						route.append(fromSB)
						route.reverse()
						target_CB_port=routing(route,'X','X',toCB,toCBCode,cls.DReg_inp,cls.LUT_Reg,RegWr_enable)
					print route
					print 'TARGET CB PORT FOR ROUTING %s'%(target_CB_port)
					if(target_CB_port!=999):
						bypass=CB_input_output_connect[target_CB][target_CB_port]
						for key in CLB_INDEX_TO_INPUT.keys():  #updating the CLB_INDEX_TO_INPUT dictionary 
							if (CLB_INDEX_TO_INPUT[key]==bypass):
								CLB_INP_STATS[LUT_connect[cls.LUT_Reg][0]][int(key)]=cls.DReg_inp
					else:
						print 'ERROR: No target CB port available'
			
					print 'routing %s for %s Bypass line'%(cls.DReg_inp,cls.LUT_Reg)
				
				else:				
					if(LUT_interconnect.has_key(op)):
						bypass=op
					else:
						bypass=op[-3:]
				print 'WHAT IS BYPASS = %s'%bypass
				lutobjectDictionary[Logic_Objects[cls.LUT_Reg]].BY=	LUT_interconnect[bypass]
			else:
				print 'Warning: The Register %s is already in use'%Reg_obj_key
				return 	cls.LUT_Reg
			


		if((LUT_connect.has_key(cls.write_input) and cls.write_input!='' and (LUT_connect[cls.write_input][0]!=LUT_connect[cls.LUTID][0])) or cls.write_input[0:2]=='IO'):
			print "Write Data Line"
			if(cls.write_input[0:2]!='IO'):			
				fromCB=LUT_connect[cls.write_input][1] #the CB from which the input signal is transmited
				fromCBCode=str(CB_connect[fromCB][0]) #the global code of the CB from which the input signal to be routed originates
				print 'from name: %s code: %s'%(fromCB,fromCBCode)

			freeCB=check_free_CB_port(LUT_connect[cls.LUTID][0])
			print 'free CB %s'%freeCB
			for i in freeCB:  #finding all available CB ports around the LUT in the target CLB
				if i!=999:
					CB_target_port=i
					i=i*0
					CB_code=k
					break
				else:
					k=k+1
					continue					
			
			toCB=CLB_CB_List[LUT_connect[cls.LUTID][0]][CB_code] #finding the target CB
			k=k*0 #resetting k to 0
			print "LUTID= %s to CB= %s "%(cls.LUTID,toCB)
			toCBCode=str(CB_connect[toCB][0])    #CB code at the output to which the output LUT is connected
			print 'to name: %s code: %s'%(toCB,toCBCode)
			op=find_signal_CLB(cls.LUTID,cls.write_input)
			if(op==999):
				route=[]
				if(cls.write_input[0:2]!='IO'):
					route=CB_SB_RouteMap.shortest_path(fromCBCode,toCBCode)
					route.append(fromCBCode)
					route.reverse()
					target_CB_port=routing(route,fromCB,fromCBCode,toCB,toCBCode,cls.write_input,cls.LUTID,RegWr_enable)

				elif(cls.write_input[0:2]=='IO' and IOobjectDictionary[cls.write_input[3:5]].status==1):
					if(IOobjectDictionary[cls.write_input[3:5]].ioConf[int(cls.write_input[7])]!='I'):
							print 'ERROR THE IO PORT %s IS NOT CONFIGURED AS INPUT PORT'%(cls.write_input)
							return cls.write_input
					fromSB=IO_SB_Connect[cls.DReg_inp[3:5]][0]
					route=CB_SB_RouteMap.shortest_path(fromSB,toCBCode)
					route.append(fromSB)
					route.reverse()
					target_CB_port=routing(route,'X','X',toCB,toCBCode,cls.write_input,cls.LUTID,RegWr_enable)

				print route				
				if(target_CB_port!=999):
					data_write=CB_input_output_connect[target_CB][target_CB_port]
					for key in CLB_INDEX_TO_INPUT.keys():  #updating the CLB_INDEX_TO_INPUT dictionary 
						if (CLB_INDEX_TO_INPUT[key]==data_write):
							CLB_INP_STATS[LUT_connect[cls.LUTID][0]][int(key)]=cls.write_input
				else:
					print 'No target CB port available'
			
				print 'routing %s for %s data write line'%(cls.write_input,cls.LUTID)
				
			else:				
				if(LUT_interconnect.has_key(op)):
					data_write=op
				else:
					data_write=op[-3:]

		
		if((LUT_connect.has_key(cls.op1) and (LUT_connect[cls.op1][0]!=LUT_connect[cls.LUTID][0])) or cls.op1[0:2]=='IO'): #check if the input and output LUTs belong to the same group or not
			print "INPUT 1 XXXXXXXX"	
			if(cls.op1[0:2]!='IO'):			
				fromCB=LUT_connect[cls.op1][1] #the CB from which the input signal is transmited
				fromCBCode=str(CB_connect[fromCB][0]) #the global code of the CB from which the input signal to be routed originates
				print 'from name: %s code: %s'%(fromCB,fromCBCode)
			freeCB=check_free_CB_port(LUT_connect[cls.LUTID][0])
			print 'free CB %s'%freeCB
			for i in freeCB:  #finding all available CB ports around the LUT in the target CLB
				if i!=999:
					CB_target_port=i
					i=i*0
					CB_code=k
					break
				else:
					k=k+1
					continue					
			print 'CB_code %s'%CB_code
			toCB=CLB_CB_List[LUT_connect[cls.LUTID][0]][CB_code] #finding the target CB
			k=k*0 #resetting k to 0
			print "LUTID= %s to CB= %s "%(cls.LUTID,toCB)
			toCBCode=str(CB_connect[toCB][0])    #CB code at the output to which the output LUT is connected
			print 'Target CB: %s Target CB code: %s'%(toCB,toCBCode)
			op=find_signal_CLB(cls.LUTID,cls.op1)
			print 'VALUE OF OP %s'%op
			if(op==999):
				route=[]
				if(cls.op1[0:2]!='IO'):
					route=CB_SB_RouteMap.shortest_path(fromCBCode,toCBCode)
					route.append(fromCBCode)
					route.reverse()
					target_CB_port=routing(route,fromCB,fromCBCode,toCB,toCBCode,cls.op1,cls.LUTID,RegWr_enable)

				elif(cls.op1[0:2]=='IO' and IOobjectDictionary[cls.op1[3:5]].status==1):
					#print 'IO status XXXXXXXXXXXXXXXXXXXXXXXXXXXX--- %c'%IOobjectDictionary[cls.op1[3:5]].ioConf[int(cls.op1[0])]
					if(IOobjectDictionary[cls.op1[3:5]].ioConf[int(cls.op1[7])]!='I'):
							print 'ERROR THE IO PORT %s IS NOT CONFIGURED AS INPUT PORT'%(cls.op1)
							return cls.op1
					fromSB=IO_SB_Connect[cls.op1[3:5]][0]
					route=CB_SB_RouteMap.shortest_path(fromSB,toCBCode)
					route.append(fromSB)
					route.reverse()
					target_CB_port=routing(route,'X','X',toCB,toCBCode,cls.op1,cls.LUTID,RegWr_enable)
				print route
				print 'Target CB Port %s'%target_CB_port
				if(target_CB_port!=999):
					op1=CB_input_output_connect[target_CB][target_CB_port]
					for key in CLB_INDEX_TO_INPUT.keys():  #updating the CLB_INDEX_TO_INPUT dictionary 
						if (CLB_INDEX_TO_INPUT[key]==op1):
							CLB_INP_STATS[LUT_connect[cls.LUTID][0]][int(key)]=cls.op1
				else:
					print 'No target CB port available'
			
				#print 'routing %s for %s input1'%(cls.op1,cls.LUTID)
				
			else:				
				if(LUT_interconnect.has_key(op)):
					op1=op
				else:
					op1=op[-3:]
				
		if((LUT_connect.has_key(cls.op2) and (LUT_connect[cls.op2][0]!=LUT_connect[cls.LUTID][0])) or cls.op2[0:2]=='IO'):	
			if(cls.op2[0:2]!='IO'):			
				fromCB=LUT_connect[cls.op2][1] #the CB from which the input signal is transmited
				fromCBCode=str(CB_connect[fromCB][0]) #the global code of the CB from which the input signal to be routed originates
				print 'from name: %s code: %s'%(fromCB,fromCBCode)
			freeCB=check_free_CB_port(LUT_connect[cls.LUTID][0])
			print 'free CB %s'%freeCB
			for i in freeCB:
				if i!=999:
					CB_target_port=i
					i=i*0
					CB_code=k
					break
				else:
					k=k+1
					continue
			toCB=CLB_CB_List[LUT_connect[cls.LUTID][0]][CB_code]
			k=k*0
			toCBCode=str(CB_connect[toCB][0])
			
			print "LUTID= %s to CB= %s "%(cls.LUTID,toCB)
			print 'to name: %s code: %s'%(toCB,toCBCode)
			op=find_signal_CLB(cls.LUTID,cls.op2) #to find out if the signal to be routed has already been routed before to one of the CLB ports
			if(op==999):
				route=[]
				if(cls.op2[0:2]!='IO'):
					route=CB_SB_RouteMap.shortest_path(fromCBCode,toCBCode)
					route.append(fromCBCode)
					route.reverse()
					target_CB_port=routing(route,fromCB,fromCBCode,toCB,toCBCode,cls.op2,cls.LUTID,RegWr_enable)

				elif(cls.op2[0:2]=='IO' and IOobjectDictionary[cls.op2[3:5]].status==1):
					if(IOobjectDictionary[cls.op2[3:5]].ioConf[int(cls.op2[7])]!='I'):
							print 'ERROR THE IO PORT %s IS NOT CONFIGURED AS INPUT PORT'%(cls.op2)
							return cls.op2
					fromSB=IO_SB_Connect[cls.op2[3:5]][0]
					route=CB_SB_RouteMap.shortest_path(fromSB,toCBCode)
					route.append(fromSB)
					route.reverse()
					target_CB_port=routing(route,'X','X',toCB,toCBCode,cls.op2,cls.LUTID,RegWr_enable)
				print route
				print 'Target CB Port %s'%target_CB_port		
				if(target_CB_port!=999):
					op2=CB_input_output_connect[target_CB][target_CB_port]
					for key in CLB_INDEX_TO_INPUT.keys(): #update the status of CLB input ports after routing the signal from another CLB
						if (CLB_INDEX_TO_INPUT[key]==op2):
							CLB_INP_STATS[LUT_connect[cls.LUTID][0]][int(key)]=cls.op2
				else:
					print 'No target CB port available'
				#print 'routing %s for %s input2'%(cls.op2,cls.LUTID)
					
			else:
				print 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx %s'%op[-3:]				
				if(LUT_interconnect.has_key(op)):
					op2=op
				else:
					op2=op[-3:]
				
		if((LUT_connect.has_key(cls.op3) and (LUT_connect[cls.op3][0]!=LUT_connect[cls.LUTID][0])) or cls.op3[0:2]=='IO'):
			print "INPUT 3"
			if(cls.op3[0:2]!='IO'):			
				fromCB=LUT_connect[cls.op3][1] #the CB from which the input signal is transmited
				fromCBCode=str(CB_connect[fromCB][0]) #the global code of the CB from which the input signal to be routed originates
				print 'from name: %s code: %s'%(fromCB,fromCBCode)
			freeCB=check_free_CB_port(LUT_connect[cls.LUTID][0])
			print 'free CB %s'%freeCB
			for i in freeCB:
				if i!=999:
					CB_target_port=i
					i=i*0
					CB_code=k
					break
				else:
					k=k+1
					continue
			print 'k value %s CB_code %s CB_target_port %s '%(k,CB_code,CB_target_port)
			toCB=CLB_CB_List[LUT_connect[cls.LUTID][0]][CB_code]
			k=k*0
			toCBCode=str(CB_connect[toCB][0])
			op=find_signal_CLB(cls.LUTID,cls.op3)
			print "LUTID= %s to CB= %s "%(cls.LUTID,toCB)
			print 'to name: %s code: %s'%(toCB,toCBCode)
			if(op==999):
				route=[]
				if(cls.op3[0:2]!='IO'):
					route=CB_SB_RouteMap.shortest_path(fromCBCode,toCBCode)
					route.append(fromCBCode)
					route.reverse()
					target_CB_port=routing(route,fromCB,fromCBCode,toCB,toCBCode,cls.op3,cls.LUTID,RegWr_enable)

				elif(cls.op3[0:2]=='IO' and IOobjectDictionary[cls.op3[3:5]].status==1):
					if(IOobjectDictionary[cls.op3[3:5]].ioConf[int(cls.op3[7])]!='I'):
							print 'ERROR THE IO PORT %s IS NOT CONFIGURED AS INPUT PORT'%(cls.op3)
							return cls.op3
					fromSB=IO_SB_Connect[cls.op3[3:5]][0]
					route=CB_SB_RouteMap.shortest_path(fromSB,toCBCode)
					route.append(fromSB)
					route.reverse()
					target_CB_port=routing(route,'X','X',toCB,toCBCode,cls.op3,cls.LUTID,RegWr_enable)
				print route	
				print 'Target CB Port %s'%target_CB_port		
				if(target_CB_port!=999):
					op3=CB_input_output_connect[target_CB][target_CB_port]
					for key in CLB_INDEX_TO_INPUT.keys():
						if (CLB_INDEX_TO_INPUT[key]==op3):
							CLB_INP_STATS[LUT_connect[cls.LUTID][0]][int(key)]=cls.op3
				else:
					print 'No target CB port available'
				#print 'routing %s for %s input3'%(cls.op3,cls.LUTID)
				
			else:
				print 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx %s'%op[-3:]
				if(LUT_interconnect.has_key(op)):
					op3=op
				else:
					op3=op[-3:]
				
		if((LUT_connect.has_key(cls.op4) and (LUT_connect[cls.op4][0]!=LUT_connect[cls.LUTID][0])) or cls.op4[0:2]=='IO'):
			print "INPUT 4 XXXXXXXXXXXXX"
			if(cls.op4[0:2]!='IO'):			
				fromCB=LUT_connect[cls.op4][1] #the CB from which the input signal is transmited
				fromCBCode=str(CB_connect[fromCB][0]) #the global code of the CB from which the input signal to be routed originates
				print 'from name: %s code: %s'%(fromCB,fromCBCode)
			freeCB=check_free_CB_port(LUT_connect[cls.LUTID][0])
			print 'fee CB %s'%freeCB
			for i in freeCB:
				print 'i value %s'%i
				if i!=999:
					CB_target_port=i
					i=i*0
					CB_code=k
					break
				else:
					k=k+1
					continue
			print 'k value %s CB_code %s CB_target_port %s '%(k,CB_code,CB_target_port)
			toCB=CLB_CB_List[LUT_connect[cls.LUTID][0]][CB_code]
			print 'Target Connection Block %s '%toCB
			k=k*0
			toCBCode=str(CB_connect[toCB][0])
			print "LUTID= %s to CB= %s "%(cls.LUTID,toCB)
			print 'to name: %s code: %s'%(toCB,toCBCode)
			op=find_signal_CLB(cls.LUTID,cls.op4)
			if(op==999):
				route=[]
				if(cls.op4[0:2]!='IO'):
					route=CB_SB_RouteMap.shortest_path(fromCBCode,toCBCode)
					route.append(fromCBCode)
					route.reverse()
					target_CB_port=routing(route,fromCB,fromCBCode,toCB,toCBCode,cls.op4,cls.LUTID,RegWr_enable)

				elif(cls.op4[0:2]=='IO' and IOobjectDictionary[cls.op4[3:5]].status==1):
					print 'IO status XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx%s'%IOobjectDictionary[cls.op4[3:5]].ioConf[int(cls.op4[7])]
					if(IOobjectDictionary[cls.op4[3:5]].ioConf[int(cls.op4[7])]!='I'):
							print 'ERROR THE IO PORT %s IS NOT CONFIGURED AS INPUT PORT'%(cls.op4)
							return cls.op4
					fromSB=IO_SB_Connect[cls.op4[3:5]][0]
					route=CB_SB_RouteMap.shortest_path(fromSB,toCBCode)
					route.append(fromSB)
					route.reverse()
					target_CB_port=routing(route,'X','X',toCB,toCBCode,cls.op4,cls.LUTID,RegWr_enable)
				print route
				print 'Target CB Port %s'%target_CB_port		
				if(target_CB_port!=999):
					op4=CB_input_output_connect[target_CB][target_CB_port]
					for key in CLB_INDEX_TO_INPUT.keys():
						if (CLB_INDEX_TO_INPUT[key]==op4):
							CLB_INP_STATS[LUT_connect[cls.LUTID][0]][int(key)]=cls.op4
							print 'updated the CLB inp statsu' 
				else:
					print 'No target CB port available'
				#print 'routing %s for %s input4'%(cls.op4,cls.LUTID)
				
			else:
				print 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx %s'%op[-3:]
				if(LUT_interconnect.has_key(op)):
					op4=op
				else:
					op4=op[-3:]

		print'lutid %s inpu1 %s input2 %s input3 %s input4 %s bypass %s data_write %s'%(cls.LUTID,op1,op2,op3,op4,bypass,data_write)		
		#configuring the CLB
		if(cls.LUT_Reg=='' and cls.DReg_inp==''):
			configureLUT(cls.LUTID,cls.function,LUT_interconnect[op1],LUT_interconnect[op2],LUT_interconnect[op3],LUT_interconnect[op4],cls.CarryGenerateConfig,LUT_interconnect[data_write])

		

	elif cls[0]=="SB":
		toFace=cls.toFace
		fromFace=cls.fromFace
		switchid=cls.switchID
		
		switchBlock.configSwitchBlock(SBobjectDictionary[switchid],switchid,fromFace,cls.fromFaceIndex,toFace,cls.toFaceIndex)

	elif cls[0]=='IO':
		IOBlocks.configIO(IOobjectDictionary[cls.IOId],cls.IOId,cls.SBport0,cls.SBport1,cls.SBport2,cls.SBport3,cls.SBport4,cls.SBport5,cls.SBport6,cls.SBport7)
		#print 'IO status XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx%s'%IOobjectDictionary[cls.IOId].ioConf
	
	elif cls[0]=='CB':

		if(((cls.CB_q1==cls.CB_x1) | (cls.CB_q1==cls.CB_x2) | (cls.CB_q1==cls.CB_x3) | (cls.CB_q1==cls.CB_x4) | (cls.CB_q1==cls.CB_q2) and (cls.CB_q1!='X'))):#put inside config
			try:
				raise InputOutputClashError(-999)
				
			except InputOutputClashError as e:
				print 'EXCEPTION OCCURRED : Output of CB connected to input line or two output lines of CB are connected to the same input line: ',e.value
				sys.exit(1)
				
		else:
			
			connectionBlock.configCB(CBobjectDictionary[cls.CBId],cls.CBId,cls.CB_x1,cls.CB_x2,cls.CB_x3,cls.CB_x4,cls.CB_q1,cls.CB_q2)
	return 1



input_port = (oneOf("I0 I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15 CLB00_Q0 CLB00_Q1 CLB00_Q2 CLB00_Q3 CLB00_Q4 CLB00_Q5 CLB00_Q6 CLB00_Q7 CLB01_Q0 CLB01_Q1 \
					CLB01_Q2 CLB01_Q3 CLB01_Q4 CLB01_Q5 CLB01_Q6 CLB01_Q7 CLB02_Q2 CLB02_Q3 CLB02_Q4 CLB02_Q5 CLB02_Q6 CLB02_Q7 CLB02_Q0 CLB02_Q1 CLB03_Q0 CLB03_Q1 CLB03_Q2 CLB03_Q3 CLB03_Q4 CLB03_Q5 CLB03_Q6 CLB03_Q7 \
					CLB10_Q0 CLB10_Q1 CLB10_Q2 CLB10_Q3 CLB10_Q4 CLB10_Q5 CLB10_Q6 CLB10_Q7 CLB11_Q0 CLB11_Q1 \
					CLB11_Q2 CLB11_Q3 CLB11_Q4 CLB11_Q5 CLB11_Q6 CLB11_Q7 CLB12_Q2 CLB12_Q3 CLB12_Q4 CLB12_Q5 CLB12_Q6 CLB12_Q7 CLB12_Q0 CLB12_Q1 CLB13_Q0 CLB13_Q1 CLB13_Q2 CLB13_Q3 CLB13_Q4 CLB13_Q5 CLB13_Q6 CLB13_Q7 \
					CLB20_Q0 CLB20_Q1 CLB20_Q2 CLB20_Q3 CLB20_Q4 CLB20_Q5 CLB20_Q6 CLB20_Q7 CLB21_Q0 CLB21_Q1 \
					CLB21_Q2 CLB21_Q3 CLB21_Q4 CLB21_Q5 CLB21_Q6 CLB21_Q7 CLB22_Q2 CLB22_Q3 CLB22_Q4 CLB22_Q5 CLB22_Q6 CLB22_Q7 CLB22_Q0 CLB22_Q1 CLB23_Q0 CLB23_Q1 CLB23_Q2 CLB23_Q3 CLB23_Q4 CLB23_Q5 CLB23_Q6 CLB23_Q7 \
					CLB30_Q0 CLB30_Q1 CLB30_Q2 CLB30_Q3 CLB30_Q4 CLB30_Q5 CLB30_Q6 CLB30_Q7 CLB31_Q0 CLB31_Q1 \
					CLB31_Q2 CLB31_Q3 CLB31_Q4 CLB31_Q5 CLB31_Q6 CLB31_Q7 CLB32_Q2 CLB32_Q3 CLB32_Q4 CLB32_Q5 CLB32_Q6 CLB32_Q7 CLB32_Q0 CLB32_Q1 CLB33_Q0 CLB33_Q1 CLB33_Q2 CLB33_Q3 CLB33_Q4 CLB33_Q5 CLB33_Q6 CLB33_Q7 \
					CLB00_RQ0 CLB00_RQ1 CLB00_RQ2 CLB00_RQ3 CLB00_RQ4 CLB00_RQ5 CLB00_RQ6 CLB00_RQ7 CLB01_RQ0 CLB01_RQ1 \
					CLB01_RQ2 CLB01_RQ3 CLB01_RQ4 CLB01_RQ5 CLB01_RQ6 CLB01_RQ7 CLB02_RQ2 CLB02_RQ3 CLB02_RQ4 CLB02_RQ5 CLB02_RQ6 CLB02_RQ7 CLB02_RQ0 CLB02_RQ1 CLB03_RQ0 CLB03_RQ1 CLB03_RQ2 CLB03_RQ3 CLB03_RQ4 CLB03_RQ5 CLB03_RQ6 CLB03_RQ7 \
					CLB10_RQ0 CLB10_RQ1 CLB10_RQ2 CLB10_RQ3 CLB10_RQ4 CLB10_RQ5 CLB10_RQ6 CLB10_RQ7 CLB11_RQ0 CLB11_RQ1 \
					CLB11_RQ2 CLB11_RQ3 CLB11_RQ4 CLB11_RQ5 CLB11_RQ6 CLB11_RQ7 CLB12_RQ2 CLB12_RQ3 CLB12_RQ4 CLB12_RQ5 CLB12_RQ6 CLB12_RQ7 CLB12_RQ0 CLB12_RQ1 CLB13_RQ0 CLB13_RQ1 CLB13_RQ2 CLB13_RQ3 CLB13_RQ4 CLB13_RQ5 CLB13_RQ6 CLB13_RQ7 \
					CLB20_RQ0 CLB20_RQ1 CLB20_RQ2 CLB20_RQ3 CLB20_RQ4 CLB20_RQ5 CLB20_RQ6 CLB20_RQ7 CLB21_RQ0 CLB21_RQ1 \
					CLB21_RQ2 CLB21_RQ3 CLB21_RQ4 CLB21_RQ5 CLB21_RQ6 CLB21_RQ7 CLB22_RQ2 CLB22_RQ3 CLB22_RQ4 CLB22_RQ5 CLB22_RQ6 CLB22_RQ7 CLB22_RQ0 CLB22_RQ1 CLB23_RQ0 CLB23_RQ1 CLB23_RQ2 CLB23_RQ3 CLB23_RQ4 CLB23_RQ5 CLB23_RQ6 CLB23_RQ7 \
					CLB30_RQ0 CLB30_RQ1 CLB30_RQ2 CLB30_RQ3 CLB30_RQ4 CLB30_RQ5 CLB30_RQ6 CLB30_RQ7 CLB31_RQ0 CLB31_RQ1 \
					CLB31_RQ2 CLB31_RQ3 CLB31_RQ4 CLB31_RQ5 CLB31_RQ6 CLB31_RQ7 CLB32_RQ2 CLB32_RQ3 CLB32_RQ4 CLB32_RQ5 CLB32_RQ6 CLB32_RQ7 CLB32_RQ0 CLB32_RQ1 CLB33_RQ0 CLB33_RQ1 CLB33_RQ2 CLB33_RQ3 CLB33_RQ4 CLB33_RQ5 CLB33_RQ6 CLB33_RQ7 \
					CLB00_CY0 CLB00_CY1 CLB00_CY2 CLB00_CY3 CLB00_CY4 CLB00_CY5 CLB00_CY6 CLB00_CY7 CLB01_CY0 CLB01_CY1 \
					CLB01_CY2 CLB01_CY3 CLB01_CY4 CLB01_CY5 CLB01_CY6 CLB01_CY7 CLB02_CY2 CLB02_CY3 CLB02_CY4 CLB02_CY5 CLB02_CY6 CLB02_CY7 CLB02_CY0 CLB02_CY1 CLB03_CY0 CLB03_CY1 CLB03_CY2 CLB03_CY3 CLB03_CY4 CLB03_CY5 CLB03_CY6 CLB03_CY7 \
					CLB10_CY0 CLB10_CY1 CLB10_CY2 CLB10_CY3 CLB10_CY4 CLB10_CY5 CLB10_CY6 CLB10_CY7 CLB11_CY0 CLB11_CY1 \
					CLB11_CY2 CLB11_CY3 CLB11_CY4 CLB11_CY5 CLB11_CY6 CLB11_CY7 CLB12_CY2 CLB12_CY3 CLB12_CY4 CLB12_CY5 CLB12_CY6 CLB12_CY7 CLB12_CY0 CLB12_CY1 CLB13_CY0 CLB13_CY1 CLB13_CY2 CLB13_CY3 CLB13_CY4 CLB13_CY5 CLB13_CY6 CLB13_CY7 \
					CLB20_CY0 CLB20_CY1 CLB20_CY2 CLB20_CY3 CLB20_CY4 CLB20_CY5 CLB20_CY6 CLB20_CY7 CLB21_CY0 CLB21_CY1 \
					CLB21_CY2 CLB21_CY3 CLB21_CY4 CLB21_CY5 CLB21_CY6 CLB21_CY7 CLB22_CY2 CLB22_CY3 CLB22_CY4 CLB22_CY5 CLB22_CY6 CLB22_CY7 CLB22_CY0 CLB22_CY1 CLB23_CY0 CLB23_CY1 CLB23_CY2 CLB23_CY3 CLB23_CY4 CLB23_CY5 CLB23_CY6 CLB23_CY7 \
					CLB30_CY0 CLB30_CY1 CLB30_CY2 CLB30_CY3 CLB30_CY4 CLB30_CY5 CLB30_CY6 CLB30_CY7 CLB31_CY0 CLB31_CY1 \
					CLB31_CY2 CLB31_CY3 CLB31_CY4 CLB31_CY5 CLB31_CY6 CLB31_CY7 CLB32_CY2 CLB32_CY3 CLB32_CY4 CLB32_CY5 CLB32_CY6 CLB32_CY7 CLB32_CY0 CLB32_CY1 CLB33_CY0 CLB33_CY1 CLB33_CY2 CLB33_CY3 CLB33_CY4 CLB33_CY5 CLB33_CY6 CLB33_CY7 \
					IO[00][0] IO[00][1] IO[00][2] IO[00][3] IO[00][4] IO[00][5] IO[00][6] IO[00][7] IO[01][0] IO[01][1] IO[01][2] IO[01][3] IO[01][4] IO[01][5] IO[01][6] IO[01][7] \
					IO[02][0] IO[02][1] IO[02][2] IO[02][3] IO[02][4] IO[02][5] IO[02][6] IO[02][7] IO[03][0] IO[03][1] IO[03][2] IO[03][3] IO[03][4] IO[03][5] IO[03][6] IO[03][7] \
					IO[04][0] IO[04][1] IO[04][2] IO[04][3] IO[04][4] IO[04][5] IO[04][6] IO[04][7] IO[60][0] IO[60][1] IO[60][2] IO[60][3] IO[60][4] IO[60][5] IO[60][6] IO[60][7] \
					IO[61][0] IO[61][1] IO[61][2] IO[61][3] IO[61][4] IO[61][5] IO[61][6] IO[61][7] IO[62][0] IO[62][1] IO[62][2] IO[62][3] IO[62][4] IO[62][5] IO[62][6] IO[62][7] \
					IO[63][0] IO[63][1] IO[63][2] IO[63][3] IO[63][4] IO[63][5] IO[63][6] IO[63][7] IO[64][0] IO[64][1] IO[64][2] IO[64][3] IO[64][4] IO[64][5] IO[64][6] IO[64][7] \
					IO[10][0] IO[10][1] IO[10][2] IO[10][3] IO[10][4] IO[10][5] IO[10][6] IO[10][7] IO[11][0] IO[11][1] IO[11][2] IO[11][3] IO[11][4] IO[11][5] IO[11][6] IO[11][7] \
					IO[20][0] IO[20][1] IO[20][2] IO[20][3] IO[20][4] IO[20][5] IO[20][6] IO[20][7] IO[21][0] IO[21][1] IO[21][2] IO[21][3] IO[21][4] IO[21][5] IO[21][6] IO[21][7] \
					IO[30][0] IO[30][1] IO[30][2] IO[30][3] IO[30][4] IO[30][5] IO[30][6] IO[30][7] IO[31][0] IO[31][1] IO[31][2] IO[31][3] IO[31][4] IO[31][5] IO[31][6] IO[31][7] \
					IO[40][0] IO[40][1] IO[40][2] IO[40][3] IO[40][4] IO[40][5] IO[40][6] IO[40][7] IO[41][0] IO[41][1] IO[41][2] IO[41][3] IO[41][4] IO[41][5] IO[41][6] IO[41][7] \
					IO[50][0] IO[50][1] IO[50][2] IO[50][3] IO[50][4] IO[50][5] IO[50][6] IO[50][7] IO[51][0] IO[51][1] IO[51][2] IO[51][3] IO[51][4] IO[51][5] IO[51][6] IO[51][7] ")).setResultsName('InputLine')

output_port = (oneOf("CLB00_Q0 CLB00_Q1 CLB00_Q2 CLB00_Q3 CLB00_Q4 CLB00_Q5 CLB00_Q6 CLB00_Q7 CLB01_Q0 CLB01_Q1 \
					CLB01_Q2 CLB01_Q3 CLB01_Q4 CLB01_Q5 CLB01_Q6 CLB01_Q7 CLB02_Q2 CLB02_Q3 CLB02_Q4 CLB02_Q5 CLB02_Q6 CLB02_Q7 CLB02_Q0 CLB02_Q1 CLB03_Q0 CLB03_Q1 CLB03_Q2 CLB03_Q3 CLB03_Q4 CLB03_Q5 CLB03_Q6 CLB03_Q7 \
					CLB10_Q0 CLB10_Q1 CLB10_Q2 CLB10_Q3 CLB10_Q4 CLB10_Q5 CLB10_Q6 CLB10_Q7 CLB11_Q0 CLB11_Q1 \
					CLB11_Q2 CLB11_Q3 CLB11_Q4 CLB11_Q5 CLB11_Q6 CLB11_Q7 CLB12_Q2 CLB12_Q3 CLB12_Q4 CLB12_Q5 CLB12_Q6 CLB12_Q7 CLB12_Q0 CLB12_Q1 CLB13_Q0 CLB13_Q1 CLB13_Q2 CLB13_Q3 CLB13_Q4 CLB13_Q5 CLB13_Q6 CLB13_Q7 \
					CLB20_Q0 CLB20_Q1 CLB20_Q2 CLB20_Q3 CLB20_Q4 CLB20_Q5 CLB20_Q6 CLB20_Q7 CLB21_Q0 CLB21_Q1 \
					CLB21_Q2 CLB21_Q3 CLB21_Q4 CLB21_Q5 CLB21_Q6 CLB21_Q7 CLB22_Q2 CLB22_Q3 CLB22_Q4 CLB22_Q5 CLB22_Q6 CLB22_Q7 CLB22_Q0 CLB22_Q1 CLB23_Q0 CLB23_Q1 CLB23_Q2 CLB23_Q3 CLB23_Q4 CLB23_Q5 CLB23_Q6 CLB23_Q7 \
					CLB30_Q0 CLB30_Q1 CLB30_Q2 CLB30_Q3 CLB30_Q4 CLB30_Q5 CLB30_Q6 CLB30_Q7 CLB31_Q0 CLB31_Q1 \
					CLB31_Q2 CLB31_Q3 CLB31_Q4 CLB31_Q5 CLB31_Q6 CLB31_Q7 CLB32_Q2 CLB32_Q3 CLB32_Q4 CLB32_Q5 CLB32_Q6 CLB32_Q7 CLB32_Q0 CLB32_Q1 CLB33_Q0 CLB33_Q1 CLB33_Q2 CLB33_Q3 CLB33_Q4 CLB33_Q5 CLB33_Q6 CLB33_Q7 \
					CLB00_RQ0 CLB00_RQ1 CLB00_RQ2 CLB00_RQ3 CLB00_RQ4 CLB00_RQ5 CLB00_RQ6 CLB00_RQ7 CLB01_RQ0 CLB01_RQ1 \
					CLB01_RQ2 CLB01_RQ3 CLB01_RQ4 CLB01_RQ5 CLB01_RQ6 CLB01_RQ7 CLB02_RQ2 CLB02_RQ3 CLB02_RQ4 CLB02_RQ5 CLB02_RQ6 CLB02_RQ7 CLB02_RQ0 CLB02_RQ1 CLB03_RQ0 CLB03_RQ1 CLB03_RQ2 CLB03_RQ3 CLB03_RQ4 CLB03_RQ5 CLB03_RQ6 CLB03_RQ7 \
					CLB10_RQ0 CLB10_RQ1 CLB10_RQ2 CLB10_RQ3 CLB10_RQ4 CLB10_RQ5 CLB10_RQ6 CLB10_RQ7 CLB11_RQ0 CLB11_RQ1 \
					CLB11_RQ2 CLB11_RQ3 CLB11_RQ4 CLB11_RQ5 CLB11_RQ6 CLB11_RQ7 CLB12_RQ2 CLB12_RQ3 CLB12_RQ4 CLB12_RQ5 CLB12_RQ6 CLB12_RQ7 CLB12_RQ0 CLB12_RQ1 CLB13_RQ0 CLB13_RQ1 CLB13_RQ2 CLB13_RQ3 CLB13_RQ4 CLB13_RQ5 CLB13_RQ6 CLB13_RQ7 \
					CLB20_RQ0 CLB20_RQ1 CLB20_RQ2 CLB20_RQ3 CLB20_RQ4 CLB20_RQ5 CLB20_RQ6 CLB20_RQ7 CLB21_RQ0 CLB21_RQ1 \
					CLB21_RQ2 CLB21_RQ3 CLB21_RQ4 CLB21_RQ5 CLB21_RQ6 CLB21_RQ7 CLB22_RQ2 CLB22_RQ3 CLB22_RQ4 CLB22_RQ5 CLB22_RQ6 CLB22_RQ7 CLB22_RQ0 CLB22_RQ1 CLB23_RQ0 CLB23_RQ1 CLB23_RQ2 CLB23_RQ3 CLB23_RQ4 CLB23_RQ5 CLB23_RQ6 CLB23_RQ7 \
					CLB30_RQ0 CLB30_RQ1 CLB30_RQ2 CLB30_RQ3 CLB30_RQ4 CLB30_RQ5 CLB30_RQ6 CLB30_RQ7 CLB31_RQ0 CLB31_RQ1 \
					CLB31_RQ2 CLB31_RQ3 CLB31_RQ4 CLB31_RQ5 CLB31_RQ6 CLB31_RQ7 CLB32_RQ2 CLB32_RQ3 CLB32_RQ4 CLB32_RQ5 \
					CLB32_RQ6 CLB32_RQ7 CLB32_RQ0 CLB32_RQ1 CLB33_RQ0 CLB33_RQ1 CLB33_RQ2 CLB33_RQ3 CLB33_RQ4 CLB33_RQ5 CLB33_RQ6 CLB33_RQ7 ")).setResultsName('LUTID')

write_input = (oneOf("I0 I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15 \
					CLB00_Q0 CLB00_Q1 CLB00_Q2 CLB00_Q3 CLB00_Q4 CLB00_Q5 CLB00_Q6 CLB00_Q7 CLB01_Q0 CLB01_Q1 \
					CLB01_Q2 CLB01_Q3 CLB01_Q4 CLB01_Q5 CLB01_Q6 CLB01_Q7 CLB02_Q2 CLB02_Q3 CLB02_Q4 CLB02_Q5 CLB02_Q6 CLB02_Q7 CLB02_Q0 CLB02_Q1 CLB03_Q0 CLB03_Q1 CLB03_Q2 CLB03_Q3 CLB03_Q4 CLB03_Q5 CLB03_Q6 CLB03_Q7 \
					CLB10_Q0 CLB10_Q1 CLB10_Q2 CLB10_Q3 CLB10_Q4 CLB10_Q5 CLB10_Q6 CLB10_Q7 CLB11_Q0 CLB11_Q1 \
					CLB11_Q2 CLB11_Q3 CLB11_Q4 CLB11_Q5 CLB11_Q6 CLB11_Q7 CLB12_Q2 CLB12_Q3 CLB12_Q4 CLB12_Q5 CLB12_Q6 CLB12_Q7 CLB12_Q0 CLB12_Q1 CLB13_Q0 CLB13_Q1 CLB13_Q2 CLB13_Q3 CLB13_Q4 CLB13_Q5 CLB13_Q6 CLB13_Q7 \
					CLB20_Q0 CLB20_Q1 CLB20_Q2 CLB20_Q3 CLB20_Q4 CLB20_Q5 CLB20_Q6 CLB20_Q7 CLB21_Q0 CLB21_Q1 \
					CLB21_Q2 CLB21_Q3 CLB21_Q4 CLB21_Q5 CLB21_Q6 CLB21_Q7 CLB22_Q2 CLB22_Q3 CLB22_Q4 CLB22_Q5 CLB22_Q6 CLB22_Q7 CLB22_Q0 CLB22_Q1 CLB23_Q0 CLB23_Q1 CLB23_Q2 CLB23_Q3 CLB23_Q4 CLB23_Q5 CLB23_Q6 CLB23_Q7 \
					CLB30_Q0 CLB30_Q1 CLB30_Q2 CLB30_Q3 CLB30_Q4 CLB30_Q5 CLB30_Q6 CLB30_Q7 CLB31_Q0 CLB31_Q1 \
					CLB31_Q2 CLB31_Q3 CLB31_Q4 CLB31_Q5 CLB31_Q6 CLB31_Q7 CLB32_Q2 CLB32_Q3 CLB32_Q4 CLB32_Q5 CLB32_Q6 CLB32_Q7 CLB32_Q0 CLB32_Q1 CLB33_Q0 CLB33_Q1 CLB33_Q2 CLB33_Q3 CLB33_Q4 CLB33_Q5 CLB33_Q6 CLB33_Q7 \
					CLB00_RQ0 CLB00_RQ1 CLB00_RQ2 CLB00_RQ3 CLB00_RQ4 CLB00_RQ5 CLB00_RQ6 CLB00_RQ7 CLB01_RQ0 CLB01_RQ1 \
					CLB01_RQ2 CLB01_RQ3 CLB01_RQ4 CLB01_RQ5 CLB01_RQ6 CLB01_RQ7 CLB02_RQ2 CLB02_RQ3 CLB02_RQ4 CLB02_RQ5 CLB02_RQ6 CLB02_RQ7 CLB02_RQ0 CLB02_RQ1 CLB03_RQ0 CLB03_RQ1 CLB03_RQ2 CLB03_RQ3 CLB03_RQ4 CLB03_RQ5 CLB03_RQ6 CLB03_RQ7 \
					CLB10_RQ0 CLB10_RQ1 CLB10_RQ2 CLB10_RQ3 CLB10_RQ4 CLB10_RQ5 CLB10_RQ6 CLB10_RQ7 CLB11_RQ0 CLB11_RQ1 \
					CLB11_RQ2 CLB11_RQ3 CLB11_RQ4 CLB11_RQ5 CLB11_RQ6 CLB11_RQ7 CLB12_RQ2 CLB12_RQ3 CLB12_RQ4 CLB12_RQ5 CLB12_RQ6 CLB12_RQ7 CLB12_RQ0 CLB12_RQ1 CLB13_RQ0 CLB13_RQ1 CLB13_RQ2 CLB13_RQ3 CLB13_RQ4 CLB13_RQ5 CLB13_RQ6 CLB13_RQ7 \
					CLB20_RQ0 CLB20_RQ1 CLB20_RQ2 CLB20_RQ3 CLB20_RQ4 CLB20_RQ5 CLB20_RQ6 CLB20_RQ7 CLB21_RQ0 CLB21_RQ1 \
					CLB21_RQ2 CLB21_RQ3 CLB21_RQ4 CLB21_RQ5 CLB21_RQ6 CLB21_RQ7 CLB22_RQ2 CLB22_RQ3 CLB22_RQ4 CLB22_RQ5 CLB22_RQ6 CLB22_RQ7 CLB22_RQ0 CLB22_RQ1 CLB23_RQ0 CLB23_RQ1 CLB23_RQ2 CLB23_RQ3 CLB23_RQ4 CLB23_RQ5 CLB23_RQ6 CLB23_RQ7 \
					CLB30_RQ0 CLB30_RQ1 CLB30_RQ2 CLB30_RQ3 CLB30_RQ4 CLB30_RQ5 CLB30_RQ6 CLB30_RQ7 CLB31_RQ0 CLB31_RQ1 \
					CLB31_RQ2 CLB31_RQ3 CLB31_RQ4 CLB31_RQ5 CLB31_RQ6 CLB31_RQ7 CLB32_RQ2 CLB32_RQ3 CLB32_RQ4 CLB32_RQ5 \
					CLB32_RQ6 CLB32_RQ7 CLB32_RQ0 CLB32_RQ1 CLB33_RQ0 CLB33_RQ1 CLB33_RQ2 CLB33_RQ3 CLB33_RQ4 CLB33_RQ5 CLB33_RQ6 CLB33_RQ7 \
					CLB00_CY0 CLB00_CY1 CLB00_CY2 CLB00_CY3 CLB00_CY4 CLB00_CY5 CLB00_CY6 CLB00_CY7 CLB01_CY0 CLB01_CY1 \
					CLB01_CY2 CLB01_CY3 CLB01_CY4 CLB01_CY5 CLB01_CY6 CLB01_CY7 CLB02_CY2 CLB02_CY3 CLB02_CY4 CLB02_CY5 CLB02_CY6 CLB02_CY7 CLB02_CY0 CLB02_CY1 CLB03_CY0 CLB03_CY1 CLB03_CY2 CLB03_CY3 CLB03_CY4 CLB03_CY5 CLB03_CY6 CLB03_CY7 \
					CLB10_CY0 CLB10_CY1 CLB10_CY2 CLB10_CY3 CLB10_CY4 CLB10_CY5 CLB10_CY6 CLB10_CY7 CLB11_CY0 CLB11_CY1 \
					CLB11_CY2 CLB11_CY3 CLB11_CY4 CLB11_CY5 CLB11_CY6 CLB11_CY7 CLB12_CY2 CLB12_CY3 CLB12_CY4 CLB12_CY5 CLB12_CY6 CLB12_CY7 CLB12_CY0 CLB12_CY1 CLB13_CY0 CLB13_CY1 CLB13_CY2 CLB13_CY3 CLB13_CY4 CLB13_CY5 CLB13_CY6 CLB13_CY7 \
					CLB20_CY0 CLB20_CY1 CLB20_CY2 CLB20_CY3 CLB20_CY4 CLB20_CY5 CLB20_CY6 CLB20_CY7 CLB21_CY0 CLB21_CY1 \
					CLB21_CY2 CLB21_CY3 CLB21_CY4 CLB21_CY5 CLB21_CY6 CLB21_CY7 CLB22_CY2 CLB22_CY3 CLB22_CY4 CLB22_CY5 CLB22_CY6 CLB22_CY7 CLB22_CY0 CLB22_CY1 CLB23_CY0 CLB23_CY1 CLB23_CY2 CLB23_CY3 CLB23_CY4 CLB23_CY5 CLB23_CY6 CLB23_CY7 \
					CLB30_CY0 CLB30_CY1 CLB30_CY2 CLB30_CY3 CLB30_CY4 CLB30_CY5 CLB30_CY6 CLB30_CY7 CLB31_CY0 CLB31_CY1 \
					CLB31_CY2 CLB31_CY3 CLB31_CY4 CLB31_CY5 CLB31_CY6 CLB31_CY7 CLB32_CY2 CLB32_CY3 CLB32_CY4 CLB32_CY5 CLB32_CY6 CLB32_CY7 CLB32_CY0 CLB32_CY1 CLB33_CY0 CLB33_CY1 CLB33_CY2 CLB33_CY3 CLB33_CY4 CLB33_CY5 CLB33_CY6 CLB33_CY7 \
					IO[00][0] IO[00][1] IO[00][2] IO[00][3] IO[00][4] IO[00][5] IO[00][6] IO[00][7] IO[01][0] IO[01][1] IO[01][2] IO[01][3] IO[01][4] IO[01][5] IO[01][6] IO[01][7] \
					IO[02][0] IO[02][1] IO[02][2] IO[02][3] IO[02][4] IO[02][5] IO[02][6] IO[02][7] IO[03][0] IO[03][1] IO[03][2] IO[03][3] IO[03][4] IO[03][5] IO[03][6] IO[03][7] \
					IO[04][0] IO[04][1] IO[04][2] IO[04][3] IO[04][4] IO[04][5] IO[04][6] IO[04][7] IO[60][0] IO[60][1] IO[60][2] IO[60][3] IO[60][4] IO[60][5] IO[60][6] IO[60][7] \
					IO[61][0] IO[61][1] IO[61][2] IO[61][3] IO[61][4] IO[61][5] IO[61][6] IO[61][7] IO[62][0] IO[62][1] IO[62][2] IO[62][3] IO[62][4] IO[62][5] IO[62][6] IO[62][7] \
					IO[63][0] IO[63][1] IO[63][2] IO[63][3] IO[63][4] IO[63][5] IO[63][6] IO[63][7] IO[64][0] IO[64][1] IO[64][2] IO[64][3] IO[64][4] IO[64][5] IO[64][6] IO[64][7] \
					IO[10][0] IO[10][1] IO[10][2] IO[10][3] IO[10][4] IO[10][5] IO[10][6] IO[10][7] IO[11][0] IO[11][1] IO[11][2] IO[11][3] IO[11][4] IO[11][5] IO[11][6] IO[11][7] \
					IO[20][0] IO[20][1] IO[20][2] IO[20][3] IO[20][4] IO[20][5] IO[20][6] IO[20][7] IO[21][0] IO[21][1] IO[21][2] IO[21][3] IO[21][4] IO[21][5] IO[21][6] IO[21][7] \
					IO[30][0] IO[30][1] IO[30][2] IO[30][3] IO[30][4] IO[30][5] IO[30][6] IO[30][7] IO[31][0] IO[31][1] IO[31][2] IO[31][3] IO[31][4] IO[31][5] IO[31][6] IO[31][7] \
					IO[40][0] IO[40][1] IO[40][2] IO[40][3] IO[40][4] IO[40][5] IO[40][6] IO[40][7] IO[41][0] IO[41][1] IO[41][2] IO[41][3] IO[41][4] IO[41][5] IO[41][6] IO[41][7] \
					IO[50][0] IO[50][1] IO[50][2] IO[50][3] IO[50][4] IO[50][5] IO[50][6] IO[50][7] IO[51][0] IO[51][1] IO[51][2] IO[51][3] IO[51][4] IO[51][5] IO[51][6] IO[51][7] \
					")).setResultsName('DReg_inp')


bopen=Literal("(").suppress()
bclose=Literal(")").suppress()
comma=Literal(",").suppress()
sqopen=Literal("[").suppress()
sqclose=Literal("]").suppress()
equal=Literal("=").suppress()

IOId = (oneOf("00 01 02 03 04 10 11 20 21 30 31 40 41 50 51 60 61 62 63 64")).setResultsName('IOId')
IO_portId= (oneOf("0 1 2 3 4 5 6 7")).setResultsName('IO_portId')


#IO_input=Literal('IO')+sqopen+IOId+sqclose+sqopen+IO_portId+sqclose
operand1 = (input_port | output_port ).setResultsName('op1')
operand2 = (input_port | output_port ).setResultsName('op2')
operand3 = (input_port | output_port ).setResultsName('op3')
operand4 = (input_port | output_port ).setResultsName('op4')
op = (oneOf("AND OR XOR ZERO FULL_ADD OPT_FULL_ADD 2INPAND V3 V2 V1 V0")).setResultsName('function')

switchId = (oneOf("00 01 02 03 04 10 11 12 13 14 20 21 22 23 24 30 31 32 33 34 40 41 42 43 44")).setResultsName('switchID')

fromFace=(oneOf("N E S W")).setResultsName('fromFace')
toFace=(oneOf("N E S W")).setResultsName('toFace')
toFaceIndex=(oneOf("0 1 2 3 4 5 6 7")).setResultsName('toFaceIndex')
fromFaceIndex=(oneOf("0 1 2 3 4 5 6 7")).setResultsName('fromFaceIndex')

SBport0 = (oneOf("X I O")).setResultsName('SBport0')
SBport1 = (oneOf("X I O")).setResultsName('SBport1') 
SBport2 = (oneOf("X I O")).setResultsName('SBport2') 
SBport3 = (oneOf("X I O")).setResultsName('SBport3') 
SBport4 = (oneOf("X I O")).setResultsName('SBport4') 
SBport5 = (oneOf("X I O")).setResultsName('SBport5') 
SBport6 = (oneOf("X I O")).setResultsName('SBport6') 
SBport7 = (oneOf("X I O")).setResultsName('SBport7')

CBId=(oneOf("00_0 00_1 00_2 00_3 01_0 01_1 01_2 01_3 02_0 02_1 02_2 02_3 03_0 03_1 03_2 03_3\
			 10_0 10_1 10_2 10_3 11_0 11_1 11_2 11_3 12_0 12_1 12_2 12_3 13_0 13_1 13_2 13_3\
			 20_0 20_1 20_2 20_3 21_0 21_1 21_2 21_3 22_0 22_1 22_2 22_3 23_0 23_1 23_2 23_3\
			 30_0 30_1 30_2 30_3 31_0 31_1 31_2 31_3 32_0 32_1 32_2 32_3 33_0 33_1 33_2 33_3")).setResultsName('CBId')

CB_x1=(oneOf("0 1 2 3 4 5 6 7 X")).setResultsName('CB_x1')
CB_x2=(oneOf("0 1 2 3 4 5 6 7 X")).setResultsName('CB_x2')
CB_x3=(oneOf("0 1 2 3 4 5 6 7 X")).setResultsName('CB_x3')
CB_x4=(oneOf("0 1 2 3 4 5 6 7 X")).setResultsName('CB_x4')
CB_q1=(oneOf("0 1 2 3 4 5 6 7 X")).setResultsName('CB_q1')
CB_q2=(oneOf("0 1 2 3 4 5 6 7 X")).setResultsName('CB_q2')
CB_Rq1=(oneOf("0 1 2 3 4 5 6 7 X")).setResultsName('CB_Rq1')
CB_Rq2=(oneOf("0 1 2 3 4 5 6 7 X")).setResultsName('CB_Rq2')
CB_CY1=(oneOf("0 1 2 3 4 5 6 7 X")).setResultsName('CB_CY1')
CB_CY2=(oneOf("0 1 2 3 4 5 6 7 X")).setResultsName('CB_CY2')

CarryGen=Literal("CGEN").setResultsName('CarryGenerate')
CarryGen_Config=(oneOf("0 1 2 3 4 D")).setResultsName('CarryGenerateConfig')

D_FF=(oneOf("CLB00_RQ0 CLB00_RQ1 CLB00_RQ2 CLB00_RQ3 CLB00_RQ4 CLB00_RQ5 CLB00_RQ6 CLB00_RQ7 \
				CLB01_RQ0 CLB01_RQ1 CLB01_RQ2 CLB01_RQ3 CLB01_RQ4 CLB01_RQ5 CLB01_RQ6 CLB01_RQ7 \
				CLB02_RQ0 CLB02_RQ1 CLB02_RQ2 CLB02_RQ3 CLB02_RQ4 CLB02_RQ5 CLB02_RQ6 CLB02_RQ7 \
				CLB03_RQ0 CLB03_RQ1 CLB03_RQ2 CLB03_RQ3 CLB03_RQ4 CLB03_RQ5 CLB03_RQ6 CLB03_RQ7 \
				CLB10_RQ0 CLB10_RQ1 CLB10_RQ2 CLB10_RQ3 CLB10_RQ4 CLB10_RQ5 CLB10_RQ6 CLB10_RQ7 \
				CLB11_RQ0 CLB11_RQ1 CLB11_RQ2 CLB11_RQ3 CLB11_RQ4 CLB11_RQ5 CLB11_RQ6 CLB11_RQ7 \
				CLB12_RQ0 CLB12_RQ1 CLB12_RQ2 CLB12_RQ3 CLB12_RQ4 CLB12_RQ5 CLB12_RQ6 CLB12_RQ7 \
				CLB13_RQ0 CLB13_RQ1 CLB13_RQ2 CLB13_RQ3 CLB13_RQ4 CLB13_RQ5 CLB13_RQ6 CLB13_RQ7 \
				CLB20_RQ0 CLB20_RQ1 CLB20_RQ2 CLB20_RQ3 CLB20_RQ4 CLB20_RQ5 CLB20_RQ6 CLB20_RQ7 \
				CLB21_RQ0 CLB21_RQ1 CLB21_RQ2 CLB21_RQ3 CLB21_RQ4 CLB21_RQ5 CLB21_RQ6 CLB21_RQ7 \
				CLB22_RQ0 CLB22_RQ1 CLB22_RQ2 CLB22_RQ3 CLB22_RQ4 CLB22_RQ5 CLB22_RQ6 CLB22_RQ7 \
				CLB23_RQ0 CLB23_RQ1 CLB23_RQ2 CLB23_RQ3 CLB23_RQ4 CLB23_RQ5 CLB23_RQ6 CLB23_RQ7 \
				CLB30_RQ0 CLB30_RQ1 CLB30_RQ2 CLB30_RQ3 CLB30_RQ4 CLB30_RQ5 CLB30_RQ6 CLB30_RQ7 \
				CLB31_RQ0 CLB31_RQ1 CLB31_RQ2 CLB31_RQ3 CLB31_RQ4 CLB31_RQ5 CLB31_RQ6 CLB31_RQ7 \
				CLB32_RQ0 CLB32_RQ1 CLB32_RQ2 CLB32_RQ3 CLB32_RQ4 CLB32_RQ5 CLB32_RQ6 CLB32_RQ7 \
				CLB33_RQ0 CLB33_RQ1 CLB33_RQ2 CLB33_RQ3 CLB33_RQ4 CLB33_RQ5 CLB33_RQ6 CLB33_RQ7")).setResultsName('LUT_Reg')

config_code=(oneOf("IO SB CB WR")).setResultsName('configCode')

lut_rhs= operand1 + comma + operand2 + comma + operand3 + comma + operand4

io_rhs= SBport0 + comma + SBport1 + comma + SBport2 + comma + SBport3 + comma + SBport4 + comma + SBport5 + comma + SBport6 + comma + SBport7
cb_rhs= CB_x1 + comma + CB_x2 + comma + CB_x3 + comma + CB_x4 + comma + CB_q1 + comma + CB_q2
	
	#expression 
	#1 -for functions involving carry generation you can specify how th carry should be generated
	#2 - for wriing into an LUT
	#3 - normal lut configuration -- CLB00_Q1=AND[I1,I2,CLB00_Q7,I15]
	#4 - used for explicit configuration of switch blocks
	#5 - for configuring IO ports
	#6 - for explicit configuration of connection blocks
	#7 - storing an LUT output or an LUT input signal in the register associated with each LUT
expression =  output_port + equal + op + sqopen + lut_rhs + sqclose + CarryGen + sqopen + CarryGen_Config + sqclose | \
              output_port + equal + config_code + sqopen + write_input + sqclose + sqopen + lut_rhs + sqclose | \
              output_port + equal + op + sqopen + lut_rhs + sqclose | \
              config_code + sqopen + switchId+ sqclose + equal + sqopen + fromFace + fromFaceIndex + comma + toFace + toFaceIndex + sqclose | \
              config_code + sqopen + IOId + sqclose + equal + sqopen + io_rhs + sqclose | \
			  config_code + sqopen + CBId + sqclose + equal + sqopen + cb_rhs + sqclose | \
			  D_FF + equal + sqopen + write_input + sqclose 

config=OneOrMore(expression)



tests=open("vector_multiply.txt","r")
scr=tests.read()

scr_split=scr.splitlines()
	
for test in scr_split:
	stats = config.parseString(test)
	begins(stats)
	

tests.close()


#####################################################printing bits######################################################################################

CB_print_order=	["33_3","33_2","33_1","33_0","32_3","32_2","32_1","32_0","31_3","31_2","31_1","31_0","30_3","30_2","30_1","30_0",
	"23_3","23_2","23_1","23_0","22_3","22_2","22_1","22_0","21_3","21_2","21_1","21_0","20_3","20_2","20_1","20_0",
	"13_3","13_2","13_1","13_0","12_3","12_2","12_1","12_0","11_3","11_2","11_1","11_0","10_3","10_2","10_1","10_0",
	"03_3","03_2","03_1","03_0","02_3","02_2","02_1","02_0","01_3","01_2","01_1","01_0","00_3","00_2","00_1","00_0"]

CB_bit_stream=''
for i in CB_print_order:
	CB_bit_stream=CB_bit_stream+CBobjectDictionary[i].printCBconfig()



SB_print_order0 = ["14","13","12","11","10","04","03","02","01","00"]
SB_print_order1= ["34","33","32","31","30","24","23","22","21","20"]
SB_print_order2=["44","43","42","41","40"]
SB_bit_stream0=''
SB_bit_stream1=''
SB_bit_stream2=''      

for k0 in SB_print_order0:
	SB_bit_stream0=SB_bit_stream0+SBobjectDictionary[k0].gen_SB_bits()

for k1 in SB_print_order1:
	SB_bit_stream1=SB_bit_stream1+SBobjectDictionary[k1].gen_SB_bits()	

for k2 in SB_print_order2:
	SB_bit_stream2=SB_bit_stream2+SBobjectDictionary[k2].gen_SB_bits()		

IO_print_order=["64","63","62","61","60","51","50","41","40","31","30","21","20","11","10","04","03","02","01","00"]
IO_bit_stream=''      
for j in IO_print_order:  
	IO_bit_stream=IO_bit_stream+IOobjectDictionary[j].printIObits()

LUT_print_order=["CLB33_Q7","CLB33_Q6","CLB33_Q5","CLB33_Q4","CLB33_Q3","CLB33_Q2","CLB33_Q1","CLB33_Q0","CLB32_Q7","CLB32_Q6","CLB32_Q5","CLB32_Q4","CLB32_Q3","CLB32_Q2","CLB32_Q1","CLB32_Q0",
"CLB31_Q7","CLB31_Q6","CLB31_Q5","CLB31_Q4","CLB31_Q3","CLB31_Q2","CLB31_Q1","CLB31_Q0","CLB30_Q7","CLB30_Q6","CLB30_Q5","CLB30_Q4","CLB30_Q3","CLB30_Q2","CLB30_Q1","CLB30_Q0",
"CLB23_Q7","CLB23_Q6","CLB23_Q5","CLB23_Q4","CLB23_Q3","CLB23_Q2","CLB23_Q1","CLB23_Q0","CLB22_Q7","CLB22_Q6","CLB22_Q5","CLB22_Q4","CLB22_Q3","CLB22_Q2","CLB22_Q1","CLB22_Q0",
"CLB21_Q7","CLB21_Q6","CLB21_Q5","CLB21_Q4","CLB21_Q3","CLB21_Q2","CLB21_Q1","CLB21_Q0","CLB20_Q7","CLB20_Q6","CLB20_Q5","CLB20_Q4","CLB20_Q3","CLB20_Q2","CLB20_Q1","CLB20_Q0",
"CLB13_Q7","CLB13_Q6","CLB13_Q5","CLB13_Q4","CLB13_Q3","CLB13_Q2","CLB13_Q1","CLB13_Q0","CLB12_Q7","CLB12_Q6","CLB12_Q5","CLB12_Q4","CLB12_Q3","CLB12_Q2","CLB12_Q1","CLB12_Q0",
"CLB11_Q7","CLB11_Q6","CLB11_Q5","CLB11_Q4","CLB11_Q3","CLB11_Q2","CLB11_Q1","CLB11_Q0","CLB10_Q7","CLB10_Q6","CLB10_Q5","CLB10_Q4","CLB10_Q3","CLB10_Q2","CLB10_Q1","CLB10_Q0",
"CLB03_Q7","CLB03_Q6","CLB03_Q5","CLB03_Q4","CLB03_Q3","CLB03_Q2","CLB03_Q1","CLB03_Q0","CLB02_Q7","CLB02_Q6","CLB02_Q5","CLB02_Q4","CLB02_Q3","CLB02_Q2","CLB02_Q1","CLB02_Q0",
"CLB01_Q7","CLB01_Q6","CLB01_Q5","CLB01_Q4","CLB01_Q3","CLB01_Q2","CLB01_Q1","CLB01_Q0","CLB00_Q7","CLB00_Q6","CLB00_Q5","CLB00_Q4","CLB00_Q3","CLB00_Q2","CLB00_Q1","CLB00_Q0"]
LUT_bit_stream=''
for lut in LUT_print_order:
	LUT_bit_stream=LUT_bit_stream+lutobjectDictionary[lut].bits()

file=open('conf_bit_stream.txt','w')
file.write("CB_config_stream[5119:0]= 5120'b"+CB_bit_stream+";\n")
file.write("SB_config_stream0[7679:0]= 7680'b"+SB_bit_stream0+";\n")
file.write("SB_config_stream1[7679:0]= 7680'b"+SB_bit_stream1+";\n")
file.write("SB_config_stream2[3839:0]= 3840'b"+SB_bit_stream2+";\n")
file.write("CLB_config_stream[7423:0]= 7424'b"+LUT_bit_stream+";\n")
file.write("IO_config_stream[319:0]=320'b"+IO_bit_stream+";")

file.close()
'''
print 'LUT CLB00_Q0 bitstream = %s'%lutobjectDictionary['CLB00_Q0'].bits()

print 'LUT CLB30_Q0 bitstream = %s'%lutobjectDictionary['CLB30_Q0'].bits()

print 'LUT CLB21_RQ0 bitstream = %s'%lutobjectDictionary[Logic_Objects['CLB21_RQ0']].bits()

print 'LUT CLB23_RQ0 bitstream = %s'%lutobjectDictionary[Logic_Objects['CLB23_RQ0']].bits()

print 'LUT CLB31_RQ0 bitstream = %s'%lutobjectDictionary[Logic_Objects['CLB31_RQ0']].bits()

print 'LUT CLB31_RQ1 bitstream = %s'%lutobjectDictionary[Logic_Objects['CLB31_RQ1']].bits()

'''