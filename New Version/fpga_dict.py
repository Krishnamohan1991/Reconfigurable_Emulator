
#LUT_connect dict key value=LUTID and values i)CLBID ii)Connection block Id 

LUT_connect={"Q00_0":['00','00_3'],"Q00_1":['00','00_3'],"Q00_2":['00','00_1'],"Q00_3":['00','00_1'],"Q00_4":['00','00_2'],"Q00_5":['00','00_2'],"Q00_6":['00','00_0'],"Q00_7"\
:['00','00_0'],"Q01_0":['01','01_3'],"Q01_1":['01','01_3'],"Q01_2":['01','01_1'],"Q01_3":['01','01_1'],"Q01_4":['01','01_2'],"Q01_5":['01','01_2'],"Q01_6":['01','01_0'],"Q01_7"\
:['01','01_0'],"Q11_0":['11','11_3'],"Q11_1":['11','11_3'],"Q11_2":['11','11_1'],"Q11_3":['11','11_1'],"Q11_4":['11','11_2'],"Q11_5":['11','11_2'],"Q11_6":['11','11_0'],"Q11_7"\
:['11','11_0'], "Q10_0":['10','10_3'],"Q10_1":['10','10_3'],"Q11_2":['10','10_1'],"Q11_3":['10','10_1'],"Q11_4":['10','10_2'],"Q11_5":['10','10_2'],"Q11_6":['10','10_0'],"Q11_7"\
:['10','10_0']
	    }

#cb_connect is the dictionary whose key field store the Connection block ID and values: i)CB code(identical for CB sharing the same global lines) 
#  ii)SB on the left iii)face of SB on the left iii)SB on the right iv)face of SB on the right iv)output lut at q1 v)output lut at q2

CB_connect={"00_0":['C1','00','B','01','D','Q00_6','Q00_7'],"00_1":['C2','01','C','11','A','Q00_2','Q00_3'],"00_2":['C3','10','B','11','D','Q00_4','Q00_5'],"00_3":['C4','00','C','10','A','Q00_0','Q00_1'],

	    "01_0":['C5','01','B','02','D','Q01_6','Q01_7'],"01_1":['C6','02','C','12','A','Q01_2','Q01_3'],"01_2":['C7','11','B','12','D','Q01_4','Q01_5'],"01_3":['C2','01','C','11','A','Q01_0','Q01_1'],
            
	    "11_0":['C7','11','B','12','D','Q11_6','Q11_7'],"11_1":['C8','12','C','22','A','Q11_2','Q11_3'],"11_2":['C9','21','B','22','D','Q11_4','Q11_5'],"11_3":['C10','11','C','21','A','Q11_0','Q11_1'],

	    "10_0":['C3','10','B','11','D','Q10_6','Q10_7'],"10_1":['C10','11','C','21','A','Q10_2','Q10_3'],"10_2":['C11','20','B','21','D','Q10_4','Q10_5'],"10_3":['C12','10','C','20','A','Q10_0','Q10_1']
	   }

#CB_input_output_connect :-> key: CBId values: the four input ports and 2 output ports connected to each CB

CB_input_output_connect={"00_0":['I12','I13','I14','I15','Q00_6','Q00_7'],"00_1":['I4','I5','I6','I7','Q00_2','Q00_3'],"00_2":['I8','I9','I10','I11','Q00_4','Q00_5'],
			"00_3":['I0','I1','I2','I3','Q00_0','Q00_1'],

	    "01_0":['I12','I13','I14','I15','Q01_6','Q01_7'],"01_1":['I4','I5','I6','I7','Q01_2','Q01_3'],"01_2":['I8','I9','I10','I11','Q01_4','Q01_5'],"01_3":['I0','I1','I2','I3','Q01_0','Q01_1'],
            
	    "11_0":['I12','I13','I14','I15','Q11_6','Q11_7'],"11_1":['I4','I5','I6','I7','Q11_2','Q11_3'],"11_2":['I8','I9','I10','I11','Q11_4','Q11_5'],"11_3":['I0','I1','I2','I3','Q11_0','Q11_1'],

	    "10_0":['I12','I13','I14','I15','Q10_6','Q10_7'],"10_1":['I4','I5','I6','I7','Q10_2','Q10_3'],"10_2":['I8','I9','I10','I11','Q10_4','Q10_5'],"10_3":['I0','I1','I2','I3','Q10_0','Q10_1']
	   }


#LUT_function key- function keyword value-LUT entry

LUT_function={"AND":'1000000000000000',"OR":'0111111111111111',"XOR":'0110100110010110'}


#LUT_interconnect :> key=code for input or output ports values=coresponding configuration bits
LUT_interconnect={"I0":'00000',"I1":'00001',"I2":'00010',"I3":'00011',"I4":'00100',
"I5":'00101',"I6":'00110',"I7":'00111',"I8":'01000',"I9":'01001',"I10":'01010',"I11":'01011',"I12":'01100',
"I13":'01101',"I14":'01110',"I15":'01111',"Q00_0":'10000',"Q00_1":'10001',"Q00_2":'10010',"Q00_3":'10011',"Q00_4":'10100',
"Q00_5":'10101',"Q00_6":'10110',"Q00_7":'10111',"Q01_0":'10000',"Q01_1":'10001',"Q01_2":'10010',"Q01_3":'10011', "Q01_4":'10100',
"Q01_5":'10101',"Q01_6":'10110',"Q01_7":'10111',"Q11_0":'10000',"Q11_1":'10001',"Q11_2":'10010',"Q11_3":'10011', "Q11_4":'10100',
"Q11_5":'10101', "Q11_6":'10110',"Q11_7":'10111', "Q10_0":'10000',"Q10_1":'10001', "Q10_2":'10010',"Q10_3":'10011', "Q10_4":'10100',
"Q10_5":'10101', "Q10_6":'10110',"Q10_7":'10111'}






