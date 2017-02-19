class lut(object):
	def __init__(self,outputp):
		self.lutTable='0000000000000000'
		self.muxSwitch='1'
		self.outputPort=outputp
		self.inputPort1='00000'
		self.inputPort2='00000'
		self.inputPort3='00000'
		self.inputPort4='00000'

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
		return LUTID

	def bits(self):
		
		s=str(self.inputPort4+self.inputPort3+self.inputPort2+self.inputPort1+self.muxSwitch+self.lutTable)	
		return s
		

    #print name




objectNames = ["Q1", "Q2", "Q3", "Q4", "Q5" ,"Q6", "Q7", "Q8" \
	       ,"Q9" ,"Q10", "Q11", "Q12" ,"Q13", "Q14" \
              ,"Q15", "Q16", "Q17", "Q18", "Q19", "Q20", "Q21" ,"Q22" ,"Q23", "Q24" ,"Q25", "Q26", "Q27", "Q28" ,"Q29", "Q30" ,"Q31", "Q32"]
lutobjectDictionary = {}
for name in objectNames:
    lutobjectDictionary[name] = lut(name)


#print lutobjectDictionary['Q2'].muxSwitch

#creating objects for each LUT



