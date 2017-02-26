from fpga_dict import*
class lut(object):
	def __init__(self,outputp):
		self.lutTable='0000000000000000'
		self.muxSwitch='1'
		self.outputPort=outputp
		self.inputPort1='00000'
		self.inputPort2='00000'
		self.inputPort3='00000'
		self.inputPort4='00000'
		self.status=0

	def lutConfig(self,LUTID,function,input1,input2,input3,input4,muxSw):
		#print LUTID,
		#print self
		self.lutTable=function
		self.muxSwitch=muxSw
		self.outputPort=LUTID
		self.inputPort1=input1
		self.inputPort2=input2
		self.inputPort3=input3
		self.inputPort4=input4
		self.status=1
		return LUTID

	def bits(self):
		
		s=str(self.inputPort4+self.inputPort3+self.inputPort2+self.inputPort1+self.muxSwitch+self.lutTable)	
		return s
		

  

#creating objects for each LUT


objectNames = ["Q1", "Q2", "Q3", "Q4", "Q5" ,"Q6", "Q7", "Q8" \
	       ,"Q9" ,"Q10", "Q11", "Q12" ,"Q13", "Q14" \
              ,"Q15", "Q16", "Q17", "Q18", "Q19", "Q20", "Q21" ,"Q22" ,"Q23", "Q24" ,"Q25", "Q26", "Q27", "Q28" ,"Q29", "Q30" ,"Q31", "Q32"]
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
	'''	
	def configSBNext(self,switchID,toFace,toFaceIndex):
		
		if toFace=='A':
			
			index=0
			state=switchBlock.getFaceStatus(SB_connect[switchID][0],switchBlock.adjSBface(self,toFace),toFaceIndex)
		elif toFace=='B':
			index=1
			state=switchBlock.getFaceStatus(SB_connect[switchID][1],switchBlock.adjSBface(self,toFace),toFaceIndex)
		elif toFace=='C':
			index=2
			state=switchBlock.getFaceStatus(SB_connect[switchID][2],switchBlock.adjSBface(self,toFace),toFaceIndex)
		else:
			index=3
			state=switchBlock.getFaceStatus(SB_connect[switchID][3],switchBlock.adjSBface(self,toFace),toFaceIndex)
		return state
	'''
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
		switchKey= str(fromFace+fromFaceIndex+toFace+toFaceIndex)
		self.switchID=switchID
		if(fromFace==toFace):
			print 'raise exception cannot have connections in the same face'
		else:
			if(switchBlock.getFaceStatus(self,fromFace,fromFaceIndexnum)=='I'):
				if(switchBlock.getFaceStatus(self,toFace,toFaceIndexnum)=='X'):
					switchBlock.setFaceStatus(self,toFace,toFaceIndexnum,'I')
					if(switchBlock.faceValue(self,fromFace)<switchBlock.faceValue(self,toFace)):
						SBobjectDictionary[switchID].switchDict[switchKey]="11"
					else:
						SBobjectDictionary[switchID].switchDict[switchKey]="10"
					if(switchBlock.configSBNext(self,switchID,toFace,toFaceIndex)!='X'):
						switchBlock.setFaceStatus(switchBlock.configSBNext(SBobjectDictionary[switchID],switchID,toFace,toFaceIndex),switchBlock.adjSBface(SBobjectDictionary[switchID],toFace),toFaceIndexnum,'I')
					
				else:
					print 'both ports are signals:signal collission. I and I or I and O'
				
			elif(switchBlock.getFaceStatus(self,fromFace,fromFaceIndexnum)=='O'):
				if(switchBlock.getFaceStatus(self,toFace,toFaceIndexnum)=='X'):
					switchBlock.setFaceStatus(self,toFace,toFaceIndexnum,'O')
					if(switchBlock.configSBNext(self,switchID,toFace,toFaceIndex)!='X'):
						switchBlock.setFaceStatus(switchBlock.configSBNext(SBobjectDictionary[switchID],switchID,toFace,toFaceIndex),switchBlock.adjSBface(SBobjectDictionary[switchID],toFace),toFaceIndexnum,'O')
					
				else:
					print 'both ports are signals:signal collission'
				if(switchBlock.faceValue(self,fromFace)<switchBlock.faceValue(self,toFace)):
					self.switchDict[switchKey]="11"
				else:
					self.switchDict[switchKey]="10"


			else:
				print 'no signal at from port'


		
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
		ptrs=[pt0,pt1,pt2,pt3,pt4,pt5,pt6,pt7]
		for m in range(0,8):
			index_m=str(m)
			self.ioDict[index_m]=IOBlocks.setIOBits(self,self.ioConf[m],m)
			#print IOBlocks.setIOBits(self,self.ioConf[m],m)
		
		index=0
		for i in ptrs:
			if index<8:
				switchBlock.setFaceStatus(SBobjectDictionary[IO_connect[ioId][0]],IO_connect[ioId][1],index,i)
				index=index+1

	

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
		

class connectionBlock(object):
	def __init__(self,cbId):
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




CB_objects=["00", "01", "02", "03","10", "11", "12", "13" ,"20", "21", "22","23","30","31","32","33"]

CBobjectDictionary = {}
for name in CB_objects:
    CBobjectDictionary[name] = connectionBlock(name)


#SB_Map_code key:SB code ---values:code representing the SB on the CB_SB_map dictionary
SB_Map_code = {"00":"SB00", "01":"SB01", "02":"SB02", "10":"SB10", "11":"SB11", "12":"SB12", "20":"SB20", "21":"SB21","22":"SB22"}
	       
#CB_Map_code key:CB code ----values:code representing the CB on the CB_SB_map dictionary
CB_map_code={"00":'C1',"01":'C2',"02":'C3',"03":'C4',

	    "10":'C5',"11":'C6',"12":'C7',"13":'C2',
            
	    "20":'C7',"21":'C8',"22":'C9',"23":'C10',

	    "30":'C3',"31":'C10',"32":'C11',"33":'C12'}



#CB_SB_map is the graphical representation of the CB and SB layout on the FPGA skeleton

CB_SB_map={"SB00":['C1','SB01','C4','SB10'],
	  "SB01":['SB00','SB02','SB11','C1','C5','C2'],
	  "SB02":['SB01','SB12','C5','C6'],
	  "SB10":['SB00','SB11','SB20','C4','C12'],
	  "SB11":['SB01','SB21','SB12','SB10','C3','C7'],
	  "SB12":['SB02','SB22','SB11','C6','C8','C7'],
          "SB20":['SB10','SB21','C12','C11'],
	  "SB21":['SB20','SB11','SB22','C11','C9'],
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


def find_shortest_path(graph, start, end, path=[]):	#fix plag
        path = path + [start]
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



pa=[]

pa=find_shortest_path(CB_SB_map,'C1','C9')
print pa

for i in pa:
	print i

