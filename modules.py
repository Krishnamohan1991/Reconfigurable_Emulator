#!/usr/bin/env python
import heapq
import sys
from fpga_dict import*


class DReg(object):
	def __init__(self,name):   #DregId written as CLB00_R0
		self.src='X'
		self.status=0
		self.RegId=name

	def confDReg(self,Inp_Src):
		if(self.status==1 and self.src!='X'):
			print 'Error: Cannot use register %s as its already being used by line %s'%(DRegId,Inp_Src)
			return 
		else:
			self.status=1
			self.src=Inp_Src
		return 1

LUTReg_objectNames = ["CLB00_R0","CLB00_R1","CLB00_R2","CLB00_R3","CLB00_R4","CLB00_R5","CLB00_R6","CLB00_R7",
				"CLB01_R0","CLB01_R1","CLB01_R2","CLB01_R3","CLB01_R4","CLB01_R5","CLB01_R6","CLB01_R7",
				"CLB02_R0","CLB02_R1","CLB02_R2","CLB02_R3","CLB02_R4","CLB02_R5","CLB02_R6","CLB02_R7",
				"CLB03_R0","CLB03_R1","CLB03_R2","CLB03_R3","CLB03_R4","CLB03_R5","CLB03_R6","CLB03_R7",
				"CLB10_R0","CLB10_R1","CLB10_R2","CLB10_R3","CLB10_R4","CLB10_R5","CLB10_R6","CLB10_R7",
				"CLB11_R0","CLB11_R1","CLB11_R2","CLB11_R3","CLB11_R4","CLB11_R5","CLB11_R6","CLB11_R7",
				"CLB12_R0","CLB12_R1","CLB12_R2","CLB12_R3","CLB12_R4","CLB12_R5","CLB12_R6","CLB12_R7",
				"CLB13_R0","CLB13_R1","CLB13_R2","CLB13_R3","CLB13_R4","CLB13_R5","CLB13_R6","CLB13_R7",
				"CLB20_R0","CLB20_R1","CLB20_R2","CLB20_R3","CLB20_R4","CLB20_R5","CLB20_R6","CLB20_R7",
				"CLB21_R0","CLB21_R1","CLB21_R2","CLB21_R3","CLB21_R4","CLB21_R5","CLB21_R6","CLB21_R7",
				"CLB22_R0","CLB22_R1","CLB22_R2","CLB22_R3","CLB22_R4","CLB22_R5","CLB22_R6","CLB22_R7",
				"CLB23_R0","CLB23_R1","CLB23_R2","CLB23_R3","CLB23_R4","CLB23_R5","CLB23_R6","CLB23_R7",
				"CLB30_R0","CLB30_R1","CLB30_R2","CLB30_R3","CLB30_R4","CLB30_R5","CLB30_R6","CLB30_R7",
				"CLB31_R0","CLB31_R1","CLB31_R2","CLB31_R3","CLB31_R4","CLB31_R5","CLB31_R6","CLB31_R7",
				"CLB32_R0","CLB32_R1","CLB32_R2","CLB32_R3","CLB32_R4","CLB32_R5","CLB32_R6","CLB32_R7",
				"CLB33_R0","CLB33_R1","CLB33_R2","CLB33_R3","CLB33_R4","CLB33_R5","CLB33_R6","CLB33_R7"]

LUTReg_objectDictionary = {}
for name in LUTReg_objectNames:
    LUTReg_objectDictionary[name] = DReg(name)

class lut(object):
	def __init__(self,outputp):
		self.lutTable='0000000000000000'		
		self.outputPort=outputp    #contains the code of the LUT which is giving the output
		self.inputPort1='000000'
		self.inputPort2='000000'
		self.inputPort3='000000'
		self.inputPort4='000000'
		self.status=0
		self.LUTID=''
		self.function=''
		self.CYGEN_SEL='011'  #default carry generate is x1&x2
		self.CY_SEL='0'  #default carrry select is the input from the carry chain
		self.OUT_SEL='1' #the default output of the unregistered LUT output line is the lut_out
		self.DY_SEL='1' #the D-FF associated with each logic pair stores the Bypass signal by default
		self.data='000000'
		self.BY='000000'

	def lutConfig(self,LUTID,function,input1,input2,input3,input4,CarryGenerateConfig,data):
		if(self.status==1):
			print 'WARNING: LUT %s is already configured'%self.LUTID
			return LUTID		
		if(function!=''):
			self.lutTable=LUT_function[function]
		else:
			self.lutTable=LUT_function['ZERO']		
		self.outputPort=LUTID
		self.inputPort1=input1
		self.inputPort2=input2
		self.inputPort3=input3
		self.inputPort4=input4
		self.status=1
		self.LUTID=LUTID
		self.function=function
		self.out_dir_or_reg= LUTID[-3:]       #attribute says if the output of the LUT being configured is registered or direct
		self.data=data
		
		if(self.out_dir_or_reg[0]=='R'):
			Reg_obj_key=LUTID[:6]+'R'+LUTID[-1:]  #MAKES CLB00_RQ0 TO CLB0_R0 ---?KEY FOR THE OBJECT DICT
			if(LUTReg_objectDictionary[Reg_obj_key].status==0 and LUTReg_objectDictionary[Reg_obj_key].src!='X'):
				self.DY_SEL='0'
				LUTReg_objectDictionary[Reg_obj_key].confDReg(LUTID)
			else:
				self.DY_SEL='1'
			
		if(function == 'HALF_ADD' or function == 'FULL_ADD'):
			self.CY_SEL='1'
			self.OUT_SEL='0'
			if(CarryGenerateConfig!=''):
				self.CYGEN_SEL=CY_GEN_Config[CarryGenerateConfig]

		if((function == 'HALF_ADD' or function == 'FULL_ADD') and CarryGenerateConfig!=''):
			print 'Error: Adding Carry Generate Configuration To Functions Other Than Half and Full Adder'
							
		return LUTID

	def bits(self):
		lut_config_bits=''
		lut_config_bits=str(self.inputPort4+self.inputPort3+self.inputPort2+self.inputPort1+self.data+self.BY+self.CYGEN_SEL+self.CY_SEL+self.OUT_SEL+self.DY_SEL+self.lutTable)	
		return lut_config_bits

	
#creating objects for each LUT


objectNames = ["CLB00_Q0","CLB00_Q1","CLB00_Q2","CLB00_Q3","CLB00_Q4","CLB00_Q5","CLB00_Q6","CLB00_Q7","CLB01_Q0","CLB01_Q1",
					"CLB01_Q2","CLB01_Q3","CLB01_Q4","CLB01_Q5","CLB01_Q6","CLB01_Q7","CLB02_Q2","CLB02_Q3","CLB02_Q4","CLB02_Q5","CLB02_Q6","CLB02_Q7","CLB02_Q0","CLB02_Q1","CLB03_Q0","CLB03_Q1","CLB03_Q2","CLB03_Q3","CLB03_Q4","CLB03_Q5","CLB03_Q6","CLB03_Q7",
					"CLB10_Q0","CLB10_Q1","CLB10_Q2","CLB10_Q3","CLB10_Q4","CLB10_Q5","CLB10_Q6","CLB10_Q7","CLB11_Q0","CLB11_Q1",
					"CLB11_Q2","CLB11_Q3","CLB11_Q4","CLB11_Q5","CLB11_Q6","CLB11_Q7","CLB12_Q2","CLB12_Q3","CLB12_Q4","CLB12_Q5","CLB12_Q6","CLB12_Q7","CLB12_Q0","CLB12_Q1","CLB13_Q0","CLB13_Q1","CLB13_Q2","CLB13_Q3","CLB13_Q4","CLB13_Q5","CLB13_Q6","CLB13_Q7",
					"CLB20_Q0","CLB20_Q1","CLB20_Q2","CLB20_Q3","CLB20_Q4","CLB20_Q5","CLB20_Q6","CLB20_Q7","CLB21_Q0","CLB21_Q1",
					"CLB21_Q2","CLB21_Q3","CLB21_Q4","CLB21_Q5","CLB21_Q6","CLB21_Q7","CLB22_Q2","CLB22_Q3","CLB22_Q4","CLB22_Q5","CLB22_Q6","CLB22_Q7","CLB22_Q0","CLB22_Q1","CLB23_Q0","CLB23_Q1","CLB23_Q2","CLB23_Q3","CLB23_Q4","CLB23_Q5","CLB23_Q6","CLB23_Q7",
					"CLB30_Q0","CLB30_Q1","CLB30_Q2","CLB30_Q3","CLB30_Q4","CLB30_Q5","CLB30_Q6","CLB30_Q7","CLB31_Q0","CLB31_Q1",
					"CLB31_Q2","CLB31_Q3","CLB31_Q4","CLB31_Q5","CLB31_Q6","CLB31_Q7","CLB32_Q2","CLB32_Q3","CLB32_Q4","CLB32_Q5","CLB32_Q6","CLB32_Q7","CLB32_Q0","CLB32_Q1","CLB33_Q0","CLB33_Q1","CLB33_Q2","CLB33_Q3","CLB33_Q4","CLB33_Q5","CLB33_Q6","CLB33_Q7",
]
lutobjectDictionary = {}
for name in objectNames:
    lutobjectDictionary[name] = lut(name)



class switchBlock(object):
	def __init__(self,switchID):
		self.N=['X','X','X','X','X','X','X','X']  #the config for IO blocks should update the face nearest to it while coding
		self.E=['X','X','X','X','X','X','X','X'] #index and look up these lists using the face index of the switch blocks
		self.S=['X','X','X','X','X','X','X','X']
		self.W=['X','X','X','X','X','X','X','X']  #should say whether the port is input or output X, I, O states
		#port_signl_ids stores to which entity a signal belongs to X can belong to an IO port or CLB port(Q , RQ or CY)
		#index 0 to 7 => N , 8 to 15 => E, 16 to 23 => S ,24 to 31 => W
		self.port_signal_ids=['X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X']
		self.switchID=switchID
		self.status=0
		self.switchDict={'N0E0':'00','N0E1':'00','N0E2':'00','N0E3':'00','N0E4':'00','N0E5':'00','N0E6':'00','N0E7':'00','N0S0':'00',\
'N0S1':'00','N0S2':'00','N0S3':'00','N0S4':'00','N0S5':'00','N0S6':'00','N0S7':'00','N0W0':'00','N0W1':'00','N0W2':'00','N0W3':'00',\
'N0W4':'00','N0W5':'00','N0W6':'00','N0W7':'00','N1E0':'00','N1E1':'00','N1E2':'00','N1E3':'00','N1E4':'00','N1E5':'00','N1E6':'00',\
'N1E7':'00','N1S0':'00','N1S1':'00','N1S2':'00','N1S3':'00','N1S4':'00','N1S5':'00','N1S6':'00','N1S7':'00','N1W0':'00','N1W1':'00',\
'N1W2':'00','N1W3':'00','N1W4':'00','N1W5':'00','N1W6':'00','N1W7':'00','N2E0':'00','N2E1':'00','N2E2':'00','N2E3':'00','N2E4':'00',\
'N2E5':'00','N2E6':'00','N2E7':'00','N2S0':'00','N2S1':'00','N2S2':'00','N2S3':'00','N2S4':'00','N2S5':'00','N2S6':'00','N2S7':'00',\
'N2W0':'00','N2W1':'00','N2W2':'00','N2W3':'00','N2W4':'00','N2W5':'00','N2W6':'00','N2W7':'00','N3E0':'00','N3E1':'00','N3E2':'00',\
'N3E3':'00','N3E4':'00','N3E5':'00','N3E6':'00','N3E7':'00','N3S0':'00','N3S1':'00','N3S2':'00','N3S3':'00','N3S4':'00','N3S5':'00',\
'N3S6':'00','N3S7':'00','N3W0':'00','N3W1':'00','N3W2':'00','N3W3':'00','N3W4':'00','N3W5':'00','N3W6':'00','N3W7':'00','N4E0':'00',\
'N4E1':'00','N4E2':'00','N4E3':'00','N4E4':'00','N4E5':'00','N4E6':'00','N4E7':'00','N4S0':'00','N4S1':'00','N4S2':'00','N4S3':'00',\
'N4S4':'00','N4S5':'00','N4S6':'00','N4S7':'00','N4W0':'00','N4W1':'00','N4W2':'00','N4W3':'00','N4W4':'00','N4W5':'00','N4W6':'00',\
'N4W7':'00','N5E0':'00','N5E1':'00','N5E2':'00','N5E3':'00','N5E4':'00','N5E5':'00','N5E6':'00','N5E7':'00','N5S0':'00','N5S1':'00',\
'N5S2':'00','N5S3':'00','N5S4':'00','N5S5':'00','N5S6':'00','N5S7':'00','N5W0':'00','N5W1':'00','N5W2':'00','N5W3':'00','N5W4':'00',\
'N5W5':'00','N5W6':'00','N5W7':'00','N6E0':'00','N6E1':'00','N6E2':'00','N6E3':'00','N6E4':'00','N6E5':'00','N6E6':'00','N6E7':'00',\
'N6S0':'00','N6S1':'00','N6S2':'00','N6S3':'00','N6S4':'00','N6S5':'00','N6S6':'00','N6S7':'00','N6W0':'00','N6W1':'00','N6W2':'00',\
'N6W3':'00','N6W4':'00','N6W5':'00','N6W6':'00','N6W7':'00','N7E0':'00','N7E1':'00','N7E2':'00','N7E3':'00','N7E4':'00','N7E5':'00',\
'N7E6':'00','N7E7':'00','N7S0':'00','N7S1':'00','N7S2':'00','N7S3':'00','N7S4':'00','N7S5':'00','N7S6':'00','N7S7':'00','N7W0':'00',\
'N7W1':'00','N7W2':'00','N7W3':'00','N7W4':'00','N7W5':'00','N7W6':'00','N7W7':'00','E0W0':'00','E0W1':'00','E0W2':'00','E0W3':'00',\
'E0W4':'00','E0W5':'00','E0W6':'00','E0W7':'00','E0S0':'00','E0S1':'00','E0S2':'00','E0S3':'00','E0S4':'00','E0S5':'00','E0S6':'00',\
'E0S7':'00','E1W0':'00','E1W1':'00','E1W2':'00','E1W3':'00','E1W4':'00','E1W5':'00','E1W6':'00','E1W7':'00','E1S0':'00','E1S1':'00',\
'E1S2':'00','E1S3':'00','E1S4':'00','E1S5':'00','E1S6':'00','E1S7':'00','E2W0':'00','E2W1':'00','E2W2':'00','E2W3':'00','E2W4':'00',\
'E2W5':'00','E2W6':'00','E2W7':'00','E2S0':'00','E2S1':'00','E2S2':'00','E2S3':'00','E2S4':'00','E2S5':'00','E2S6':'00','E2S7':'00',\
'E3W0':'00','E3W1':'00','E3W2':'00','E3W3':'00','E3W4':'00','E3W5':'00','E3W6':'00','E3W7':'00','E3S0':'00','E3S1':'00','E3S2':'00',\
'E3S3':'00','E3S4':'00','E3S5':'00','E3S6':'00','E3S7':'00','E4W0':'00','E4W1':'00','E4W2':'00','E4W3':'00','E4W4':'00','E4W5':'00',\
'E4W6':'00','E4W7':'00','E4S0':'00','E4S1':'00','E4S2':'00','E4S3':'00','E4S4':'00','E4S5':'00','E4S6':'00','E4S7':'00','E5W0':'00',\
'E5W1':'00','E5W2':'00','E5W3':'00','E5W4':'00','E5W5':'00','E5W6':'00','E5W7':'00','E5S0':'00','E5S1':'00','E5S2':'00','E5S3':'00',\
'E5S4':'00','E5S5':'00','E5S6':'00','E5S7':'00','E6W0':'00','E6W1':'00','E6W2':'00','E6W3':'00','E6W4':'00','E6W5':'00','E6W6':'00',\
'E6W7':'00','E6S0':'00','E6S1':'00','E6S2':'00','E6S3':'00','E6S4':'00','E6S5':'00','E6S6':'00','E6S7':'00','E7W0':'00','E7W1':'00',\
'E7W2':'00','E7W3':'00','E7W4':'00','E7W5':'00','E7W6':'00','E7W7':'00','E7S0':'00','E7S1':'00','E7S2':'00','E7S3':'00','E7S4':'00',\
'E7S5':'00','E7S6':'00','E7S7':'00','S0W0':'00','S0W1':'00','S0W2':'00','S0W3':'00','S0W4':'00','S0W5':'00','S0W6':'00','S0W7':'00',\
'S1W0':'00','S1W1':'00','S1W2':'00','S1W3':'00','S1W4':'00','S1W5':'00','S1W6':'00','S1W7':'00','S2W0':'00','S2W1':'00','S2W2':'00',\
'S2W3':'00','S2W4':'00','S2W5':'00','S2W6':'00','S2W7':'00','S3W0':'00','S3W1':'00','S3W2':'00','S3W3':'00','S3W4':'00','S3W5':'00',\
'S3W6':'00','S3W7':'00','S4W0':'00','S4W1':'00','S4W2':'00','S4W3':'00','S4W4':'00','S4W5':'00','S4W6':'00','S4W7':'00','S5W0':'00',\
'S5W1':'00','S5W2':'00','S5W3':'00','S5W4':'00','S5W5':'00','S5W6':'00','S5W7':'00','S6W0':'00','S6W1':'00','S6W2':'00','S6W3':'00',\
'S6W4':'00','S6W5':'00','S6W6':'00','S6W7':'00','S7W0':'00','S7W1':'00','S7W2':'00','S7W3':'00','S7W4':'00','S7W5':'00','S7W6':'00',\
'S7W7':'00'}
	
	def set_port_signal_ids(self,face,index): #helper function to set the port_signal_ids list of the SB
		if(face=='N'):
			return index
		if(face=='E'):
			return index+8
		if(face=='S'):
			return index+16
		if(face=='W'):
			return index+24



	def faceValue(self,face):
		if face=='N':
			return 0
		elif face=='E':
			return 1
		elif face=='S':
			return 2
		else:
			return 3

	def setFaceStatus(self,face,index,setVal):
		if face=='N':
			self.N[index]=setVal
		elif face=='E':
			self.E[index]=setVal
		elif face=='S':
			self.S[index]=setVal
		else:
			self.W[index]=setVal

	def getFaceStatus(self,face,index):
		indexnum=int(index)
		if face=='N':
			return self.N[indexnum]
		elif face=='E':
			return self.E[indexnum]
		elif face=='S':
			return self.S[indexnum]
		else:
			return self.W[indexnum]

	def adjSBface(self,toFace):

		if toFace=='N':
			adjface='S'
		elif toFace=='S':
			adjface='N'
		elif toFace=='E':
			adjface='W'
		else:
			adjface='E'
		return adjface
	
	def configSBNext(self,switchID,toFace,toFaceIndex):
		
		if toFace=='N':
			
			index=0
			return SB_connect[switchID][0]
		elif toFace=='E':
			index=1
			return SB_connect[switchID][1]
		elif toFace=='S':
			index=2
			return	SB_connect[switchID][2]
		else:
			index=3
			return	SB_connect[switchID][3]
						
	
	def configSwitchBlock(self,switchID,fromFace,fromFaceIndex,toFace,toFaceIndex):
		self.status=1
		toFaceIndexnum=int(toFaceIndex)
		fromFaceIndexnum=int(fromFaceIndex)
		if(switchBlock.faceValue(self,fromFace)<switchBlock.faceValue(self,toFace)):
			switchKey= str(fromFace+fromFaceIndex+toFace+toFaceIndex)
			#print 'switchKey : %s'%switchKey
		else:
			switchKey= str(toFace+toFaceIndex+fromFace+fromFaceIndex)
			#print 'switchKey : %s'%switchKey
		self.switchID=switchID
		if(fromFace==toFace):
			print 'raise exception cannot have connections in the same face'
		else:
			if(switchBlock.getFaceStatus(self,fromFace,fromFaceIndexnum)=='I' or switchBlock.getFaceStatus(self,fromFace,fromFaceIndexnum)=='Q'):
				if(switchBlock.getFaceStatus(self,toFace,toFaceIndexnum)=='X'):
					switchBlock.setFaceStatus(self,toFace,toFaceIndexnum,'I')
					if(switchBlock.faceValue(self,fromFace)<switchBlock.faceValue(self,toFace)):
						print 'switch ID %s fromFace %s fromFaceIndex %s toFace %s toFaceIndex %s switchKey %s'%(switchID,fromFace,fromFaceIndex,toFace,toFaceIndex,switchKey)
						SBobjectDictionary[switchID].switchDict[switchKey]="11"
					else:	
						print 'switch ID %s fromFace %s fromFaceIndex %s toFace %s toFaceIndex %s switchKey %s'%(switchID,fromFace,fromFaceIndex,toFace,toFaceIndex,switchKey)
						SBobjectDictionary[switchID].switchDict[switchKey]="10"
					if(switchBlock.configSBNext(self,switchID,toFace,toFaceIndex)!='X'):
						switchBlock.setFaceStatus(switchBlock.configSBNext(SBobjectDictionary[switchID],switchID,toFace,toFaceIndex),switchBlock.adjSBface(SBobjectDictionary[switchID],toFace),toFaceIndexnum,'I')
					
				else:
					print 'both ports are signals:signal collission. I and I or I and O'
				
			elif(switchBlock.getFaceStatus(self,fromFace,fromFaceIndexnum)=='O'):
				if(switchBlock.getFaceStatus(self,toFace,toFaceIndexnum)=='X'):
					switchBlock.setFaceStatus(self,toFace,toFaceIndexnum,'O')
					#if(switchBlock.configSBNext(self,switchID,toFace,toFaceIndex)!='X'):
					#	switchBlock.setFaceStatus(switchBlock.configSBNext(SBobjectDictionary[switchID],switchID,toFace,toFaceIndex),switchBlock.adjSBface(SBobjectDictionary[switchID],toFace),toFaceIndexnum,'O')
					
				else:
					print 'both ports are signals:signal collission'
				if(switchBlock.faceValue(self,fromFace)<switchBlock.faceValue(self,toFace)):
					self.switchDict[switchKey]="10"
				else:
					self.switchDict[switchKey]="11"


			else:
				print 'no signal at from port switchID: %s,fromFace: %s port: %s'%(switchID,fromFace,fromFaceIndexnum)
	def gen_SB_bits(self):
		SB_switchList=["N0E0","N0E1","N0E2","N0E3","N0E4","N0E5","N0E6","N0E7","N0S0","N0S1","N0S2","N0S3","N0S4","N0S5","N0S6","N0S7","N0W0","N0W1","N0W2",
		"N0W3","N0W4","N0W5","N0W6","N0W7","N1E0","N1E1","N1E2","N1E3","N1E4","N1E5","N1E6","N1E7","N1S0","N1S1","N1S2","N1S3","N1S4","N1S5",
		"N1S6","N1S7","N1W0","N1W1","N1W2","N1W3","N1W4","N1W5","N1W6","N1W7","N2E0","N2E1","N2E2","N2E3","N2E4","N2E5","N2E6","N2E7","N2S0",
		"N2S1","N2S2","N2S3","N2S4","N2S5","N2S6","N2S7","N2W0","N2W1","N2W2","N2W3","N2W4","N2W5","N2W6","N2W7","N3E0","N3E1","N3E2","N3E3",
		"N3E4","N3E5","N3E6","N3E7","N3S0","N3S1","N3S2","N3S3","N3S4","N3S5","N3S6","N3S7","N3W0","N3W1","N3W2","N3W3","N3W4","N3W5","N3W6",
		"N3W7","N4E0","N4E1","N4E2","N4E3","N4E4","N4E5","N4E6","N4E7","N4S0","N4S1","N4S2","N4S3","N4S4","N4S5","N4S6","N4S7","N4W0","N4W1",
		"N4W2","N4W3","N4W4","N4W5","N4W6","N4W7","N5E0","N5E1","N5E2","N5E3","N5E4","N5E5","N5E6","N5E7","N5S0","N5S1","N5S2","N5S3","N5S4",
		"N5S5","N5S6","N5S7","N5W0","N5W1","N5W2","N5W3","N5W4","N5W5","N5W6","N5W7","N6E0","N6E1","N6E2","N6E3","N6E4","N6E5","N6E6","N6E7",
		"N6S0","N6S1","N6S2","N6S3","N6S4","N6S5","N6S6","N6S7","N6W0","N6W1","N6W2","N6W3","N6W4","N6W5","N6W6","N6W7","N7E0","N7E1","N7E2",
		"N7E3","N7E4","N7E5","N7E6","N7E7","N7S0","N7S1","N7S2","N7S3","N7S4","N7S5","N7S6","N7S7","N7W0","N7W1","N7W2","N7W3","N7W4","N7W5",
		"N7W6","N7W7","E0W0","E0W1","E0W2","E0W3","E0W4","E0W5","E0W6","E0W7","E0S0","E0S1","E0S2","E0S3","E0S4","E0S5","E0S6","E0S7","E1W0",
		"E1W1","E1W2","E1W3","E1W4","E1W5","E1W6","E1W7","E1S0","E1S1","E1S2","E1S3","E1S4","E1S5","E1S6","E1S7","E2W0","E2W1","E2W2","E2W3",
		"E2W4","E2W5","E2W6","E2W7","E2S0","E2S1","E2S2","E2S3","E2S4","E2S5","E2S6","E2S7","E3W0","E3W1","E3W2","E3W3","E3W4","E3W5","E3W6",
		"E3W7","E3S0","E3S1","E3S2","E3S3","E3S4","E3S5","E3S6","E3S7","E4W0","E4W1","E4W2","E4W3","E4W4","E4W5","E4W6","E4W7","E4S0","E4S1",
		"E4S2","E4S3","E4S4","E4S5","E4S6","E4S7","E5W0","E5W1","E5W2","E5W3","E5W4","E5W5","E5W6","E5W7","E5S0","E5S1","E5S2","E5S3","E5S4",
		"E5S5","E5S6","E5S7","E6W0","E6W1","E6W2","E6W3","E6W4","E6W5","E6W6","E6W7","E6S0","E6S1","E6S2","E6S3","E6S4","E6S5","E6S6","E6S7",
		"E7W0","E7W1","E7W2","E7W3","E7W4","E7W5","E7W6","E7W7","E7S0","E7S1","E7S2","E7S3","E7S4","E7S5","E7S6","E7S7","S0W0","S0W1","S0W2",
		"S0W3","S0W4","S0W5","S0W6","S0W7","S1W0","S1W1","S1W2","S1W3","S1W4","S1W5","S1W6","S1W7","S2W0","S2W1","S2W2","S2W3","S2W4","S2W5",
		"S2W6","S2W7","S3W0","S3W1","S3W2","S3W3","S3W4","S3W5","S3W6","S3W7","S4W0","S4W1","S4W2","S4W3","S4W4","S4W5","S4W6","S4W7","S5W0",
		"S5W1","S5W2","S5W3","S5W4","S5W5","S5W6","S5W7","S6W0","S6W1","S6W2","S6W3","S6W4","S6W5","S6W6","S6W7","S7W0","S7W1","S7W2","S7W3",
		"S7W4","S7W5","S7W6","S7W7"]

		sb_bits=''

		for i in SB_switchList:
			sb_bits=sb_bits+self.switchDict[i]
		return sb_bits
		
		
		
SBobjectNames = ["00", "01", "02", "03", "04","10", "11", "12", "13", "14","20", "21", "22", "23", "24",
				"30", "31", "32", "33", "34","40", "41", "42", "43", "44"]
       
SBobjectDictionary = {}
for name in SBobjectNames:
    SBobjectDictionary[name] = switchBlock(name)




#SB_connect keyvalue: SBId  values: objects opposite to faces N,E,S,W of the keyed SB... X represents no SB

SB_connect={"00":['X',SBobjectDictionary['01'],SBobjectDictionary['10'],'X'],
	"01":['X',SBobjectDictionary['02'],SBobjectDictionary['11'],SBobjectDictionary['00']],
	"02":['X',SBobjectDictionary['03'],SBobjectDictionary['12'],SBobjectDictionary['01']],
	"03":['X',SBobjectDictionary['04'],SBobjectDictionary['13'],SBobjectDictionary['02']],
	"04":['X','X',SBobjectDictionary['14'],SBobjectDictionary['03']],
	"10":[SBobjectDictionary['00'],SBobjectDictionary['11'],SBobjectDictionary['20'],'X'],
	"11":[SBobjectDictionary['01'],SBobjectDictionary['12'],SBobjectDictionary['21'],SBobjectDictionary['10']],
	"12":[SBobjectDictionary['02'],SBobjectDictionary['13'],SBobjectDictionary['22'],SBobjectDictionary['11']],
	"13":[SBobjectDictionary['03'],SBobjectDictionary['14'],SBobjectDictionary['23'],SBobjectDictionary['12']],
	"14":[SBobjectDictionary['04'],'X',SBobjectDictionary['24'],SBobjectDictionary['13']],
	"20":[SBobjectDictionary['10'],SBobjectDictionary['21'],SBobjectDictionary['30'],'X'],
	"21":[SBobjectDictionary['11'],SBobjectDictionary['22'],SBobjectDictionary['31'],SBobjectDictionary['20']],
	"22":[SBobjectDictionary['12'],SBobjectDictionary['23'],SBobjectDictionary['32'],SBobjectDictionary['21']],
	"23":[SBobjectDictionary['13'],SBobjectDictionary['24'],SBobjectDictionary['33'],SBobjectDictionary['22']],
	"24":[SBobjectDictionary['14'],'X',SBobjectDictionary['34'],SBobjectDictionary['23']],	
	"30":[SBobjectDictionary['20'],SBobjectDictionary['31'],SBobjectDictionary['40'],'X'],
	"31":[SBobjectDictionary['21'],SBobjectDictionary['32'],SBobjectDictionary['41'],SBobjectDictionary['30']],
	"32":[SBobjectDictionary['22'],SBobjectDictionary['33'],SBobjectDictionary['42'],SBobjectDictionary['31']],
	"33":[SBobjectDictionary['23'],SBobjectDictionary['34'],SBobjectDictionary['43'],SBobjectDictionary['32']],
	"34":[SBobjectDictionary['24'],'X',SBobjectDictionary['44'],SBobjectDictionary['33']],
	"40":[SBobjectDictionary['30'],SBobjectDictionary['41'],'X','X'],
	"41":[SBobjectDictionary['31'],SBobjectDictionary['42'],'X',SBobjectDictionary['40']],
	"42":[SBobjectDictionary['32'],SBobjectDictionary['43'],'X',SBobjectDictionary['41']],
	"43":[SBobjectDictionary['33'],SBobjectDictionary['44'],'X',SBobjectDictionary['42']],
	"44":[SBobjectDictionary['34'],'X','X',SBobjectDictionary['43']]
		}


class IOBlocks(object):
	def __init__(self,ioId):
		self.ioId=ioId
		self.ioConf=['X','X','X','X','X','X','X','X']
		self.status=0
		#key: the global line id  values: bits for setting the switch
		self.ioDict={"0":'00',"1":'00',"2":'00',"3":'00',"4":'00',"5":'00',"6":'00',"7":'00'} 
	def setIOBits(self,port):
		if(port=='I'):
			return '11'  #signal flows from IO port to SB port
		elif(port=='O'):
			return '10' #signal flows from SB port to IO port
		else:
			return '00'  #inactive IO port
		
	def configIO(self,ioId,pt0,pt1,pt2,pt3,pt4,pt5,pt6,pt7):
		self.ioId=ioId
		self.status=1
		self.ioConf[0]=pt0;
		self.ioConf[1]=pt1;
		self.ioConf[2]=pt2;
		self.ioConf[3]=pt3;
		self.ioConf[4]=pt4;
		self.ioConf[5]=pt5;
		self.ioConf[6]=pt6;
		self.ioConf[7]=pt7;
		ptrs=[pt0,pt1,pt2,pt3,pt4,pt5,pt6,pt7]
		ioPortName=''

		for m in range(0,8):
			index_m=str(m)
			self.ioDict[index_m]=IOBlocks.setIOBits(self,self.ioConf[m])
		
		index=0  #for keeping track of all 8 ports of the IO
		for i in ptrs:
			if index<8:  #setting the adjacent SB ports to I or O based on each IO block
				ioPortName='IO'+ioId+'_'+str(i)
				switchBlock.setFaceStatus(SBobjectDictionary[IO_connect[ioId][0]],IO_connect[ioId][1],index,i)
				index=index+1
	def printIObits(self):
		IO_switch_list=['0','1','2','3','4','5','6','7'] #stores the id of each IO port
		bits=''
		for switch in IO_switch_list:  #constructing the bit stream for the IO object
			bits=bits+self.ioDict[switch]
		return bits
			
		
	
	

IOobjectNames = ["00", "01", "02", "03","04","10", "11", "20", "21","30","31","40","41","50","51","60", "61", "62", "63","64"]
	       
IOobjectDictionary = {}
for name in IOobjectNames:
    IOobjectDictionary[name] = IOBlocks(name)

#IO_connect key value=io_block ID values: i)adjacent switch block ii) face of adjacent SB facing the IO port 

IO_connect={"00":['00','N'],"01":['01','N'],"02":['02','N'], "03":['03','N'],"04":['04','N'], 
			"10":['00','W'],"11":['04','E'], 
			"20":['10','W'],"21":['14','E'],
			"30":['20','W'],"31":['24','E'], 
			"40":['30','W'],"41":['34','E'], 
			"50":['40','W'],"51":['44','E'], 
			"60":['40','S'],"61":['41','S'],"62":['42','S'], "63":['43','S'],"64":['44','S']	   	
	    }
		

class connectionBlock(object):   #fix input and output port collission
	def __init__(self,cbId):
		self.x1='X'
		self.x2='X'
		self.x3='X'
		self.x4='X'
		self.q1='X'
		self.q2='X'
		self.Rq1='X'
		self.Rq2='X'
		self.CY1='X'
		self.CY2='X'
		self.CBstate=['X','X','X','X','X','X','X','X','X','X'] #stores the state of each CB port
		self.cbId=cbId
		self.status=0
		#CBDict stores the switch Id of the CB switches as its key and the switch status as its value, val=0 (switch is off) val=1 (Switch On)
		self.CBDict={"x1_G0":'0',"x2_G0":'0',"x3_G0":'0',"x4_G0":'0',"q1_G0":'0',"q2_G0":'0',
			     		"x1_G1":'0',"x2_G1":'0',"x3_G1":'0',"x4_G1":'0',"q1_G1":'0',"q2_G1":'0',
			     "x1_G2":'0',"x2_G2":'0',"x3_G2":'0',"x4_G2":'0',"q1_G2":'0',"q2_G2":'0',
		         "x1_G3":'0',"x2_G3":'0',"x3_G3":'0',"x4_G3":'0',"q1_G3":'0',"q2_G3":'0',
			     "x1_G4":'0',"x2_G4":'0',"x3_G4":'0',"x4_G4":'0',"q1_G4":'0',"q2_G4":'0',
			     "x1_G5":'0',"x2_G5":'0',"x3_G5":'0',"x4_G5":'0',"q1_G5":'0',"q2_G5":'0',
			     "x1_G6":'0',"x2_G6":'0',"x3_G6":'0',"x4_G6":'0',"q1_G6":'0',"q2_G6":'0',
		         "x1_G7":'0',"x2_G7":'0',"x3_G7":'0',"x4_G7":'0',"q1_G7":'0',"q2_G7":'0',
		         "Rq1_G0":'0',"Rq2_G0":'0',"Rq1_G1":'0',"Rq2_G1":'0',
				"Rq1_G2":'0',"Rq2_G2":'0',"Rq1_G3":'0',"Rq2_G3":'0',
				"Rq1_G4":'0',"Rq2_G4":'0',"Rq1_G5":'0',"Rq2_G5":'0',
				"Rq1_G6":'0',"Rq2_G6":'0',"Rq1_G7":'0',"Rq2_G7":'0',
				"CY1_G0":'0',"CY2_G0":'0',"CY1_G1":'0',"CY2_G1":'0',
				"CY1_G2":'0',"CY2_G2":'0',"CY1_G3":'0',"CY2_G3":'0',
				"CY1_G4":'0',"CY2_G4":'0',"CY1_G5":'0',"CY2_G5":'0',
				"CY1_G6":'0',"CY2_G6":'0',"CY1_G7":'0',"CY2_G7":'0'
		            }
			

	def getLineCode(self,line): #gives the value corresponding to the line code
		if line=='0':
			return 'G0'
		elif line=='1':
			return 'G1'
		elif line=='2':
			return 'G2'
		elif line=='3':
			return 'G3'
		elif line=='4':
			return 'G4'
		elif line=='5':
			return 'G5'
		elif line=='6':
			return 'G6'
		else:
			return 'G7'

	def getting_SB_line_status(self,cbId,LorR,port): #function that returns the state of a line running between the SB on either side of the current CB 
		if(LorR=='left'):
			direc=1
		else:
			direc=3
		if CB_connect[cbId][direc+1]=='N':
			return SBobjectDictionary[CB_connect[cbId][direc]].N[port]
		elif CB_connect[cbId][direc+1]=='E':
			return SBobjectDictionary[CB_connect[cbId][direc]].E[port]
		elif CB_connect[cbId][direc+1]=='S':
			return SBobjectDictionary[CB_connect[cbId][direc]].S[port]
		else:
			return SBobjectDictionary[CB_connect[cbId][direc]].W[port]	


	def CB_AdjSB_conf(self,cbId,leftSB,rightSB,CBPortId,CBDictKey): #helper function to configure CB and the two SB on either of its sides
		 	if(leftSB=='X' and rightSB=='X'):
				leftFace=CB_connect[cbId][2]
				rightFace=CB_connect[cbId][4]
				switchBlock.setFaceStatus(SBobjectDictionary[CB_connect[cbId][1]],leftFace,CBPortId,'Q')
				switchBlock.setFaceStatus(SBobjectDictionary[CB_connect[cbId][3]],rightFace,CBPortId,'Q')
				self.CBDict[CBDictKey]='1'
				print 'CBcode and output stats %s %s'%(cbId,self.CBDict[CBDictKey])				
			elif(leftSB=='O' and rightSB=='X'): #think about this case
				leftFace=CB_connect[cbId][2]
				rightFace=CB_connect[cbId][4]
				switchBlock.setFaceStatus(SBobjectDictionary[CB_connect[cbId][1]],leftFace,CBPortId,'O') #think about this case
				switchBlock.setFaceStatus(SBobjectDictionary[CB_connect[cbId][3]],rightFace,CBPortId,'Q') #added 16-April
				self.CBDict[CBDictKey]='1'
			elif(leftSB=='X' and rightSB=='O'):		
				rightFace=CB_connect[cbId][4]
				leftFace=CB_connect[cbId][2]
				switchBlock.setFaceStatus(SBobjectDictionary[CB_connect[cbId][3]],rightFace,CBPortId,'O')
				switchBlock.setFaceStatus(SBobjectDictionary[CB_connect[cbId][1]],leftFace,CBPortId,'Q')#added 16-April
				self.CBDict[CBDictKey]='1'
			elif(leftSB=='O' and rightSB=='O'):
				print 'cannot connect: output line already in use: Error in CB: %s'%cbId	

	def configCB(self,cbId,x1,x2,x3,x4,q1,q2,Rq1,Rq2,CY1,CY2):
		self.cbId=cbId
		self.x1=x1
		self.x2=x2
		self.x3=x3
		self.x4=x4
		self.q1=q1
		self.q2=q2
		self.Rq1=Rq1
		self.Rq2=Rq2
		self.CY1=CY1
		self.CY2=CY2
		self.CBstate=[self.x1,self.x2,self.x3,self.x4,self.q1,self.q2,self.Rq1,self.Rq2,self.CY1,self.CY2]
		self.status=1
		CBDictKeyx1=str('x1_'+connectionBlock.getLineCode(self,self.x1))
		CBDictKeyx2=str('x2_'+connectionBlock.getLineCode(self,self.x2))
		CBDictKeyx3=str('x3_'+connectionBlock.getLineCode(self,self.x3))
		CBDictKeyx4=str('x4_'+connectionBlock.getLineCode(self,self.x4))
		CBDictKeyq1=str('q1_'+connectionBlock.getLineCode(self,self.q1))
		CBDictKeyq2=str('q2_'+connectionBlock.getLineCode(self,self.q2))
		CBDictKeyRq1=str('Rq1_'+connectionBlock.getLineCode(self,self.Rq1))
		CBDictKeyRq2=str('Rq2_'+connectionBlock.getLineCode(self,self.Rq2))
		CBDictKeyCY1=str('CY1_'+connectionBlock.getLineCode(self,self.CY1))
		CBDictKeyCY2=str('CY2_'+connectionBlock.getLineCode(self,self.CY2))

		if self.x1!='X':
			val=int(self.x1)
			leftSB=connectionBlock.getting_SB_line_status(self,cbId,'left',val)
			rightSB=connectionBlock.getting_SB_line_status(self,cbId,'right',val)
			if(leftSB=='I' and rightSB=='I'):
				self.CBDict[CBDictKeyx1]='1'
			else:
				print 'no input sigal at port: %s of CBId: %s'%(self.x1,cbId)
		else: 
			self.CBDict[CBDictKeyx1]='0'	
		if self.x2!='X':
			val=int(self.x2)
			leftSB=connectionBlock.getting_SB_line_status(self,cbId,'left',val)
			rightSB=connectionBlock.getting_SB_line_status(self,cbId,'right',val)
			if(leftSB=='I' and rightSB=='I'):
				self.CBDict[CBDictKeyx2]='1'
			else:
				print 'no input sigal at port: %s of CBId: %s'%(self.x2,cbId)
		else: 
			self.CBDict[CBDictKeyx2]='0'
		if self.x3!='X':
			val=int(self.x3)
			leftSB=connectionBlock.getting_SB_line_status(self,cbId,'left',val)
			rightSB=connectionBlock.getting_SB_line_status(self,cbId,'right',val)
			if(leftSB=='I' and rightSB=='I'):
				self.CBDict[CBDictKeyx3]='1'
			else:
				print 'no input sigal at port: %s of CBId: %s'%(self.x3,cbId)
		else: 
			self.CBDict[CBDictKeyx3]='0'
		if self.x4!='X':
			val=int(self.x4)
			leftSB=connectionBlock.getting_SB_line_status(self,cbId,'left',val)
			rightSB=connectionBlock.getting_SB_line_status(self,cbId,'right',val)
			if(leftSB=='I' and rightSB=='I'):
				self.CBDict[CBDictKeyx4]='1'
			else:
				print 'no input sigal at port: %s of CBId: %s'%(self.x4,cbId)
		else: 
			self.CBDict[CBDictKeyx4]='0'
		
		if self.q1!='X':     #Major
			val=int(self.q1)
			leftSB=connectionBlock.getting_SB_line_status(self,cbId,'left',val)
			rightSB=connectionBlock.getting_SB_line_status(self,cbId,'right',val)
			connectionBlock.CB_AdjSB_conf(self,cbId,leftSB,rightSB,val,CBDictKeyq1)
			
		
		if self.q2!='X':
			val=int(self.q2)
			leftSB=connectionBlock.getting_SB_line_status(self,cbId,'left',val)
			rightSB=connectionBlock.getting_SB_line_status(self,cbId,'right',val)
			connectionBlock.CB_AdjSB_conf(self,cbId,leftSB,rightSB,val,CBDictKeyq2)

		if self.Rq1!='X':   #see if this can be condensed further  #Major
			val=int(self.Rq1)
			leftSB=connectionBlock.getting_SB_line_status(self,cbId,'left',val)
			rightSB=connectionBlock.getting_SB_line_status(self,cbId,'right',val)
			connectionBlock.CB_AdjSB_conf(self,cbId,leftSB,rightSB,val,CBDictKeyRq1)
			
		
		if self.Rq2!='X':
			val=int(self.Rq2)
			leftSB=connectionBlock.getting_SB_line_status(self,cbId,'left',val)
			rightSB=connectionBlock.getting_SB_line_status(self,cbId,'right',val)
			connectionBlock.CB_AdjSB_conf(self,cbId,leftSB,rightSB,val,CBDictKeyRq2)

		if self.CY1!='X':   #see if this can be condensed further  #Major
			val=int(self.CY1)
			leftSB=connectionBlock.getting_SB_line_status(self,cbId,'left',val)
			rightSB=connectionBlock.getting_SB_line_status(self,cbId,'right',val)
			connectionBlock.CB_AdjSB_conf(self,cbId,leftSB,rightSB,val,CBDictKeyCY1)
			
		
		if self.CY2!='X':
			val=int(self.CY2)
			leftSB=connectionBlock.getting_SB_line_status(self,cbId,'left',val)
			rightSB=connectionBlock.getting_SB_line_status(self,cbId,'right',val)
			connectionBlock.CB_AdjSB_conf(self,cbId,leftSB,rightSB,val,CBDictKeyCY2)
			
		
	def printCBconfig(self):
		dictKeylist=["x1_G0","x2_G0","x3_G0","x4_G0","q1_G0","q2_G0","Rq1_G0","Rq2_G0","CY1_G0","CY2_G0",
			     "x1_G1","x2_G1","x3_G1","x4_G1","q1_G1","q2_G1","Rq1_G1","Rq2_G1","CY1_G1","CY2_G1",
			     "x1_G2","x2_G2","x3_G2","x4_G2","q1_G2","q2_G2","Rq1_G2","Rq2_G2","CY1_G2","CY2_G2",
		             "x1_G3","x2_G3","x3_G3","x4_G3","q1_G3","q2_G3","Rq1_G3","Rq2_G3","CY1_G3","CY2_G3",
			     "x1_G4","x2_G4","x3_G4","x4_G4","q1_G4","q2_G4","Rq1_G4","Rq2_G4","CY1_G4","CY2_G4",
			     "x1_G5","x2_G5","x3_G5","x4_G5","q1_G5","q2_G5","Rq1_G5","Rq2_G5","CY1_G5","CY2_G5",
			     "x1_G6","x2_G6","x3_G6","x4_G6","q1_G6","q2_G6","Rq1_G6","Rq2_G6","CY1_G6","CY2_G6",
		             "x1_G7","x2_G7","x3_G7","x4_G7","q1_G7","q2_G7","Rq1_G7","Rq2_G7","CY1_G7","CY2_G7"]
		s=''
		m=''
		for k in dictKeylist:
			m=m+' '+k
		for i in dictKeylist:
			s=s+self.CBDict[i]
		#print m
		
		return s
		



CB_objects=["00_0","00_1","00_2","00_3","01_0","01_1","01_2","01_3","02_0","02_1","02_2","02_3","03_0","03_1","03_2","03_3","10_0","10_1","10_2","10_3","11_0","11_1","11_2","11_3",
			"12_0","12_1","12_2","12_3","13_0","13_1","13_2","13_3","20_0","20_1","20_2","20_3","21_0","21_1","21_2","21_3","22_0","22_1","22_2","22_3","23_0","23_1","23_2","23_3",
			"30_0","30_1","30_2","30_3","31_0","31_1","31_2","31_3","32_0","32_1","32_2","32_3","33_0","33_1","33_2","33_3"]
			

CBobjectDictionary = {}
for name in CB_objects:
    CBobjectDictionary[name] = connectionBlock(name)


#SB_Map_code key:SB code ---values:code representing the SB on the CB_SB_map dictionary
SB_Map_code = {"00":"SB00", "01":"SB01", "02":"SB02", "03":"SB03", "04":"SB04",
				"10":"SB10", "11":"SB11", "12":"SB12", "13":"SB13", "14":"SB14",
				"20":"SB20", "21":"SB21", "22":"SB22", "23":"SB23", "24":"SB24",
				"30":"SB30", "31":"SB31", "32":"SB32", "33":"SB33", "34":"SB34",
				"40":"SB40", "41":"SB41", "42":"SB42", "43":"SB43", "44":"SB44"
				}
	       
#CB_Map_code key:CB code ----values:code representing the CB on the CB_SB_map dictionary
CB_map_code={
		"00_0":'C1',"00_1":'C2',"00_2":'C3',"00_3":'C4',
	    "01_0":'C5',"01_1":'C6',"01_2":'C7',"01_3":'C2',
	    "02_0":'C8',"02_1":'C9',"02_2":'C10',"02_3":'C6',
	     "03_0":'C11',"03_1":'C12',"03_2":'C13',"03_3":'C9',
	     "10_0":'C3',"10_1":'C15',"10_2":'C16',"10_3":'C14',
	    "11_0":'C7',"11_1":'C17',"11_2":'C18',"11_3":'C15',
	    "12_0":'C10',"12_1":'C19',"12_2":'C20',"12_3":'C17',
	     "13_0":'C13',"13_1":'C21',"13_2":'C22',"13_3":'C19',
		"20_0":'C16',"20_1":'C24',"20_2":'C25',"20_3":'C23',
	    "21_0":'C18',"21_1":'C26',"21_2":'C27',"21_3":'C24',
	    "22_0":'C20',"22_1":'C28',"22_2":'C29',"22_3":'C26',
	     "23_0":'C22',"13_1":'C30',"23_2":'C31',"23_3":'C28', 
	     "30_0":'C25',"30_1":'C33',"30_2":'C34',"30_3":'C32',
	    "31_0":'C27',"31_1":'C35',"31_2":'C36',"31_3":'C33',
	    "32_0":'C29',"32_1":'C37',"32_2":'C38',"32_3":'C35',
	     "33_0":'C31',"33_1":'C39',"33_2":'C40',"33_3":'C37'           
	   }

#00, 01,02 etc. represents the SB and C4,C1 etc. represent the code for Switch blocks

CB_SB_map={
	 "00":{'C1':1,'01':1,'C4':1,'10':1},       
	 "01":{'00':1,'02':1,'11':1,'C1':1,'C5':1,'C2':1},
	 "02":{'01':1,'12':1,'03':1,'C5':1,'C8':1,'C6':1},
	 "03":{'02':1,'04':1,'13':1,'C8':1,'C9':1,'C11':1},
	 "04":{'03':1,'14':1,'C11':1,'C12':1},	 
	 "10":{'11':1,'20':1,'00':1,'C3':1,'C14':1,'C3':1},       
	 "11":{'10':1,'12':1,'21':1,'01':1,'C3':1,'C7':1,'C15':1,'C2':1},
	 "12":{'11':1,'13':1,'22':1,'02':1,'C7':1,'C10':1,'C17':1,'C6':1},
	 "13":{'12':1,'14':1,'23':1,'03':1,'C10':1,'C13':1,'C19':1,'C9':1},
	 "14":{'13':1,'24':1,'04':1,'C13':1,'C21':1,'C12':1},
	 "20":{'21':1,'30':1,'10':1,'C14':1,'C16':1,'C23':1},       
	 "21":{'11':1,'20':1,'22':1,'31':1,'C16':1,'C18':1,'C24':1,'C15':1},
	 "22":{'12':1,'21':1,'23':1,'32':1,'C18':1,'C20':1,'C26':1,'C17':1},
	 "23":{'22':1,'24':1,'33':1,'13':1,'C20':1,'C22':1,'C28':1,'C19':1},
	 "24":{'23':1,'34':1,'14':1,'C22':1,'C30':1,'C21':1},
	 "30":{'31':1,'40':1,'20':1,'C25':1,'C32':1,'C23':1},       
	 "31":{'30':1,'32':1,'41':1,'21':1,'C25':1,'C27':1,'C33':1,'C24':1},
	 "32":{'31':1,'33':1,'42':1,'22':1,'C27':1,'C29':1,'C35':1,'C26':1},
	 "33":{'23':1,'32':1,'34':1,'43':1,'C29':1,'C31':1,'C37':1,'C28':1},
	 "34":{'33':1,'44':1,'24':1,'C31':1,'C39':1,'C30':1},
	 "40":{'30':1,'41':1,'C32':1,'C34':1},       
	 "41":{'40':1,'31':1,'42':1,'C34':1,'C33':1,'C36':1},
	 "42":{'41':1,'32':1,'43':1,'C36':1,'C35':1,'C38':1},
	 "43":{'42':1,'33':1,'44':1,'C38':1,'C37':1,'C40':1},
	 "44":{'43':1,'34':1,'C40':1,'C39':1},
	 "C1":{'00':1,'01':1},
	 "C2":{'01':1,'11':1},
	 "C3":{'10':1,'11':1},
	 "C4":{'00':1,'10':1},
	 "C5":{'01':1,'02':1},
	 "C6":{'02':1,'12':1},
	 "C7":{'11':1,'12':1},
	 "C8":{'02':1,'03':1},
	 "C9":{'03':1,'13':1},
	 "C10":{'12':1,'13':1},
	 "C11":{'03':1,'04':1},
	 "C12":{'04':1,'14':1},
	 "C13":{'13':1,'14':1},
	 "C14":{'10':1,'20':1},
	 "C15":{'11':1,'21':1},
	 "C16":{'20':1,'21':1},
	 "C17":{'12':1,'22':1},
	 "C18":{'21':1,'22':1},
	 "C19":{'13':1,'23':1},
	 "C20":{'22':1,'23':1},
	 "C21":{'14':1,'24':1},
	 "C22":{'23':1,'24':1},
	 "C23":{'20':1,'30':1},
	 "C24":{'21':1,'31':1},
	 "C25":{'30':1,'31':1},
	 "C26":{'22':1,'32':1},
	 "C27":{'31':1,'32':1},
	 "C28":{'23':1,'33':1},
	 "C29":{'32':1,'33':1},
	 "C30":{'24':1,'34':1},
	 "C31":{'33':1,'34':1},
	 "C32":{'30':1,'40':1},
	 "C33":{'31':1,'41':1},
	 "C34":{'40':1,'41':1},
	 "C35":{'32':1,'42':1},
	 "C36":{'41':1,'42':1},
	 "C37":{'33':1,'43':1},
	 "C38":{'42':1,'43':1},
	 "C39":{'34':1,'44':1},
	 "C40":{'43':1,'44':1}
	 }

graph_nodes=[
	 "00","01", "02","03","04","10","11","12",
	 "13","14","20","21",
	 "22","23","24","30",
	 "31","32","33","34",
	 "40","41","42","43","44",
	 "C1", "C2","C3","C4",
	 "C5","C6","C7", "C8",
	 "C9","C10","C11","C12",
	 "C13","C14","C15","C16","C17","C18",
	 "C19","C20", "C21","C22", "C23","C24",
	 "C25","C26", "C27","C28",
	 "C29","C30", "C31","C32",
	 "C33","C34", "C35","C36",
	 "C37","C38", "C39","C40"  
	 ]


pa=[]
CB_codes=['C1','C2','C3','C4','C5','C6','C7','C8','C9','C10','C11','C12',
		'C13','C14','C15','C16','C17','C18','C19','C20','C21','C22',
		'C23','C24','C25','C26','C27','C28','C29','C30','C31','C32',
		'C33','C34','C35','C36','C37','C38','C39','C40']


##########################################routing logic begins#######################################################################################################################
def checkFreeSBPort_CBconnect(SBId,SBFace,x1,x2,x3,x4,CBId):   #function checks for the index corresponding to free ports on a side of the switch block -- free ports have their status as 'X'
	print 'inside checkFreeSBPort_CBconnect function : SBID %s SBFace %s CBId %s SBstate %s CBstate %s'%(SBId,SBFace,CBId,SBobjectDictionary[SBId].N,CBobjectDictionary[CBId].CBstate)
	flag=1
	counter=0
	final=0
	if(SBFace=='N'):
		while(flag==1 and counter<8):
			#print 'controvertial %s'%SBobjectDictionary[SBId].A[counter]
			if(SBobjectDictionary[SBId].N[counter] =='X'):  #check if any port in face A of the switch block adjacent to the from CB is free and its not connected to any of the inputs of the CB
				if(CBobjectDictionary[CBId].CBstate[0]!=str(counter) and CBobjectDictionary[CBId].CBstate[1]!=str(counter) and CBobjectDictionary[CBId].CBstate[2]!=str(counter) and CBobjectDictionary[CBId].CBstate[3]!=str(counter)):
					
					flag=0
					break
		
			counter=counter+1
			#print 'counter of A %s'%counter
			#continue	
				
				
							
	elif(SBFace=='E'):
		while(flag==1 and counter<8):
			if(SBobjectDictionary[SBId].E[counter] =='X'):
				if(CBobjectDictionary[CBId].CBstate[0]!=str(counter) or CBobjectDictionary[CBId].CBstate[1]!=str(counter) or CBobjectDictionary[CBId].CBstate[2]!=str(counter) or CBobjectDictionary[CBId].CBstate[3]!=str(counter)):
					
					flag=0
					break
			
			counter=counter+1
	elif(SBFace=='S'):
		while(flag==1 and counter<8):
			if(SBobjectDictionary[SBId].S[counter] =='X'):
				if(CBobjectDictionary[CBId].CBstate[0]!=str(counter) or CBobjectDictionary[CBId].CBstate[1]!=str(counter) or CBobjectDictionary[CBId].CBstate[2]!=str(counter) or CBobjectDictionary[CBId].CBstate[3]!=str(counter)):
					
					flag=0
					break
			
			counter=counter+1
	else:
		while(flag==1 and counter<8):
			if(SBobjectDictionary[SBId].W[counter] =='X'):
				if(CBobjectDictionary[CBId].CBstate[0]!=str(counter) or CBobjectDictionary[CBId].CBstate[1]!=str(counter) or CBobjectDictionary[CBId].CBstate[2]!=str(counter) or CBobjectDictionary[CBId].CBstate[3]!=str(counter)):
					
					flag=0
					break
			
			counter=counter+1


	final=counter  #kp
	counter=counter*0 
	return final   



def checkFreeSBPort(SBId,SBFace):   #function checks for the index corresponding to free ports on a side of the switch block -- free ports have their status as 'X'
	
	counter=0
	free_port=0
	if(SBFace=='N'):
		
		while(1):
			if(SBobjectDictionary[SBId].N[counter] !='X'):
				counter=counter+1
			else:
				break;
	elif(SBFace=='E'):
		while(1):
			if(SBobjectDictionary[SBId].E[counter] !='X'):
				counter=counter+1
			else:
				break;
	elif(SBFace=='S'):
		while(1):
			if(SBobjectDictionary[SBId].S[counter] !='X'):
				counter=counter+1
			else:
				break;
	else:
		while(1):
			if(SBobjectDictionary[SBId].W[counter] !='X'):
				counter=counter+1
			else:
				break;
	free_port=counter
	counter=counter*0
	if(free_port<8):
		return free_port
	else:
		print 'problem'
		return 999  #problem
		
		

def SBFaceStatus(SBId,SBFace):   #kp added to help in bug
	
	if(SBFace=='N'):		
		return 	SBobjectDictionary[SBId].N	
	elif(SBFace=='E'):
		return 	SBobjectDictionary[SBId].E
	elif(SBFace=='S'):
		return 	SBobjectDictionary[SBId].S
	else:
		return 	SBobjectDictionary[SBId].W
	

def FindNextSBPos(currentSBId,nextSBId): #uses the SB_connect dictionary to get the posotion of a switch block which is laocated facing a particular side of the SB
	counterSB=0
	if(SB_connect.has_key(currentSBId) and SB_connect.has_key(nextSBId)):
		while(SB_connect[currentSBId][counterSB]!=SBobjectDictionary[nextSBId]):
			counterSB=counterSB+1
	
		return counterSB
	else:
		return 999	 #look into the effect of this return value

def conf_lastSB(SBId,fromSBFace,fromSBPortIndex,toCB,route,targetLUT):  #kp the fuction that connects the last SB in the route to the target CB
	count=0		
	stats=[]
	stats= SBFaceStatus(SBId,fromSBFace)
	route_len=len(route)

	
	if CB_connect[toCB][1]==route[route_len-2]:		
		SBFace2=CB_connect[toCB][2]		
		toSBPortIndex=checkFreeSBPort(SBId,SBFace2)		
				
	elif CB_connect[toCB][3]==route[route_len-2]:		
		SBFace2=CB_connect[toCB][4]		
		toSBPortIndex=checkFreeSBPort(SBId,SBFace2)				
		
	print "SBID= %s OriginSBFace= %s OriginSBIndex= %s TaretSBFace= %s SBIndex= %s"%(SBId,fromSBFace,fromSBPortIndex,SBFace2,toSBPortIndex) 
	
	switchBlock.configSwitchBlock(SBobjectDictionary[SBId],SBId,fromSBFace,str(fromSBPortIndex),SBFace2,str(toSBPortIndex))
		
	i_count=0
	final_CB_index=0

	while(CBobjectDictionary[toCB].CBstate[i_count] !='X'):
		i_count=i_count+1
		if(i_count==4):
			break
	if(i_count==4):  
		i_count=i_count*0
		print 'ERROR: no free port on the target CB %s '%toCB
	else:	
		
		outputCB=''
		print 'CONFIGURING THE CONNECTION BETWEEN LAST SB AND THE TARGET CB'
		print 'CB connect[5] = %s CB connect[6] = %s CB connect[8] = %s CB connect[9] = %s CLBofTargetCB = %s LUT_connectCLB = %s targetLUT = %s'%(CB_connect[toCB][5],CB_connect[toCB][6],CB_connect[toCB][8],CB_connect[toCB][9],CB_connect[toCB][7],LUT_connect[targetLUT][0],targetLUT)
		if(CB_connect[toCB][7]==LUT_connect[targetLUT][0]): #neeed to modify KP
	#	if((CB_connect[toCB][5]==targetLUT or CB_connect[toCB][6]==targetLUT or CB_connect[toCB][8]==targetLUT or CB_connect[toCB][9]==targetLUT) and CB_connect[toCB][7]==LUT_connect[targetLUT][0]): #neeed to modify KP
			CBobjectDictionary[toCB].CBstate[i_count]=str(toSBPortIndex)
			x1=CBobjectDictionary[toCB].CBstate[0]
			x2=CBobjectDictionary[toCB].CBstate[1]
			x3=CBobjectDictionary[toCB].CBstate[2]
			x4=CBobjectDictionary[toCB].CBstate[3]
			q1=CBobjectDictionary[toCB].CBstate[4]
			q2=CBobjectDictionary[toCB].CBstate[5]
			Rq1=CBobjectDictionary[toCB].CBstate[6]  
			Rq2=CBobjectDictionary[toCB].CBstate[7]
			CY1=CBobjectDictionary[toCB].CBstate[8]  
			CY2=CBobjectDictionary[toCB].CBstate[9]
			CBobjectDictionary[toCB].configCB(toCB,x1,x2,x3,x4,q1,q2,Rq1,Rq2,CY1,CY2)
			final_CB_index=i_count
			i_count=i_count*0
			print'final CB Index from conf last CB %s'%final_CB_index
			return final_CB_index
			
		else:
			print 'incorrect origin LUT or target CB'
			return 999


def config_originCB_SB_connect(fromCB,CB_output_port,CB_output_port_ID,port_name,fromSBFace,SBId,toCB,route,targetLUT,x1,x2,x3,x4,q1,q2,Rq1,Rq2,CY1,CY2):  #helper function to connect origin CB to the immidiate SB in the route
	if(CB_output_port!='X'):																							#function is used when route length is equal to 3
		CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,q1,q2,Rq1,Rq2,CY1,CY2)
		SBobjectDictionary[SBId].setFaceStatus(fromSBFace,fromSBPortIndex,'Q')
		print 'starting SB %s %s port %s'%(SBId,fromSBFace,fromSBPortIndex)
		target_CB_port=conf_lastSB(SBId,fromSBFace,fromSBPortIndex,toCB,route,targetLUT)

	else:

	   	fromSBPortIndex=checkFreeSBPort_CBconnect(SBId,fromSBFace,x1,x2,x3,x4,fromCB)
		CBobjectDictionary[fromCB].CBstate[CB_output_port_ID]=str(fromSBPortIndex)
		CB_output_port=CBobjectDictionary[fromCB].CBstate[CB_output_port_ID]
		if(port_name=='q1'):
			CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,CB_output_port,q2,Rq1,Rq2,CY1,CY2)
		if(port_name=='q2'):
			CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,q1,CB_output_port,Rq1,Rq2,CY1,CY2)
		if(port_name=='Rq1'):
			CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,q1,q2,CB_output_port,Rq2,CY1,CY2)
		if(port_name=='Rq1'):
			CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,CB_output_port,q2,CB_output_port,Rq2,CY1,CY2)
		if(port_name=='CY1'):
			CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,CB_output_port,q2,Rq1,Rq2,CB_output_port,CY2)
		if(port_name=='CY2'):
			CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,CB_output_port,q2,Rq1,Rq2,CY1,CB_output_port)
		SBobjectDictionary[SBId].setFaceStatus(fromSBFace,fromSBPortIndex,'Q')
		print 'starting SB %s %s port %s'%(SBId,fromSBFace,fromSBPortIndex)
		target_CB_port=conf_lastSB(SBId,fromSBFace,fromSBPortIndex,toCB,route,targetLUT)

def config_originCB_SB_connect_RG3(fromCB,CB_output_port,CB_output_port_ID,port_name,fromSBFace,SBId,x1,x2,x3,x4,q1,q2,Rq1,Rq2,CY1,CY2):	#helper function to connect origin CB to the next SB port when route length is greater than 3
	
	if(CB_output_port!='X'):
		fromSBPortIndex=int(CBobjectDictionary[fromCB].CBstate[CB_output_port_ID])
		return fromSBPortIndex
		print 'Output Port Already Set as %s'%CBobjectDictionary[fromCB].CBstate

	else:
		fromSBPortIndex=checkFreeSBPort_CBconnect(SBId,fromSBFace,x1,x2,x3,x4,fromCB)
		CBobjectDictionary[fromCB].CBstate[CB_output_port_ID]=str(fromSBPortIndex)
		CB_output_port=CBobjectDictionary[fromCB].CBstate[CB_output_port_ID]
		if(port_name=='q1'):
			print 'INSIDE CONFIGURATION OF ORIGIN CB TO FIRST SB IN ROUTE'
			CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,CB_output_port,q2,Rq1,Rq2,CY1,CY2)
			print 'ERROR:oriport status CB %s'%CBobjectDictionary[fromCB].CBstate
		if(port_name=='q2'):
			CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,q1,CB_output_port,Rq1,Rq2,CY1,CY2)
		if(port_name=='Rq1'):
			CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,q1,q2,CB_output_port,Rq2,CY1,CY2)
		if(port_name=='Rq2'):
			CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,CB_output_port,q2,Rq1,CB_output_port,CY1,CY2)
		if(port_name=='CY1'):
			CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,CB_output_port,q2,Rq1,Rq2,CB_output_port,CY2)
		if(port_name=='CY2'):
			CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,CB_output_port,q2,Rq1,Rq2,CY1,CB_output_port)
		SBobjectDictionary[SBId].setFaceStatus(fromSBFace,fromSBPortIndex,'Q')
		print 'WARNING:Switch 10 North face %s'%SBobjectDictionary[SBId].N
		print 'starting SB %s %s port %s'%(SBId,fromSBFace,fromSBPortIndex)
		return fromSBPortIndex



def routing(route,fromCB,fromCBCode,toCB,toCBCode,originLUT,targetLUT,RegWr_enable):
	print 'XXXXX ROUTING ORIGIN %s XXXXXX'%(originLUT)
	print 'targetLUT= %s'%targetLUT
	route_len=len(route)  #calculating length of path from origin CLB to target CLB
	target_CB_port=999  #initial value for target CLB port
	if(originLUT[0:2]!='IO'):
		count=1
	else:
		count=0	
	routing_IO_port_input=0
	if(originLUT[0:2]!='IO'):
		if(lutobjectDictionary[Logic_Objects[Logic_Objects[originLUT]]].status!=1 ): #checking status ---origin LUT should be configured before you can actually route the signal
			print'ERROR :ORIGIN LUT %s has not been configured'%originLUT
			
	else:
		routing_IO_port_input=1
		print 'XXXXXXXXXXXXXX routing IO signal = %s XXXXXXXXX'%(routing_IO_port_input)
	if(routing_IO_port_input==0):
		if CB_connect[fromCB][1]==route[1]: #check if the next SB is to the left of the origin-CB
			SBId=CB_connect[fromCB][1]
			fromSBFace=CB_connect[fromCB][2]
		elif CB_connect[fromCB][3]==route[1]: #check if the next SB is to the right of the origin-CB
			SBId=CB_connect[fromCB][3]
			fromSBFace=CB_connect[fromCB][4]

		x1=CBobjectDictionary[fromCB].CBstate[0]
		x2=CBobjectDictionary[fromCB].CBstate[1]
		x3=CBobjectDictionary[fromCB].CBstate[2]
		x4=CBobjectDictionary[fromCB].CBstate[3]
		q1=CBobjectDictionary[fromCB].CBstate[4]  
		q2=CBobjectDictionary[fromCB].CBstate[5]
		Rq1=CBobjectDictionary[fromCB].CBstate[6]  
		Rq2=CBobjectDictionary[fromCB].CBstate[7]
		CY1=CBobjectDictionary[fromCB].CBstate[8]  
		CY2=CBobjectDictionary[fromCB].CBstate[9]

	else:
		SBId=IO_SB_Connect[originLUT[3:5]][0]
		fromSBFace=IO_SB_Connect[originLUT[3:5]][1]

	
	outputCB=''
	originSBPortIndex=0

	if(routing_IO_port_input==0):
		if(route_len==3 and (lutobjectDictionary[Logic_Objects[originLUT]].status==1 or RegWr_enable==1) ): # #when route length is equal to 3 (origin CB->one SB->target CB)
	#if(route_len==3 and RegWr_enable==1 and routing_IO_port_input==0):
			if(CB_connect[fromCB][5]==originLUT):  #check if origin LUT is q1
				port_name='q1'
				config_originCB_SB_connect(fromCB,q1,CB_output_port_ID[port_name],port_name,fromSBFace,SBId,toCB,route,targetLUT,x1,x2,x3,x4,q1,q2,Rq1,Rq2,CY1,CY2)				

			if(CB_connect[fromCB][6]==originLUT):
				port_name='q2'
				config_originCB_SB_connect(fromCB,q2,CB_output_port_ID[port_name],port_name,fromSBFace,SBId,toCB,route,targetLUT,x1,x2,x3,x4,q1,q2,Rq1,Rq2,CY1,CY2)

			if(CB_connect[fromCB][8]==originLUT): 
				port_name='Rq1'
				config_originCB_SB_connect(fromCB,Rq1,CB_output_port_ID[port_name],port_name,fromSBFace,SBId,toCB,route,targetLUT,x1,x2,x3,x4,q1,q2,Rq1,Rq2,CY1,CY2)				

			if(CB_connect[fromCB][9]==originLUT):
				port_name='Rq2'
				config_originCB_SB_connect(fromCB,Rq2,CB_output_port_ID[port_name],port_name,fromSBFace,SBId,toCB,route,targetLUT,x1,x2,x3,x4,q1,q2,Rq1,Rq2,CY1,CY2)

			if(CB_connect[fromCB][10]==originLUT): 
				port_name='CY1'
				config_originCB_SB_connect(fromCB,CY1,CB_output_port_ID[port_name],port_name,fromSBFace,SBId,toCB,route,targetLUT,x1,x2,x3,x4,q1,q2,Rq1,Rq2,CY1,CY2)				

			if(CB_connect[fromCB][11]==originLUT):
				port_name='CY12'
				config_originCB_SB_connect(fromCB,CY2,CB_output_port_ID[port_name],port_name,fromSBFace,SBId,toCB,route,targetLUT,x1,x2,x3,x4,q1,q2,Rq1,Rq2,CY1,CY2)

		if(route_len>3 and (lutobjectDictionary[Logic_Objects[originLUT]].status==1 or RegWr_enable==1) and routing_IO_port_input==0):   #when route length is greater than 3 (origin CB->more than one SB->target CB)
	#if(route_len>3 and RegWr_enable==1 and routing_IO_port_input==0):
			print 'ERROR CHECK: CB_connect[fromCB] %s origin LUT %s and Q1 %s'%(CB_connect[fromCB],originLUT,q1)
			if(CB_connect[fromCB][5]==originLUT):  #check if origin LUT is q1
				port_name='q1'
				originSBPortIndex=config_originCB_SB_connect_RG3(fromCB,q1,CB_output_port_ID[port_name],port_name,fromSBFace,SBId,x1,x2,x3,x4,q1,q2,Rq1,Rq2,CY1,CY2)			
				print 'AFTER GETTING ORIGIN SB port index inside the if block %s'%originSBPortIndex

			if(CB_connect[fromCB][6]==originLUT):			
				port_name='q2'
				originSBPortIndex=config_originCB_SB_connect_RG3(fromCB,q2,CB_output_port_ID[port_name],port_name,fromSBFace,SBId,x1,x2,x3,x4,q1,q2,Rq1,Rq2,CY1,CY2)

			if(CB_connect[fromCB][8]==originLUT):			
				port_name='Rq1'
				originSBPortIndex=config_originCB_SB_connect_RG3(fromCB,Rq1,CB_output_port_ID[port_name],port_name,fromSBFace,SBId,x1,x2,x3,x4,q1,q2,Rq1,Rq2,CY1,CY2)	

			if(CB_connect[fromCB][9]==originLUT):			
				port_name='Rq2'
				originSBPortIndex=config_originCB_SB_connect_RG3(fromCB,Rq2,CB_output_port_ID[port_name],port_name,fromSBFace,SBId,x1,x2,x3,x4,q1,q2,Rq1,Rq2,CY1,CY2)	

			if(CB_connect[fromCB][10]==originLUT):			
				port_name='CY1'
				originSBPortIndex=config_originCB_SB_connect_RG3(fromCB,CY1,CB_output_port_ID[port_name],port_name,fromSBFace,SBId,x1,x2,x3,x4,q1,q2,Rq1,Rq2,CY1,CY2)	

			if(CB_connect[fromCB][11]==originLUT):			
				port_name='CY1'
				originSBPortIndex=config_originCB_SB_connect_RG3(fromCB,CY2,CB_output_port_ID[port_name],port_name,fromSBFace,SBId,x1,x2,x3,x4,q1,q2,Rq1,Rq2,CY1,CY2)			
			

		currentSBId=route[1]
		currentSBFace=fromSBFace
		fromSBPortIndex=originSBPortIndex
		print 'XXXXXXXXXXXXXXXX start SBID = %s startSBFace = %s startSBPortIndex = %s '%(currentSBId,currentSBFace,fromSBPortIndex)
	else:

		currentSBId=IO_SB_Connect[originLUT[3:5]][0]
		currentSBFace=IO_SB_Connect[originLUT[3:5]][1]
		fromSBPortIndex=originLUT[7]
		print 'XXXXXXXXXXXXXXXX IO start SBID = %s IOstartSBFace = %s IOstartSBPortIndex = %s NorthFace = %s XXXXXXXXXXXXXXXXXXXXXX'%(currentSBId,currentSBFace,fromSBPortIndex,SBobjectDictionary[currentSBId].N)

	while((count+1)<(route_len-1)):
	
		nxtSBpos_wrt_currSB=FindNextSBPos(route[count],route[count+1])
		print 'current SB in while = %s next SB in while %s'%(route[count],route[count+1])
		if(count==route_len-2 or nxtSBpos_wrt_currSB==999):
			break
		
			
		if(nxtSBpos_wrt_currSB==0):
			freeport=checkFreeSBPort(currentSBId,'N')
			switchBlock.configSwitchBlock(SBobjectDictionary[currentSBId],currentSBId,currentSBFace,str(fromSBPortIndex),'N',str(freeport))
	
			fromSBPortIndex=freeport
			currentSBFace='S'
			currentSBId=route[count+1]
			count=count+1
			
		
		elif(nxtSBpos_wrt_currSB==1):
			freeport=checkFreeSBPort(currentSBId,'E')
			#print 'free port %s '%(freeport)
			switchBlock.configSwitchBlock(SBobjectDictionary[currentSBId],currentSBId,currentSBFace,str(fromSBPortIndex),'E',str(freeport))
			print 'currentSBId %s S  freeport %s '%(currentSBId,freeport)
			fromSBPortIndex=freeport
			currentSBFace='W'
			currentSBId=route[count+1]
			count=count+1
		
		
		elif(nxtSBpos_wrt_currSB==2):
			freeport=checkFreeSBPort(currentSBId,'S')
			#print 'free port %s '%(freeport)
			switchBlock.configSwitchBlock(SBobjectDictionary[currentSBId],currentSBId,currentSBFace,str(fromSBPortIndex),'S',str(freeport))	
			print 'currentSBId %s S freeport %s count %s'%(currentSBId,freeport,count)
			fromSBPortIndex=freeport
			currentSBFace='N'
			currentSBId=route[count+1]
			count=count+1	
			
		else:
			freeport=checkFreeSBPort(currentSBId,'W')
			#print 'free port %s '%(freeport)
			switchBlock.configSwitchBlock(SBobjectDictionary[currentSBId],currentSBId,currentSBFace,str(fromSBPortIndex),'W',str(freeport))
			print 'currentSBId %s W freeport %s '%(currentSBId,freeport)
			fromSBPortIndex=freeport
			currentSBFace='E'
			currentSBId=route[count+1]
			count=count+1

	target_CB_port=conf_lastSB(route[route_len-2],currentSBFace,fromSBPortIndex,toCB,route,targetLUT)
	print 'target_CB_port %s'%target_CB_port

	if(target_CB_port!=999):	
		return target_CB_port
	else:    #this condition won't happen as we are are only consideing the CB with a free port on the target CLB
		print 'No available target CB port'
		return 999
			
		

def find_signal_CLB(target_LUT,originLUT):  #used to find whether a signal has already been routed to any of the input ports of the origin CLB 
	k=0
	for i in range(0,16):
		if(CLB_INP_STATS[LUT_connect[target_LUT][0]][i]==originLUT):
			k=i
			break
		else:
			k=999	
	
	if(k!=999):	
		return CLB_INDEX_TO_INPUT[str(k)]
	else:
		return 999


def check_free_CB_port(CLBID):   #helper function which checks all CB in target CLB to see if it has any free ports to get the incoming routed signal 
	CB0=CLB_CB_List[CLBID][0];
	CB1=CLB_CB_List[CLBID][1];
	CB2=CLB_CB_List[CLBID][2];
	CB3=CLB_CB_List[CLBID][3];
	i_count_cb0=0
	i_count_cb1=0
	i_count_cb2=0
	i_count_cb3=0
	final_CB_index_00=0
	final_CB_index_01=0
	final_CB_index_10=0
	final_CB_index_11=0

	while(CBobjectDictionary[CB0].CBstate[i_count_cb0] !='X'):  #each while loop gets the first available free port on that CB. If no ports are free it returns 999 else it returns id of free port
		i_count_cb0=i_count_cb0+1
		if(i_count_cb0==4):
			break

	while(CBobjectDictionary[CB1].CBstate[i_count_cb1] !='X'):
		i_count_cb1=i_count_cb1+1
		if(i_count_cb1==4):
			break

	while(CBobjectDictionary[CB2].CBstate[i_count_cb2] !='X'):
		i_count_cb2=i_count_cb2+1
		if(i_count_cb2==4):
			break

	while(CBobjectDictionary[CB3].CBstate[i_count_cb3] !='X'):
		i_count_cb3=i_count_cb3+1
		if(i_count_cb3==4):
			break
	
	if(i_count_cb0==4):
		i_count_cb0=i_count_cb0*0
		final_CB_index_00=999
	else:
		final_CB_index_00=i_count_cb0
	if(i_count_cb1==4):
		i_count_cb1=i_count_cb1*0
		final_CB_index_01=999
	else:
		final_CB_index_01=i_count_cb1
	
	if(i_count_cb2==4):
		i_count_cb2=i_count_cb2*0
		final_CB_index_10=999
	else:
		final_CB_index_10=i_count_cb2
	if(i_count_cb3==4):
		i_count_cb3=i_count_cb3*0
		final_CB_index_11=999
	else:
		final_CB_index_11=i_count_cb3
	print 'CLB CB status %s'%[final_CB_index_00,final_CB_index_01,final_CB_index_10,final_CB_index_11]

	return [final_CB_index_00,final_CB_index_01,final_CB_index_10,final_CB_index_11]  #returns a list containing the first free port of each CB


class Graph:
    
    def __init__(self):
        self.vertices = {}
        
    def add_vertex(self, name, edges):
        self.vertices[name] = edges
    
    def shortest_path(self, start, finish):
        distances = {} # Distance from start to node
        previous = {}  # Previous node in optimal path from source
        nodes = [] # Priority queue of all nodes in Graph

        for vertex in self.vertices:
            if vertex == start: # Set root node as distance of 0
                distances[vertex] = 0
                heapq.heappush(nodes, [0, vertex])
            else:
                distances[vertex] = sys.maxsize
                heapq.heappush(nodes, [sys.maxsize, vertex])
            previous[vertex] = None
        
        while nodes:
            smallest = heapq.heappop(nodes)[1] 
            if smallest == finish: 
                path = []
                while previous[smallest]: 
                    path.append(smallest)
                    smallest = previous[smallest]
                return path
            if distances[smallest] == sys.maxsize: 
                break
            
            for neighbor in self.vertices[smallest]:
                alt = distances[smallest] + self.vertices[smallest][neighbor]
                if alt < distances[neighbor]:
                    distances[neighbor] = alt
                    previous[neighbor] = smallest
                    for n in nodes:
                        if n[1] == neighbor:
                            n[0] = alt
                            break
                    heapq.heapify(nodes)
        return distances
        
    def __str__(self):
        return str(self.vertices)



#def route_IO_signal(IOId,IOPortIndex,toCB,toCBcode):


	
##########################################routing logic ends##########################################################################
	