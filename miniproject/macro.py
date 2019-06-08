#	Developed by:
#			UJESH MAURYA (2015UCP1338)
#			KOMAL MITTAL (2015UCP1469)
#	SP Mini Project on Macro PreProcessor

obj = open("c_input.txt", "r")			#C input
#obj = open("p_input.txt", "r")			#python input
#obj = open("asm_input.txt", "r")		#NASM input
inp = obj.readlines()			
l=len(inp)
lenx=l
i=0
fp=5

while l>0 :
	if 'mstart' in inp[i]:			#searching for 'mstart' keyword
		hl=" ".join(inp[i].split())	#stripping white spaces
		hl=hl.rstrip()
		hl=hl[inp[i].find('mstart')+7:inp[i].find('(')]		#storing macro name
		param=[]				#list for formal parameters/arguments
		j=0		
		while '\n'!=inp[i][j]:			#adding formal parameters
			if ','==inp[i][j] or ')'==inp[i][j]:
				param.extend([inp[i][j-1]])
			j+=1
		
		i+=1
		l-=1
		mlist=[]				#list for storing body(expansion) of macro
		while 'mend' not in inp[i]:		#reading till 'mend' keyword
			tl=" ".join(inp[i].split())
			tl=tl.rstrip()
			#tl=tl+'\n'
			mlist.extend([tl])
			i+=1
			l-=1
		ms='\n'.join(mlist)
		
		i+=1
		l-=1
		j=i
		
		while j!=lenx:				#replacing the macro name with it's body and actual parameters
			if hl in inp[j]:
				nparam=[]			#list for actual parameters/arguments
				k=0
				while '\n'!=inp[j][k]:
					if ','==inp[j][k] or ')'==inp[j][k]:
						nparam.extend([inp[j][k-1]])
					k+=1
				
				for k in range(0,len(param)):
					ms=ms.replace("("+param[k]+")",nparam[k])	#replacing formal parameters with actual
				lsd=inp[j][inp[j].find(hl):inp[j].find(')')+1]
				
				xs=str(inp[j])
				xs=xs.replace(lsd,ms)					#replacing final expansion of macro
				
				inp[j]=xs
				ms=' '.join(mlist)
			j+=1
		
	l-=1
	i+=1
	if fp>0 and l<=0:
		fp-=1
		i=0
		l=lenx

flist=[]			#final list for adding main program after removal of macros
mad=0

for i in range(0,lenx):
	if inp[i][0]=='#':
		flist.extend(inp[i])
	elif 'main' in inp[i]:
		mad=1
		if '~~' in inp[i]:			#removing comments
			tt=inp[i].find('\n')
			flist.extend(inp[i][0:inp[i].find('~~')]+'\n')
			if inp[i].count('\n')>1:
				flist.extend(inp[i][tt+1:])
		else:
			flist.extend(inp[i])
	elif mad==1:
		if '~~' in inp[i]:				#removing comments
			tt=inp[i].find('\n')
			flist.extend(inp[i][0:inp[i].find('~~')]+'\n')
			if inp[i].count('\n')>1:
				flist.extend(inp[i][tt+1:])
		else:
			flist.extend(inp[i])
ss=''.join(flist)					#converting final list to set of strings joined together
print ss						#printing final code


#	Developed by:
#			UJESH MAURYA (2015UCP1338)
#			KOMAL MITTAL (2015UCP1469)
#	SP Mini Project on Macro PreProcessor
