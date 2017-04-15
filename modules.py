from fpga_dict import*
class lut(object):
	def __init__(self,outputp):
		self.lutTable='0000000000000000'
		self.muxSwitch='1'
		self.outputPort=outputp    #contains the code of the LUT which is giving the output
		self.inputPort1='00000'
		self.inputPort2='00000'
		self.inputPort3='00000'
		self.inputPort4='00000'
		self.status=0
		self.LUTID=''

	def lutConfig(self,LUTID,function,input1,input2,input3,input4,muxSw):
		
		
		self.lutTable=function
		self.muxSwitch=muxSw
		self.outputPort=LUTID
		self.inputPort1=input1
		self.inputPort2=input2
		self.inputPort3=input3
		self.inputPort4=input4
		self.status=1
		self.LUTID=LUTID
		
		return LUTID

	def bits(self):
		lut_config_bits=''
		lut_config_bits=str(self.inputPort1+self.inputPort2+self.inputPort3+self.inputPort4+self.muxSwitch+self.lutTable)	
		return lut_config_bits

	
#creating objects for each LUT


objectNames = ["Q11_7","Q11_6","Q11_5","Q11_4","Q11_3","Q11_2","Q11_1","Q11_0","Q10_7","Q10_6","Q10_5","Q10_4","Q10_3","Q10_2","Q10_1","Q10_0","Q01_7","Q01_6","Q01_5","Q01_4",
"Q01_3","Q01_2","Q01_1","Q01_0","Q00_7","Q00_6","Q00_5","Q00_4","Q00_3","Q00_2","Q00_1","Q00_0"]
lutobjectDictionary = {}
for name in objectNames:
    lutobjectDictionary[name] = lut(name)



class switchBlock(object):
	def __init__(self,switchID):
		self.A=['X','X','X','X','X','X','X','X']  #the config for IO blocks should update the face nearest to it while coding
		self.B=['X','X','X','X','X','X','X','X'] #index and look up these lists using the face index of the switch blocks
		self.C=['X','X','X','X','X','X','X','X']
		self.D=['X','X','X','X','X','X','X','X']  #should say whether the port is input or output X, I, O states
		self.switchID=switchID
		self.status=0
		self.switchDict={'A0B0':'00','A0B1':'00','A0B2':'00','A0B3':'00','A0B4':'00','A0B5':'00','A0B6':'00','A0B7':'00','A0C0':'00',\
'A0C1':'00','A0C2':'00','A0C3':'00','A0C4':'00','A0C5':'00','A0C6':'00','A0C7':'00','A0D0':'00','A0D1':'00','A0D2':'00','A0D3':'00',\
'A0D4':'00','A0D5':'00','A0D6':'00','A0D7':'00','A1B0':'00','A1B1':'00','A1B2':'00','A1B3':'00','A1B4':'00','A1B5':'00','A1B6':'00',\
'A1B7':'00','A1C0':'00','A1C1':'00','A1C2':'00','A1C3':'00','A1C4':'00','A1C5':'00','A1C6':'00','A1C7':'00','A1D0':'00','A1D1':'00',\
'A1D2':'00','A1D3':'00','A1D4':'00','A1D5':'00','A1D6':'00','A1D7':'00','A2B0':'00','A2B1':'00','A2B2':'00','A2B3':'00','A2B4':'00',\
'A2B5':'00','A2B6':'00','A2B7':'00','A2C0':'00','A2C1':'00','A2C2':'00','A2C3':'00','A2C4':'00','A2C5':'00','A2C6':'00','A2C7':'00',\
'A2D0':'00','A2D1':'00','A2D2':'00','A2D3':'00','A2D4':'00','A2D5':'00','A2D6':'00','A2D7':'00','A3B0':'00','A3B1':'00','A3B2':'00',\
'A3B3':'00','A3B4':'00','A3B5':'00','A3B6':'00','A3B7':'00','A3C0':'00','A3C1':'00','A3C2':'00','A3C3':'00','A3C4':'00','A3C5':'00',\
'A3C6':'00','A3C7':'00','A3D0':'00','A3D1':'00','A3D2':'00','A3D3':'00','A3D4':'00','A3D5':'00','A3D6':'00','A3D7':'00','A4B0':'00',\
'A4B1':'00','A4B2':'00','A4B3':'00','A4B4':'00','A4B5':'00','A4B6':'00','A4B7':'00','A4C0':'00','A4C1':'00','A4C2':'00','A4C3':'00',\
'A4C4':'00','A4C5':'00','A4C6':'00','A4C7':'00','A4D0':'00','A4D1':'00','A4D2':'00','A4D3':'00','A4D4':'00','A4D5':'00','A4D6':'00',\
'A4D7':'00','A5B0':'00','A5B1':'00','A5B2':'00','A5B3':'00','A5B4':'00','A5B5':'00','A5B6':'00','A5B7':'00','A5C0':'00','A5C1':'00',\
'A5C2':'00','A5C3':'00','A5C4':'00','A5C5':'00','A5C6':'00','A5C7':'00','A5D0':'00','A5D1':'00','A5D2':'00','A5D3':'00','A5D4':'00',\
'A5D5':'00','A5D6':'00','A5D7':'00','A6B0':'00','A6B1':'00','A6B2':'00','A6B3':'00','A6B4':'00','A6B5':'00','A6B6':'00','A6B7':'00',\
'A6C0':'00','A6C1':'00','A6C2':'00','A6C3':'00','A6C4':'00','A6C5':'00','A6C6':'00','A6C7':'00','A6D0':'00','A6D1':'00','A6D2':'00',\
'A6D3':'00','A6D4':'00','A6D5':'00','A6D6':'00','A6D7':'00','A7B0':'00','A7B1':'00','A7B2':'00','A7B3':'00','A7B4':'00','A7B5':'00',\
'A7B6':'00','A7B7':'00','A7C0':'00','A7C1':'00','A7C2':'00','A7C3':'00','A7C4':'00','A7C5':'00','A7C6':'00','A7C7':'00','A7D0':'00',\
'A7D1':'00','A7D2':'00','A7D3':'00','A7D4':'00','A7D5':'00','A7D6':'00','A7D7':'00','B0D0':'00','B0D1':'00','B0D2':'00','B0D3':'00',\
'B0D4':'00','B0D5':'00','B0D6':'00','B0D7':'00','B0C0':'00','B0C1':'00','B0C2':'00','B0C3':'00','B0C4':'00','B0C5':'00','B0C6':'00',\
'B0C7':'00','B1D0':'00','B1D1':'00','B1D2':'00','B1D3':'00','B1D4':'00','B1D5':'00','B1D6':'00','B1D7':'00','B1C0':'00','B1C1':'00',\
'B1C2':'00','B1C3':'00','B1C4':'00','B1C5':'00','B1C6':'00','B1C7':'00','B2D0':'00','B2D1':'00','B2D2':'00','B2D3':'00','B2D4':'00',\
'B2D5':'00','B2D6':'00','B2D7':'00','B2C0':'00','B2C1':'00','B2C2':'00','B2C3':'00','B2C4':'00','B2C5':'00','B2C6':'00','B2C7':'00',\
'B3D0':'00','B3D1':'00','B3D2':'00','B3D3':'00','B3D4':'00','B3D5':'00','B3D6':'00','B3D7':'00','B3C0':'00','B3C1':'00','B3C2':'00',\
'B3C3':'00','B3C4':'00','B3C5':'00','B3C6':'00','B3C7':'00','B4D0':'00','B4D1':'00','B4D2':'00','B4D3':'00','B4D4':'00','B4D5':'00',\
'B4D6':'00','B4D7':'00','B4C0':'00','B4C1':'00','B4C2':'00','B4C3':'00','B4C4':'00','B4C5':'00','B4C6':'00','B4C7':'00','B5D0':'00',\
'B5D1':'00','B5D2':'00','B5D3':'00','B5D4':'00','B5D5':'00','B5D6':'00','B5D7':'00','B5C0':'00','B5C1':'00','B5C2':'00','B5C3':'00',\
'B5C4':'00','B5C5':'00','B5C6':'00','B5C7':'00','B6D0':'00','B6D1':'00','B6D2':'00','B6D3':'00','B6D4':'00','B6D5':'00','B6D6':'00',\
'B6D7':'00','B6C0':'00','B6C1':'00','B6C2':'00','B6C3':'00','B6C4':'00','B6C5':'00','B6C6':'00','B6C7':'00','B7D0':'00','B7D1':'00',\
'B7D2':'00','B7D3':'00','B7D4':'00','B7D5':'00','B7D6':'00','B7D7':'00','B7C0':'00','B7C1':'00','B7C2':'00','B7C3':'00','B7C4':'00',\
'B7C5':'00','B7C6':'00','B7C7':'00','C0D0':'00','C0D1':'00','C0D2':'00','C0D3':'00','C0D4':'00','C0D5':'00','C0D6':'00','C0D7':'00',\
'C1D0':'00','C1D1':'00','C1D2':'00','C1D3':'00','C1D4':'00','C1D5':'00','C1D6':'00','C1D7':'00','C2D0':'00','C2D1':'00','C2D2':'00',\
'C2D3':'00','C2D4':'00','C2D5':'00','C2D6':'00','C2D7':'00','C3D0':'00','C3D1':'00','C3D2':'00','C3D3':'00','C3D4':'00','C3D5':'00',\
'C3D6':'00','C3D7':'00','C4D0':'00','C4D1':'00','C4D2':'00','C4D3':'00','C4D4':'00','C4D5':'00','C4D6':'00','C4D7':'00','C5D0':'00',\
'C5D1':'00','C5D2':'00','C5D3':'00','C5D4':'00','C5D5':'00','C5D6':'00','C5D7':'00','C6D0':'00','C6D1':'00','C6D2':'00','C6D3':'00',\
'C6D4':'00','C6D5':'00','C6D6':'00','C6D7':'00','C7D0':'00','C7D1':'00','C7D2':'00','C7D3':'00','C7D4':'00','C7D5':'00','C7D6':'00',\
'C7D7':'00'}
	

	def faceValue(self,face):
		if face=='A':
			return 0
		elif face=='B':
			return 1
		elif face=='C':
			return 2
		else:
			return 3

	def setFaceStatus(self,face,index,setVal):
		if face=='A':
			self.A[index]=setVal
		elif face=='B':
			self.B[index]=setVal
		elif face=='C':
			self.C[index]=setVal
		else:
			self.D[index]=setVal

	def getFaceStatus(self,face,index):
		indexnum=int(index)
		if face=='A':
			return self.A[indexnum]
		elif face=='B':
			return self.B[indexnum]
		elif face=='C':
			return self.C[indexnum]
		else:
			return self.D[indexnum]

	def adjSBface(self,toFace):

		if toFace=='A':
			adjface='C'
		elif toFace=='C':
			adjface='A'
		elif toFace=='B':
			adjface='D'
		else:
			adjface='B'
		return adjface
	
	def configSBNext(self,switchID,toFace,toFaceIndex):
		
		if toFace=='A':
			
			index=0
			return SB_connect[switchID][0]
		elif toFace=='B':
			index=1
			return SB_connect[switchID][1]
		elif toFace=='C':
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
		SB_switchList=["A0B0","A0B1","A0B2","A0B3","A0B4","A0B5","A0B6","A0B7","A0C0","A0C1","A0C2","A0C3","A0C4","A0C5","A0C6","A0C7","A0D0","A0D1","A0D2",
"A0D3","A0D4","A0D5","A0D6","A0D7","A1B0","A1B1","A1B2","A1B3","A1B4","A1B5","A1B6","A1B7","A1C0","A1C1","A1C2","A1C3","A1C4","A1C5",
"A1C6","A1C7","A1D0","A1D1","A1D2","A1D3","A1D4","A1D5","A1D6","A1D7","A2B0","A2B1","A2B2","A2B3","A2B4","A2B5","A2B6","A2B7","A2C0",
"A2C1","A2C2","A2C3","A2C4","A2C5","A2C6","A2C7","A2D0","A2D1","A2D2","A2D3","A2D4","A2D5","A2D6","A2D7","A3B0","A3B1","A3B2","A3B3",
"A3B4","A3B5","A3B6","A3B7","A3C0","A3C1","A3C2","A3C3","A3C4","A3C5","A3C6","A3C7","A3D0","A3D1","A3D2","A3D3","A3D4","A3D5","A3D6",
"A3D7","A4B0","A4B1","A4B2","A4B3","A4B4","A4B5","A4B6","A4B7","A4C0","A4C1","A4C2","A4C3","A4C4","A4C5","A4C6","A4C7","A4D0","A4D1",
"A4D2","A4D3","A4D4","A4D5","A4D6","A4D7","A5B0","A5B1","A5B2","A5B3","A5B4","A5B5","A5B6","A5B7","A5C0","A5C1","A5C2","A5C3","A5C4",
"A5C5","A5C6","A5C7","A5D0","A5D1","A5D2","A5D3","A5D4","A5D5","A5D6","A5D7","A6B0","A6B1","A6B2","A6B3","A6B4","A6B5","A6B6","A6B7",
"A6C0","A6C1","A6C2","A6C3","A6C4","A6C5","A6C6","A6C7","A6D0","A6D1","A6D2","A6D3","A6D4","A6D5","A6D6","A6D7","A7B0","A7B1","A7B2",
"A7B3","A7B4","A7B5","A7B6","A7B7","A7C0","A7C1","A7C2","A7C3","A7C4","A7C5","A7C6","A7C7","A7D0","A7D1","A7D2","A7D3","A7D4","A7D5",
"A7D6","A7D7","B0D0","B0D1","B0D2","B0D3","B0D4","B0D5","B0D6","B0D7","B0C0","B0C1","B0C2","B0C3","B0C4","B0C5","B0C6","B0C7","B1D0",
"B1D1","B1D2","B1D3","B1D4","B1D5","B1D6","B1D7","B1C0","B1C1","B1C2","B1C3","B1C4","B1C5","B1C6","B1C7","B2D0","B2D1","B2D2","B2D3",
"B2D4","B2D5","B2D6","B2D7","B2C0","B2C1","B2C2","B2C3","B2C4","B2C5","B2C6","B2C7","B3D0","B3D1","B3D2","B3D3","B3D4","B3D5","B3D6",
"B3D7","B3C0","B3C1","B3C2","B3C3","B3C4","B3C5","B3C6","B3C7","B4D0","B4D1","B4D2","B4D3","B4D4","B4D5","B4D6","B4D7","B4C0","B4C1",
"B4C2","B4C3","B4C4","B4C5","B4C6","B4C7","B5D0","B5D1","B5D2","B5D3","B5D4","B5D5","B5D6","B5D7","B5C0","B5C1","B5C2","B5C3","B5C4",
"B5C5","B5C6","B5C7","B6D0","B6D1","B6D2","B6D3","B6D4","B6D5","B6D6","B6D7","B6C0","B6C1","B6C2","B6C3","B6C4","B6C5","B6C6","B6C7",
"B7D0","B7D1","B7D2","B7D3","B7D4","B7D5","B7D6","B7D7","B7C0","B7C1","B7C2","B7C3","B7C4","B7C5","B7C6","B7C7","C0D0","C0D1","C0D2",
"C0D3","C0D4","C0D5","C0D6","C0D7","C1D0","C1D1","C1D2","C1D3","C1D4","C1D5","C1D6","C1D7","C2D0","C2D1","C2D2","C2D3","C2D4","C2D5",
"C2D6","C2D7","C3D0","C3D1","C3D2","C3D3","C3D4","C3D5","C3D6","C3D7","C4D0","C4D1","C4D2","C4D3","C4D4","C4D5","C4D6","C4D7","C5D0",
"C5D1","C5D2","C5D3","C5D4","C5D5","C5D6","C5D7","C6D0","C6D1","C6D2","C6D3","C6D4","C6D5","C6D6","C6D7","C7D0","C7D1","C7D2","C7D3",
"C7D4","C7D5","C7D6","C7D7"]
		sb_bits=''

		for i in SB_switchList:
			sb_bits=sb_bits+self.switchDict[i]
		return sb_bits
		
		
		
SBobjectNames = ["00", "01", "02", "10", "11", "12", "20", "21","22"]
       
SBobjectDictionary = {}
for name in SBobjectNames:
    SBobjectDictionary[name] = switchBlock(name)




#SB_connect keyvalue: SBId  values: objects opposite to faces A,B,C,D of the keyed SB... X represents no SB

SB_connect={"00":['X',SBobjectDictionary['01'],SBobjectDictionary['10'],'X'],
	"01":['X',SBobjectDictionary['02'],SBobjectDictionary['11'],SBobjectDictionary['00']],
	"02":['X','X',SBobjectDictionary['12'],SBobjectDictionary['01']],
	"10":[SBobjectDictionary['00'],SBobjectDictionary['11'],SBobjectDictionary['20'],'X'],
	"11":[SBobjectDictionary['01'],SBobjectDictionary['12'],SBobjectDictionary['21'],SBobjectDictionary['10']],
	"12":[SBobjectDictionary['02'],'X',SBobjectDictionary['22'],SBobjectDictionary['11']],
	"20":[SBobjectDictionary['10'],SBobjectDictionary['21'],'X','X'],
	"21":[SBobjectDictionary['11'],SBobjectDictionary['22'],'X',SBobjectDictionary['20']],
	"22":[SBobjectDictionary['12'],'X','X',SBobjectDictionary['21']]
	  }	


class IOBlocks(object):
	def __init__(self,ioId):
		self.ioId=ioId
		self.ioConf=['X','X','X','X','X','X','X','X']
		self.status=0
		self.ioDict={"0":'00',"1":'00',"2":'00',"3":'00',"4":'00',"5":'00',"6":'00',"7":'00'} #key: the global line number value: bits for setting the switch

	def setIOBits(self,port,index):
		if(port=='I'):
			return '11'
		elif(port=='O'):
			return '10'
		else:
			return '00'
		
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
		#self.IODict={'0':'00','1':'00','2':'00','3':'00','4':'00','5':'00','6':'00','7':'00'}
		ptrs=[pt0,pt1,pt2,pt3,pt4,pt5,pt6,pt7]
		for m in range(0,8):
			index_m=str(m)
			self.ioDict[index_m]=IOBlocks.setIOBits(self,self.ioConf[m],m)
			#print "switch id: %s switch index: %s"%(self.ioId,self.ioDict[index_m])
		
		index=0
		for i in ptrs:
			if index<8:  #setting the adjacent SB ports to I or O based on each IO block
				switchBlock.setFaceStatus(SBobjectDictionary[IO_connect[ioId][0]],IO_connect[ioId][1],index,i)
				index=index+1
	def printIObits(self):
		IO_switch_list=['0','1','2','3','4','5','6','7']
		bits=''
		for switch in IO_switch_list:
			bits=bits+self.ioDict[switch]
		return bits
			
		
	
	

IOobjectNames = ["00", "01", "02", "10", "11", "20", "21","30","31","40","41","42"]
	       
IOobjectDictionary = {}
for name in IOobjectNames:
    IOobjectDictionary[name] = IOBlocks(name)

#IO_connect key value=io_block ID values: i)adjacent switch block ii) face of adjacent SB facing the IO port 

IO_connect={"00":['00','A'],"01":['01','A'],"02":['02','A'],
	    "10":['00','D'],"11":['02','B'],
	    "20":['10','D'],"21":['12','B'],
	    "30":['20','D'],"31":['22','B'],
	    "40":['20','C'],"41":['21','C'],"42":['22','C']		
	    }
		

class connectionBlock(object):   #fix input and output port collission
	def __init__(self,cbId):
		self.x1='X'
		self.x2='X'
		self.x3='X'
		self.x4='X'
		self.q1='X'
		self.q2='X'
		self.CBstate=['X','X','X','X','X','X']
		self.cbId=cbId
		self.status=0
		self.CBDict={"x1_G0":'0',"x2_G0":'0',"x3_G0":'0',"x4_G0":'0',"q1_G0":'0',"q2_G0":'0',
			     "x1_G1":'0',"x2_G1":'0',"x3_G1":'0',"x4_G1":'0',"q1_G1":'0',"q2_G1":'0',
			     "x1_G2":'0',"x2_G2":'0',"x3_G2":'0',"x4_G2":'0',"q1_G2":'0',"q2_G2":'0',
		             "x1_G3":'0',"x2_G3":'0',"x3_G3":'0',"x4_G3":'0',"q1_G3":'0',"q2_G3":'0',
			     "x1_G4":'0',"x2_G4":'0',"x3_G4":'0',"x4_G4":'0',"q1_G4":'0',"q2_G4":'0',
			     "x1_G5":'0',"x2_G5":'0',"x3_G5":'0',"x4_G5":'0',"q1_G5":'0',"q2_G5":'0',
			     "x1_G6":'0',"x2_G6":'0',"x3_G6":'0',"x4_G6":'0',"q1_G6":'0',"q2_G6":'0',
		             "x1_G7":'0',"x2_G7":'0',"x3_G7":'0',"x4_G7":'0',"q1_G7":'0',"q2_G7":'0'
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
		if CB_connect[cbId][direc+1]=='A':
			return SBobjectDictionary[CB_connect[cbId][direc]].A[port]
		elif CB_connect[cbId][direc+1]=='B':
			return SBobjectDictionary[CB_connect[cbId][direc]].B[port]
		elif CB_connect[cbId][direc+1]=='C':
			return SBobjectDictionary[CB_connect[cbId][direc]].C[port]
		else:
			return SBobjectDictionary[CB_connect[cbId][direc]].D[port]	

	def configCB(self,cbId,x1,x2,x3,x4,q1,q2):
		self.cbId=cbId
		self.x1=x1
		self.x2=x2
		self.x3=x3
		self.x4=x4
		self.q1=q1
		self.q2=q2
		self.CBstate=[self.x1,self.x2,self.x3,self.x4,self.q1,self.q2]
		self.status=1
		CBDictKeyx1=str('x1_'+connectionBlock.getLineCode(self,self.x1))
		CBDictKeyx2=str('x2_'+connectionBlock.getLineCode(self,self.x2))
		CBDictKeyx3=str('x3_'+connectionBlock.getLineCode(self,self.x3))
		CBDictKeyx4=str('x4_'+connectionBlock.getLineCode(self,self.x4))
		CBDictKeyq1=str('q1_'+connectionBlock.getLineCode(self,self.q1))
		CBDictKeyq2=str('q2_'+connectionBlock.getLineCode(self,self.q2))
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
		
		if self.q1!='X':
			val=int(self.q1)
			leftSB=connectionBlock.getting_SB_line_status(self,cbId,'left',val)
			rightSB=connectionBlock.getting_SB_line_status(self,cbId,'right',val)
			if(leftSB=='X' and rightSB=='X'):
				leftFace=CB_connect[cbId][2]
				rightFace=CB_connect[cbId][4]
				switchBlock.setFaceStatus(SBobjectDictionary[CB_connect[cbId][1]],leftFace,val,'Q')
				switchBlock.setFaceStatus(SBobjectDictionary[CB_connect[cbId][3]],rightFace,val,'Q')
				self.CBDict[CBDictKeyq1]='1'
				print 'CBcode and output stats %s %s %s'%(cbId,self.CBDict[CBDictKeyq1],self.q1)
				
			elif(leftSB=='O' and rightSB=='X'): #think about this case
				leftFace=CB_connect[cbId][2]
				switchBlock.setFaceStatus(SBobjectDictionary[CB_connect[cbId][1]],leftFace,val,'O') #think about this case
				self.CBDict[CBDictKeyq1]='1'
			elif(leftSB=='X' and rightSB=='O'):		
				rightFace=CB_connect[cbId][4]
				switchBlock.setFaceStatus(SBobjectDictionary[CB_connect[cbId][3]],rightFace,val,'O')
				self.CBDict[CBDictKeyq1]='1'
			elif(leftSB=='O' and rightSB=='O'):
				print 'cannot connect: output line already in use: Error in CB: %s'%cbId
		
		
		#else: 
		#	self.CBDict[CBDictKeyq1]='0'
		#	print 'CBcode and output stZZZZ %s %s %s'%(cbId,self.CBDict[CBDictKeyq1],self.q1)
		
		if self.q2!='X':
			val=int(self.q2)
			leftSB=connectionBlock.getting_SB_line_status(self,cbId,'left',val)
			rightSB=connectionBlock.getting_SB_line_status(self,cbId,'right',val)
			if(leftSB=='X' and rightSB=='X'):
				leftFace=CB_connect[cbId][2]
				rightFace=CB_connect[cbId][4]
				switchBlock.setFaceStatus(SBobjectDictionary[CB_connect[cbId][1]],leftFace,val,'Q')
				switchBlock.setFaceStatus(SBobjectDictionary[CB_connect[cbId][3]],rightFace,val,'Q')
				self.CBDict[CBDictKeyq2]='1'
				print 'CBcode and output stats %s %s %s'%(cbId,self.CBDict[CBDictKeyq2],self.q2)
			elif(leftSB=='O' and rightSB=='X'):
				leftFace=CB_connect[cbId][2]
				switchBlock.setFaceStatus(SBobjectDictionary[CB_connect[cbId][1]],leftFace,val,'Q')
				self.CBDict[CBDictKeyq2]='1'
			elif(leftSB=='X' and rightSB=='O'):
				rightFace=CB_connect[cbId][4]
				switchBlock.setFaceStatus(SBobjectDictionary[CB_connect[cbId][3]],rightFace,val,'Q')
				self.CBDict[CBDictKeyq2]='1'
		#else: 
		#	self.CBDict[CBDictKeyq2]='0'
		#	print 'CBcode and output stZZZZ %s %s %s'%(cbId,self.CBDict[CBDictKeyq2],self.q2)

		
		
		#else: 
		#	self.CBDict[CBDictKeyq2]='0'
		#	print 'CBcode and output stZZZZ %s %s %s'%(cbId,self.CBDict[CBDictKeyq2],self.q2)

	def printCBconfig(self):
		dictKeylist=["x1_G0","x2_G0","x3_G0","x4_G0","q1_G0","q2_G0",
			     "x1_G1","x2_G1","x3_G1","x4_G1","q1_G1","q2_G1",
			     "x1_G2","x2_G2","x3_G2","x4_G2","q1_G2","q2_G2",
		             "x1_G3","x2_G3","x3_G3","x4_G3","q1_G3","q2_G3",
			     "x1_G4","x2_G4","x3_G4","x4_G4","q1_G4","q2_G4",
			     "x1_G5","x2_G5","x3_G5","x4_G5","q1_G5","q2_G5",
			     "x1_G6","x2_G6","x3_G6","x4_G6","q1_G6","q2_G6",
		             "x1_G7","x2_G7","x3_G7","x4_G7","q1_G7","q2_G7"]
		s=''
		m=''
		for k in dictKeylist:
			m=m+' '+k
		for i in dictKeylist:
			s=s+self.CBDict[i]
		#print m
		
		return s
		



CB_objects=["00_0","00_1","00_2","00_3","01_0","01_1","01_2","01_3","11_0","11_1","11_2","11_3","10_0","10_1","10_2","10_3"]

CBobjectDictionary = {}
for name in CB_objects:
    CBobjectDictionary[name] = connectionBlock(name)


#SB_Map_code key:SB code ---values:code representing the SB on the CB_SB_map dictionary
SB_Map_code = {"00":"SB00", "01":"SB01", "02":"SB02", "10":"SB10", "11":"SB11", "12":"SB12", "20":"SB20", "21":"SB21","22":"SB22"}
	       
#CB_Map_code key:CB code ----values:code representing the CB on the CB_SB_map dictionary
CB_map_code={"00_0":'C1',"00_1":'C2',"00_2":'C3',"00_3":'C4',

	    "01_0":'C5',"01_1":'C6',"01_2":'C7',"01_3":'C2',
            
	    "11_0":'C7',"11_1":'C8',"11_2":'C9',"11_3":'C10',

	    "10_0":'C3',"10_1":'C10',"10_2":'C11',"10_3":'C12'}



#CB_SB_map is the graphical representation of the CB and SB layout on the FPGA skeleton
'''
CB_SB_map={"SB00":['C1','SB01','C4','SB10'],
	  "SB01":['SB00','SB02','SB11','C1','C5','C2'],
	  "SB02":['SB01','SB12','C5','C6'],
	  "SB10":['SB00','SB11','SB20','C4','C12','C3'],
	  "SB11":['SB01','SB21','SB12','SB10','C3','C7','C2','C10'],
	  "SB12":['SB02','SB22','SB11','C6','C8','C7'],
          "SB20":['SB10','SB21','C12','C11'],
	  "SB21":['SB20','SB11','SB22','C11','C9','C10'],
	  "SB22":['SB12','SB21','C8','C9'],
	  "C1":['SB00','SB01'],
	  "C5":['SB01','SB02'],
	  "C4":['SB00','SB10'],
	  "C2":['SB01','SB11'],
	  "C6":['SB02','SB12'],
	  "C12":['SB10','SB20'],
	  "C3":['SB10','SB11'],
	  "C7":['SB11','SB12'],
	  "C10":['SB11','SB21'],
	  "C9":['SB21','SB22'],
	  "C8":['SB12','SB22']
	  }

'''

CB_SB_map={"00":['C1','01','C4','10'],         #00, 01,02 ETC REPRESENTS THE SB and C4,C1 etc. represent the unique value for Switch blocks
	  "01":['00','02','11','C1','C5','C2'],
	  "02":['01','12','C5','C6'],
	  "10":['00','11','20','C4','C12','C3'],
	  "11":['01','21','12','10','C3','C7','C2','C10'],
	  "12":['02','22','11','C6','C8','C7'],
          "20":['10','21','C12','C11'],
	  "21":['20','11','22','C11','C9','C10'],
	  "22":['12','21','C8','C9'],
	  "C1":['00','01'],
	  "C5":['01','02'],
	  "C4":['00','10'],
	  "C2":['01','11'],
	  "C6":['02','12'],
	  "C12":['10','20'],
	  "C3":['10','11'],
	  "C7":['11','12'],
	  "C10":['11','21'],
	  "C9":['21','22'],
	  "C8":['12','22']
	  }


pa=[]
CB_codes=['C1','C2','C3','C4',

	    'C5','C6','C7','C2',
            
	   'C7','C8','C9','C10',

	   'C3','C10','C11','C12']


##########################################routing logic begins#######################################################################################################################
def checkFreeSBPort_CBconnect(SBId,SBFace,x1,x2,x3,x4,CBId):   #function checks for the index corresponding to free ports on a side of the switch block -- free ports have their status as 'X'
	flag=1
	counter=0
	final=0
	if(SBFace=='A'):
		while(flag and counter<8):
			if(SBobjectDictionary[SBId].A[counter] =='X'):  #check if any port in face A of the switch block adjacent to the from CB is free and its not connected to any of the inputs of the CB
				if(CBobjectDictionary[CBId].CBstate[0]!=str(counter) and CBobjectDictionary[CBId].CBstate[1]!=str(counter) and CBobjectDictionary[CBId].CBstate[2]!=str(counter) and CBobjectDictionary[CBId].CBstate[3]!=str(counter)):
					
					flag=0
			else:
				counter=counter+1
				#print counter	
							
	elif(SBFace=='B'):
		while(flag and counter<8):
			if(SBobjectDictionary[SBId].B[counter] =='X'):
				if(CBobjectDictionary[CBId].CBstate[0]!=str(counter) or CBobjectDictionary[CBId].CBstate[1]!=str(counter) or CBobjectDictionary[CBId].CBstate[2]!=str(counter) or CBobjectDictionary[CBId].CBstate[3]!=str(counter)):
					
					flag=0
			else:
				counter=counter+1
	elif(SBFace=='C'):
		while(flag and counter<8):
			if(SBobjectDictionary[SBId].C[counter] =='X'):
				if(CBobjectDictionary[CBId].CBstate[0]!=str(counter) or CBobjectDictionary[CBId].CBstate[1]!=str(counter) or CBobjectDictionary[CBId].CBstate[2]!=str(counter) or CBobjectDictionary[CBId].CBstate[3]!=str(counter)):
					
					flag=0
			else:
				counter=counter+1
	else:
		while(flag and counter<8):
			if(SBobjectDictionary[SBId].D[counter] =='X'):
				if(CBobjectDictionary[CBId].CBstate[0]!=str(counter) or CBobjectDictionary[CBId].CBstate[1]!=str(counter) or CBobjectDictionary[CBId].CBstate[2]!=str(counter) or CBobjectDictionary[CBId].CBstate[3]!=str(counter)):
					
					flag=0
			else:
				counter=counter+1
	final=counter  #kp
	counter=counter*0 
	return final   



def checkFreeSBPort(SBId,SBFace):   #function checks for the index corresponding to free ports on a side of the switch block -- free ports have their status as 'X'
	
	counter=0
	free_port=0
	if(SBFace=='A'):
		
		while(1):
			if(SBobjectDictionary[SBId].A[counter] !='X'):
				counter=counter+1
			else:
				break;
	elif(SBFace=='B'):
		while(1):
			if(SBobjectDictionary[SBId].B[counter] !='X'):
				counter=counter+1
			else:
				break;
	elif(SBFace=='C'):
		while(1):
			if(SBobjectDictionary[SBId].C[counter] !='X'):
				counter=counter+1
			else:
				break;
	else:
		while(1):
			if(SBobjectDictionary[SBId].D[counter] !='X'):
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
	
	if(SBFace=='A'):
		
		return 	SBobjectDictionary[SBId].A	
	elif(SBFace=='B'):
		return 	SBobjectDictionary[SBId].B
	elif(SBFace=='C'):
		return 	SBobjectDictionary[SBId].C
	else:
		return 	SBobjectDictionary[SBId].D
	

def FindNextSBPos(currentSBId,nextSBId): #uses the SB_connect dictionary to get the posotion of a switch block which is laocated facing a particular side of the SB
	counterSB=0
	if(SB_connect.has_key(currentSBId) and SB_connect.has_key(nextSBId)):
		while(SB_connect[currentSBId][counterSB]!=SBobjectDictionary[nextSBId]):
			counterSB=counterSB+1
	
		return counterSB
	else:
		return 999


	

def conf_lastSB(SBId,fromSBFace,fromSBPortIndex,toCB,route,targetLUT):  #kp the fuction that connects the last SB in the route to the target CB
	count=0		
	stats=[]
	stats= SBFaceStatus(SBId,fromSBFace)
	route_len=len(route)

	
	if CB_connect[toCB][1]==route[route_len-2]:
		#SBId2=CB_connect[toCB][1]
		SBFace2=CB_connect[toCB][2]
		#print SBId2+'111'
		toSBPortIndex=checkFreeSBPort(SBId,SBFace2)
		#conf_lastSB(route[route_len-2],switch_adj_toCB['currentSBFace'],str(toSBPortIndex),SBFace2)
				
	elif CB_connect[toCB][3]==route[route_len-2]:
		#SBId2=CB_connect[toCB][3]
		SBFace2=CB_connect[toCB][4]
		#print SBId2
		toSBPortIndex=checkFreeSBPort(SBId,SBFace2)		
		#conf_lastSB(route[route_len-2],switch_adj_toCB['currentSBFace'],str(toSBPortIndex),SBFace2)	
		
	print "SBID= %s OriginSBFace= %s OriginSBIndex= %s TaretSBFace= %s SBIndex= %s"%(SBId,fromSBFace,fromSBPortIndex,SBFace2,toSBPortIndex) 
	
	#switchBlock.configSwitchBlock(SBobjectDictionary[route[route_len-2]],route[route_len-2],switch_adj_toCB['currentSBFace'],fromSBPortIndex,SBFace2,str(toSBPortIndex))
	switchBlock.configSwitchBlock(SBobjectDictionary[SBId],SBId,fromSBFace,str(fromSBPortIndex),SBFace2,str(toSBPortIndex))
		
	i_count=0
	final_CB_index=0

	while(CBobjectDictionary[toCB].CBstate[i_count] !='X'):
		i_count=i_count+1
		if(i_count==4):
			break
		print "i counnnntttt %s"%i_count
		#print 'icount %s'%i_count
	#if(1==2):
	#	print "ooo"
	if(i_count==4):
		i_count=i_count*0
		print 'no free port on the target CB'
	else:	
		
		outputCB=''
		if((CB_connect[toCB][5]==targetLUT) or CB_connect[toCB][6]==targetLUT):
			CBobjectDictionary[toCB].CBstate[i_count]=str(toSBPortIndex)
			x1=CBobjectDictionary[toCB].CBstate[0]
			x2=CBobjectDictionary[toCB].CBstate[1]
			x3=CBobjectDictionary[toCB].CBstate[2]
			x4=CBobjectDictionary[toCB].CBstate[3]
			q1=CBobjectDictionary[toCB].CBstate[4]
			q2=CBobjectDictionary[toCB].CBstate[5]
			CBobjectDictionary[toCB].configCB(toCB,x1,x2,x3,x4,q1,q2)
			final_CB_index=i_count
			i_count=i_count*0
			print'final CB Index from conf last CB %s'%final_CB_index
			return final_CB_index
			
		else:
			print 'incorrect origin LUT or target CB'
			return 999


def routing(route,fromCB,fromCBCode,toCB,toCBCode,originLUT,targetLUT):
	route_len=len(route)
	target_CB_port=999
	count=1
	if(lutobjectDictionary[originLUT].status!=1):
		print'LUT %s has not been configured'%originLUT
	if(route_len==3 and lutobjectDictionary[originLUT].status==1):
		if CB_connect[fromCB][1]==route[1]: #check if the next SB is to the left of the origin-CB
			SBId=CB_connect[fromCB][1]
			fromSBFace=CB_connect[fromCB][2]
		elif CB_connect[fromCB][3]==route[1]: #check if the next SB is to the right of the origin-CB
			SBId=CB_connect[fromCB][3]
			fromSBFace=CB_connect[fromCB][4]

		q1=CBobjectDictionary[fromCB].CBstate[4]  
		q2=CBobjectDictionary[fromCB].CBstate[5]
		outputCB=''
		if(CB_connect[fromCB][5]==originLUT):  #check if origin LUT is q1
			x1=CBobjectDictionary[fromCB].CBstate[0]
			x2=CBobjectDictionary[fromCB].CBstate[1]
			x3=CBobjectDictionary[fromCB].CBstate[2]
			x4=CBobjectDictionary[fromCB].CBstate[3]
			if(q1!='X'):
				fromSBPortIndex=int(CBobjectDictionary[fromCB].CBstate[4])
				print 'fromSBPortIndexxxxxxx %s'%fromSBPortIndex
				q2=CBobjectDictionary[fromCB].CBstate[5]
				CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,CBobjectDictionary[fromCB].CBstate[4],q2)
				SBobjectDictionary[SBId].setFaceStatus(SBFace,fromSBPortIndex,'Q')
				print 'strating SB %s %s port %s'%(SBId,SBFace,fromSBPortIndex)
				target_CB_port=conf_lastSB(SBId,fromSBFace,fromSBPortIndex,toCB,route,targetLUT)
			else:
				fromSBPortIndex=checkFreeSBPort_CBconnect(SBId,SBFace,x1,x2,x3,x4,fromCB)
				CBobjectDictionary[fromCB].CBstate[4]=str(fromSBPortIndex)
				q2=CBobjectDictionary[fromCB].CBstate[5]
				CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,CBobjectDictionary[fromCB].CBstate[4],q2)
				SBobjectDictionary[SBId].setFaceStatus(SBFace,fromSBPortIndex,'Q')
				print 'strating SB %s %s port %s'%(SBId,SBFace,fromSBPortIndex)
				target_CB_port=conf_lastSB(SBId,fromSBFace,fromSBPortIndex,toCB,route,targetLUT)
				#fromSBPortIndex=checkFreeSBPort(SBId,SBFace)   #kp
			#print 'q1111111: and freeindez %s  %s'%(CBobjectDictionary[fromCB].CBstate[4],fromSBPortIndex)
				q2=CBobjectDictionary[fromCB].CBstate[5]
				CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,CBobjectDictionary[fromCB].CBstate[4],q2)
				SBobjectDictionary[SBId].setFaceStatus(SBFace,fromSBPortIndex,'Q')
				print 'strating SB %s %s port %s'%(SBId,SBFace,fromSBPortIndex)
				target_CB_port=conf_lastSB(SBId,fromSBFace,fromSBPortIndex,toCB,route,targetLUT)
				#switch_adj_toCB=ConfNextSBPos(SBId,SBFace,route[count+1],fromSBPortIndex,route,route_len,count,0)
		if(CB_connect[fromCB][6]==originLUT):
			x1=CBobjectDictionary[fromCB].CBstate[0]
			x2=CBobjectDictionary[fromCB].CBstate[1]
			x3=CBobjectDictionary[fromCB].CBstate[2]
			x4=CBobjectDictionary[fromCB].CBstate[3]
			q1=CBobjectDictionary[fromCB].CBstate[4]
			if(q2!='X'):
				fromSBPortIndex=int(CBobjectDictionary[fromCB].CBstate[5])
				CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,q1,CBobjectDictionary[fromCB].CBstate[5])
				SBobjectDictionary[SBId].setFaceStatus(SBFace,fromSBPortIndex,'Q')
				print 'strating SB %s %s port %s'%(SBId,SBFace,fromSBPortIndex)
				target_CB_port=conf_lastSB(SBId,fromSBFace,fromSBPortIndex,toCB,route,targetLUT)
			else:
			   	fromSBPortIndex=checkFreeSBPort_CBconnect(SBId,SBFace,x1,x2,x3,x4,fromCB)
				CBobjectDictionary[fromCB].CBstate[5]=str(fromSBPortIndex)
			#print 'q22222 right and portindex : %s %s'%(CBobjectDictionary[fromCB].CBstate[5],fromSBPortIndex)
				CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,q1,CBobjectDictionary[fromCB].CBstate[5])
				SBobjectDictionary[SBId].setFaceStatus(SBFace,fromSBPortIndex,'Q')
				print 'strating SB %s %s port %s'%(SBId,SBFace,fromSBPortIndex)
				target_CB_port=conf_lastSB(SBId,fromSBFace,fromSBPortIndex,toCB,route,targetLUT)

	if(route_len>3 and lutobjectDictionary[originLUT].status==1):
		if CB_connect[fromCB][1]==route[1]: #check if the next SB is to the left of the origin-CB
			SBId=CB_connect[fromCB][1]
			fromSBFace=CB_connect[fromCB][2]
		elif CB_connect[fromCB][3]==route[1]: #check if the next SB is to the right of the origin-CB
			SBId=CB_connect[fromCB][3]
			fromSBFace=CB_connect[fromCB][4]

		q1=CBobjectDictionary[fromCB].CBstate[4]  
		q2=CBobjectDictionary[fromCB].CBstate[5]
		outputCB=''
		if(CB_connect[fromCB][5]==originLUT):  #check if origin LUT is q1
			x1=CBobjectDictionary[fromCB].CBstate[0]
			x2=CBobjectDictionary[fromCB].CBstate[1]
			x3=CBobjectDictionary[fromCB].CBstate[2]
			x4=CBobjectDictionary[fromCB].CBstate[3]
			if(q1!='X'):
				fromSBPortIndex=int(CBobjectDictionary[fromCB].CBstate[4])
			else:
				fromSBPortIndex=checkFreeSBPort_CBconnect(SBId,fromSBFace,x1,x2,x3,x4,fromCB)
				CBobjectDictionary[fromCB].CBstate[4]=str(fromSBPortIndex)
				#fromSBPortIndex=checkFreeSBPort(SBId,SBFace)   #kp
			#print 'q1111111: and freeindez %s  %s'%(CBobjectDictionary[fromCB].CBstate[4],fromSBPortIndex)
				q2=CBobjectDictionary[fromCB].CBstate[5]
				CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,CBobjectDictionary[fromCB].CBstate[4],q2)
				SBobjectDictionary[SBId].setFaceStatus(fromSBFace,fromSBPortIndex,'Q')
				print 'strating SB %s %s port %s'%(SBId,fromSBFace,fromSBPortIndex)
		if(CB_connect[fromCB][6]==originLUT):
			x1=CBobjectDictionary[fromCB].CBstate[0]
			x2=CBobjectDictionary[fromCB].CBstate[1]
			x3=CBobjectDictionary[fromCB].CBstate[2]
			x4=CBobjectDictionary[fromCB].CBstate[3]
			q1=CBobjectDictionary[fromCB].CBstate[4]
			if(q2!='X'):
				fromSBPortIndex=int(CBobjectDictionary[fromCB].CBstate[5])
			else:
			   	fromSBPortIndex=checkFreeSBPort_CBconnect(SBId,fromSBFace,x1,x2,x3,x4,fromCB)
				CBobjectDictionary[fromCB].CBstate[5]=str(fromSBPortIndex)
			#print 'q22222 right and portindex : %s %s'%(CBobjectDictionary[fromCB].CBstate[5],fromSBPortIndex)
				CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,q1,CBobjectDictionary[fromCB].CBstate[5])
				SBobjectDictionary[SBId].setFaceStatus(fromSBFace,fromSBPortIndex,'Q')
		currentSBId=route[1]
		currentSBFace=fromSBFace	
		while((count+1)<(route_len-1)):
			#currentSBFace=
			nxtSBpos_wrt_currSB=FindNextSBPos(route[count],route[count+1])
			print 'current SB %s next SB %s'%(route[count],route[count+1])
			if(count==route_len-2 or nxtSBpos_wrt_currSB==999):
				break
				#return {'currentport':fromSBPortIndex,'currentSBId':route[route_len-2],'currentSBFace':currentSBFace}
	
			nxtSBpos_wrt_currSB=FindNextSBPos(route[count],route[count+1])
			
			if(nxtSBpos_wrt_currSB==0):
				freeport=checkFreeSBPort(currentSBId,'A')
				switchBlock.configSwitchBlock(SBobjectDictionary[currentSBId],currentSBId,currentSBFace,str(fromSBPortIndex),'A',str(freeport))
			
				fromSBPortIndex=freeport
				currentSBFace='C'
				currentSBId=route[count+1]
				count=count+1
			
		
			elif(nxtSBpos_wrt_currSB==1):
				freeport=checkFreeSBPort(currentSBId,'B')
				#print 'free port %s '%(freeport)
				switchBlock.configSwitchBlock(SBobjectDictionary[currentSBId],currentSBId,currentSBFace,str(fromSBPortIndex),'B',str(freeport))
				print 'currentSBId %s B  freeport %s '%(currentSBId,freeport)
				fromSBPortIndex=freeport
				currentSBFace='D'
				currentSBId=route[count+1]
				count=count+1
		
		
			elif(nxtSBpos_wrt_currSB==2):
				freeport=checkFreeSBPort(currentSBId,'C')
				#print 'free port %s '%(freeport)
				switchBlock.configSwitchBlock(SBobjectDictionary[currentSBId],currentSBId,currentSBFace,str(fromSBPortIndex),'C',str(freeport))	
				print 'currentSBId %s C freeport %s count %s'%(currentSBId,freeport,count)
				fromSBPortIndex=freeport
				currentSBFace='A'
				currentSBId=route[count+1]
				count=count+1	
			
			else:
				freeport=checkFreeSBPort(currentSBId,'D')
				#print 'free port %s '%(freeport)
				switchBlock.configSwitchBlock(SBobjectDictionary[currentSBId],currentSBId,currentSBFace,str(fromSBPortIndex),'D',str(freeport))
				print 'currentSBId %s D freeport %s '%(currentSBId,freeport)
				fromSBPortIndex=freeport
				currentSBFace='B'
				currentSBId=route[count+1]
				count=count+1

		target_CB_port=conf_lastSB(route[route_len-2],currentSBFace,fromSBPortIndex,toCB,route,targetLUT)
		print 'target_CB_port %s'%target_CB_port
	if(target_CB_port!=999):	
		return target_CB_port
	else:
		return 999
			
			
	
			
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


def find_signal_CLB(target_LUT,originLUT):
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
##########################################routing logic ends##########################################################################





