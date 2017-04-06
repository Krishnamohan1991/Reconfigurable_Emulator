def routing(route,fromCB,fromCBCode,toCB,toCBCode,originLUT,targetLUT):
	route_len=(len)route
	count=1
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
			else:
				fromSBPortIndex=checkFreeSBPort_CBconnect(SBId,SBFace,x1,x2,x3,x4,fromCB)
				CBobjectDictionary[fromCB].CBstate[4]=str(fromSBPortIndex)
				#fromSBPortIndex=checkFreeSBPort(SBId,SBFace)   #kp
			#print 'q1111111: and freeindez %s  %s'%(CBobjectDictionary[fromCB].CBstate[4],fromSBPortIndex)
				q2=CBobjectDictionary[fromCB].CBstate[5]
				CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,CBobjectDictionary[fromCB].CBstate[4],q2)
				SBobjectDictionary[SBId].setFaceStatus(SBFace,fromSBPortIndex,'Q')
				print 'strating SB %s %s port %s'%(SBId,SBFace,fromSBPortIndex)
				target_CBport=conf_lastSB(SBId,fromSBFace,fromSBPortIndex,toCB,route,targetLUT)
				#switch_adj_toCB=ConfNextSBPos(SBId,SBFace,route[count+1],fromSBPortIndex,route,route_len,count,0)
		if(CB_connect[fromCB][6]==originLUT):
			x1=CBobjectDictionary[fromCB].CBstate[0]
			x2=CBobjectDictionary[fromCB].CBstate[1]
			x3=CBobjectDictionary[fromCB].CBstate[2]
			x4=CBobjectDictionary[fromCB].CBstate[3]
			q1=CBobjectDictionary[fromCB].CBstate[4]
			if(q2!='X'):
				fromSBPortIndex=int(CBobjectDictionary[fromCB].CBstate[5])
			else:
			   	fromSBPortIndex=checkFreeSBPort_CBconnect(SBId,SBFace,x1,x2,x3,x4,fromCB)
				CBobjectDictionary[fromCB].CBstate[5]=str(fromSBPortIndex)
			#print 'q22222 right and portindex : %s %s'%(CBobjectDictionary[fromCB].CBstate[5],fromSBPortIndex)
				CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,q1,CBobjectDictionary[fromCB].CBstate[5])
				SBobjectDictionary[SBId].setFaceStatus(SBFace,fromSBPortIndex,'Q')
				print 'strating SB %s %s port %s'%(SBId,SBFace,fromSBPortIndex)
				target_CBport=conf_lastSB(SBId,fromSBFace,fromSBPortIndex,toCB,route,targetLUT)

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
				fromSBPortIndex=checkFreeSBPort_CBconnect(SBId,SBFace,x1,x2,x3,x4,fromCB)
				CBobjectDictionary[fromCB].CBstate[4]=str(fromSBPortIndex)
				#fromSBPortIndex=checkFreeSBPort(SBId,SBFace)   #kp
			#print 'q1111111: and freeindez %s  %s'%(CBobjectDictionary[fromCB].CBstate[4],fromSBPortIndex)
				q2=CBobjectDictionary[fromCB].CBstate[5]
				CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,CBobjectDictionary[fromCB].CBstate[4],q2)
				SBobjectDictionary[SBId].setFaceStatus(SBFace,fromSBPortIndex,'Q')
				print 'strating SB %s %s port %s'%(SBId,SBFace,fromSBPortIndex)
		if(CB_connect[fromCB][6]==originLUT):
			x1=CBobjectDictionary[fromCB].CBstate[0]
			x2=CBobjectDictionary[fromCB].CBstate[1]
			x3=CBobjectDictionary[fromCB].CBstate[2]
			x4=CBobjectDictionary[fromCB].CBstate[3]
			q1=CBobjectDictionary[fromCB].CBstate[4]
			if(q2!='X'):
				fromSBPortIndex=int(CBobjectDictionary[fromCB].CBstate[5])
			else:
			   	fromSBPortIndex=checkFreeSBPort_CBconnect(SBId,SBFace,x1,x2,x3,x4,fromCB)
				CBobjectDictionary[fromCB].CBstate[5]=str(fromSBPortIndex)
			#print 'q22222 right and portindex : %s %s'%(CBobjectDictionary[fromCB].CBstate[5],fromSBPortIndex)
				CBobjectDictionary[fromCB].configCB(fromCB,x1,x2,x3,x4,q1,CBobjectDictionary[fromCB].CBstate[5])
				SBobjectDictionary[SBId].setFaceStatus(SBFace,fromSBPortIndex,'Q')
		while((count+1)<(route_len-1)):
			#currentSBFace=
			nxtSBpos_wrt_currSB=FindNextSBPos(route[count],route[count+1])
			print 'current SB %s next SB %s'%(route[count],route[count+1])
			if(count==route_len-2 or nxtSBpos_wrt_currSB=999):
				break
				#return {'currentport':fromSBPortIndex,'currentSBId':route[route_len-2],'currentSBFace':currentSBFace}
	
			nxtSBpos_wrt_currSB=FindNextSBPos(route[count],route[count+1])
			
			if(nxtSBpos_wrt_currSB==0):
			freeport=checkFreeSBPort(currentSBId,'A')
			switchBlock.configSwitchBlock(SBobjectDictionary[currentSBId],currentSBId,currentSBFace,str(fromSBPortIndex),'A',str(freeport))
			
			fromSBPortIndex=freeport
			currentSBFace='C'
			currentSBId=nextSBId
			count=count+1
			
		
		elif(nxtSBpos_wrt_currSB==1):
			freeport=checkFreeSBPort(currentSBId,'B')
			#print 'free port %s '%(freeport)
			switchBlock.configSwitchBlock(SBobjectDictionary[currentSBId],currentSBId,currentSBFace,str(fromSBPortIndex),'B',str(freeport))
			print 'currentSBId %s B  freeport %s '%(currentSBId,freeport)
			fromSBPortIndex=freeport
			currentSBFace='D'
			currentSBId=nextSBId
			count=count+1
		
		
		elif(nxtSBpos_wrt_currSB==2):
			freeport=checkFreeSBPort(currentSBId,'C')
			#print 'free port %s '%(freeport)
			switchBlock.configSwitchBlock(SBobjectDictionary[currentSBId],currentSBId,currentSBFace,str(fromSBPortIndex),'C',str(freeport))	
			print 'currentSBId %s C freeport %s count %s'%(currentSBId,freeport,count)
			fromSBPortIndex=freeport
			currentSBFace='A'
			currentSBId=nextSBId
			count=count+1	
			
		else:
			freeport=checkFreeSBPort(currentSBId,'D')
			#print 'free port %s '%(freeport)
			switchBlock.configSwitchBlock(SBobjectDictionary[currentSBId],currentSBId,currentSBFace,str(fromSBPortIndex),'D',str(freeport))
			print 'currentSBId %s D freeport %s '%(currentSBId,freeport)
			fromSBPortIndex=freeport
			currentSBFace='B'
			currentSBId=nextSBId
			count=count+1

		target_CBport=conf_lastSB(route[route_len-2],currentSBFace,fromSBPortIndex,toCB,route,targetLUT)
	return target_CB_port
			
				



	
		
