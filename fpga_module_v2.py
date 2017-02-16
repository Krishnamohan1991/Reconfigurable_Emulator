from pyparsing import*

#ParserElement.setDefaultWhitespaceChars(' \t')

i_consider_whitespaces_to_be_only = ' '
ParserElement.setDefaultWhitespaceChars(i_consider_whitespaces_to_be_only)


LUT_connect={"Q1":['00','04'],"Q2":['00','04'],"Q3":['00','01'],"Q4":['00','01'],"Q5":['00','02'],"Q6":['00','02'],"Q7":['00','00'],"Q8":['00','00'],

	     "Q9":['01','14'],"Q10":['01','14'],"Q11":['01','11'],"Q12":['01','11'],"Q13":['01','12'],"Q14":['01','12'],"Q15":['01','10'],"Q16":['01','10'],
		
             "Q17":['02','24'],"Q18":['02','24'],"Q19":['02','21'],"Q20":['02','21'],"Q21":['02','22'],"Q22":['02','22'],"Q23":['02','20'],"Q24":['02','20'],   
            
             "Q25":['03','34'],"Q26":['03','34'],"Q27":['03','31'],"Q28":['03','31'],"Q29":['03','32'],"Q30":['03','32'],"Q31":['03','30'],"Q32":['03','30']
	    }



#cb_connect is the dictionary whose key fiels it he CB ID and values: i)CB code ii)SB on the left iii)SB on the right

CB_connect={"00":['C1','00','01'],"01":['C2','01','11'],"02":['C3','10','11'],"03":['C4','00','10'],

	    "10":['C5','01','02'],"11":['C6','02','12'],"12":['C7','11','12'],"13":['C2','01','11'],
            
	    "20":['C7','11','12'],"21":['C8','12','22'],"22":['C9','21','22'],"23":['C10','11','21'],

	    "30":['C3','10','11'],"31":['C10','11','21'],"32":['C11','20','21'],"33":['C12','10','20']
	   }

LUT_function={"&":'1000000000000000',"|":'0111111111111111',"^":'0110100110010110'}


LUT_interconnect={"I0":'00000',"I1":'00001',"I2":'00010',"I3":'00011',"I4":'00100',
"I5":'00101',"I6":'00110',"I7":'00111',"I8":'01000',"I9":'01001',"I10":'01010',"I11":'01011',"I12":'01100',
"I13":'01101',"I14":'01110',"I15":'01111',"Q1":'10000',"Q2":'10001',"Q3":'10010',"Q4":'10011',"Q5":'10100',
"Q6":'10101',"Q7":'10110',"Q8":'10111',"Q9":'10000',"Q10":'10001',"Q11":'10010',"Q12":'10011', "Q13":'10100',
"Q14":'10101',"Q15":'10110',"Q16":'10111',"Q17":'10000',"Q18":'10001',"Q19":'10010',"Q20":'10011', "Q21":'10100',
"Q22":'10101', "Q23":'10110',"Q24":'10111', "Q25":'10000',"Q26":'10001', "Q27":'10010',"Q28":'10011', "Q29":'10100',
"Q30":'10101', "Q31":'10110',"Q32":'10111'}


def begins(cls):
	c=str(cls[2][0])
	print cls.function
	print cls.LUTId
	print LUT_interconnect[c]

input_port = oneOf("I0 I1 I2 I3 I4 I5 I6 I7 I8 I9 I10 I11 I12 I13 I14 I15").setResultsName('inputLine')
output_port = oneOf("Q1 Q2 Q3 Q4 Q5 Q6 Q7 Q8").setResultsName('LUTId')
operand = input_port | output_port
op = (oneOf("& | ^").setResultsName('function'))
bopen=Literal("(").suppress()
bclose=Literal(")").suppress()
comma=Literal(",").suppress()
equal=Literal("=").suppress()



lut_rhs= (Group(operand + comma + operand + comma + operand + comma + operand))

	
expression = output_port + equal + op + bopen + lut_rhs + bclose 
config=OneOrMore(expression)

 


counter=0


tests ="""\
Q1=&(I1,I2,I3,I4)
Q2=^(Q1,I3,I5,I6)
""".splitlines()





for test in tests:
	stats = config.parseString(test)
	begins(stats)
	counter+=1
	

print counter
	
