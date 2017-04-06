#This is the class file representing all the resources available witin the FPGA

class fpga(object):

	def __init__(self,CB,SB,LUT,wire):

		self.CB=16
		self.SB=9
		self.LUT=32
		self.wire=96
	CB_00=dict{'I1':'X','I2':'X','I3':'X','I4':'X','Q1':'X','Q2':'X'}
	CB_01=dict{'I1':'X','I2':'X','I3':'X','I4':'X','Q1':'X','Q2':'X'}
	CB_02=dict{'I1':'X','I2':'X','I3':'X','I4':'X','Q1':'X','Q2':'X'}
	CB_03=dict{'I1':'X','I2':'X','I3':'X','I4':'X','Q1':'X','Q2':'X'}
	CB_10=dict{'I1':'X','I2':'X','I3':'X','I4':'X','Q1':'X','Q2':'X'}
	CB_11=dict{'I1':'X','I2':'X','I3':'X','I4':'X','Q1':'X','Q2':'X'}
	CB_12=dict{'I1':'X','I2':'X','I3':'X','I4':'X','Q1':'X','Q2':'X'}
	CB_13=dict{'I1':'X','I2':'X','I3':'X','I4':'X','Q1':'X','Q2':'X'}
                                                                 
	CB_20=dict{'I1':'X','I2':'X','I3':'X','I4':'X','Q1':'X','Q2':'X'}
	CB_21=dict{'I1':'X','I2':'X','I3':'X','I4':'X','Q1':'X','Q2':'X'}
	CB_22=dict{'I1':'X','I2':'X','I3':'X','I4':'X','Q1':'X','Q2':'X'}
	CB_23=dict{'I1':'X','I2':'X','I3':'X','I4':'X','Q1':'X','Q2':'X'}
	CB_30=dict{'I1':'X','I2':'X','I3':'X','I4':'X','Q1':'X','Q2':'X'}
	CB_31=dict{'I1':'X','I2':'X','I3':'X','I4':'X','Q1':'X','Q2':'X'}
	CB_32=dict{'I1':'X','I2':'X','I3':'X','I4':'X','Q1':'X','Q2':'X'}
	CB_33=dict{'I1':'X','I2':'X','I3':'X','I4':'X','Q1':'X','Q2':'X'}


class connection_block(fpga):
	def __init__(self,out_port,CB_code,sb_left,sb_right):
		pass

	def getPortStatus(self,CB_code,port):
		if CB_code==CB_00
			return CB_00(port)
		else if CB_code==CB_01
			return CB_01(port)
		else if CB_code==CB_02
			return CB_02(port)
		else if CB_code==CB_03
			return CB_03(port)
		else if CB_code==CB_10
			return CB_10(port)
		else if CB_code==CB_11
			return CB_11(port)
		else if CB_code==CB_12
			return CB_12(port)
		else if CB_code==CB_13
			return CB_13(port)
		else if CB_code==CB_20
			return CB_20(port)
		else if CB_code==CB_21
			return CB_21(port)
		else if CB_code==CB_22
			return CB_22(port)
		else if CB_code==CB_23
			return CB_23(port)
		else if CB_code==CB_30
			return CB_30(port)
		else if CB_code==CB_31
			return CB_31(port)
		else if CB_code==CB_32
			return CB_32(port)
		else if CB_code==CB_33
			return CB_33(port)


	def setPort(self,CB_code,port,port_to)
		if (getPortStatus(self,CB_code,port)=='X')
			
