cat1 = {"james":[1,2,3], "bob":[3,4,5]}
print cat1['james'][2]

cat1['james'][2]=999

print cat1['james'][2]

stk='ptr'
ft='ft'

def isPresent():
	key="jas"
	value = cat1.get(key, 1)  #returns dictionary value if key is present else returns 1
	print value
	#if is not null:
		
	#else:
	#	return 0


#print isPresent()


def convet():
	s='34'
	t=int(s)
	print s+'9'
	print t+9

convet()


def isto():
	key="james"
	value = cat1.get(key, 0)  #returns dictionary value if key is present else returns 1
	if value:
		print 'im in'
	else:
		print 'fuckedup'


isto()



if('C'>'A'):
	print 'bazingaaa'
else:
	print 'hakuna matata'

#print LUT_connect['Q17'][1]

class lut(object):
	def __init__(self,lookuptable,CLBcode,LUTcode,CBcode,output,input1,input2,input3,input4):
		lookuptable=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
		CLBcode='00'
		LUTcode='00'
		CB_code='00'
		output=''
		input1=''
		input2=''
		input3=''
		input4=''
		mux_switch=1
