#REGISTRADORES

registradores = ['$at', '$v0', '$v1', '$a0', '$a1', '$a3' ,'$t0' , '$t1' , '$t2', '$t3', '$t4', '$t5', '$t6', '$t7', '$s0', '$s1', '$s2', '$s3', '$s4', '$s5', '$s6', '$s7', 't8', '$t9', '$k0', '$k1', '$gp', '$sp', '$fp', '$ra']

#REPRESENTAÇÃO NUMÉRICA DOS REGISTRADORES

registradores_num = ['1', '2', '3', '4', '5', '6' ,'7' , '8' , '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31'] 

#TIPOS DE INSTRUÇÕES

instruções_R = ['add', 'addu', 'sub', 'subu', 'mult', 'multu', 'div', 'divu', 'mfhi', 'mflo', 'and', 'or', 'xor', 'nor', 'slt'
'sltu', 'sll', 'sllv', 'srl', 'srlv', 'sra', 'srav', 'jr', 'jalr', 'syscall']

instruções_I = ['addi', 'addiu', 'lw', 'lh', 'lhu', 'lb', 'lbu', 'sw', 'sh', 'sb', 'lui', 'ori', 'andi', 'xori', 'slti', 'sltiu', 'beq', 'bne']

instruções_J = ['j', 'jal']

#OPCODE OU FUNCT DAS INSTRUÇÕES

funct_R = ['0x20', '0x21', '0x22', '0x23', '0x18', '0x19', '0xla', '0x1b', '0x10', '0x12', '0x24', '0x25', '0x26', '0x27', '	0x2a', '0x2b', '0x00', '0x04', '0x02', '0x06', '0x03', '0x07', '0x08', '0x09', '0x0c']

opcode_I = ['0x08', '0x09', '0x23', '0x21', '0x25', '0x20', '0x24', '0x2b', '0x29', '0x28', '0x0f', '0x0d', '0x0c', '0x0e', '0x0a', '0x0b', '0x04', '0x05']

opcode_J = ['0x02', '0x03']


################################################################################################################################################

#ARQUIVOS
arq_aux = open('assembly_mips.s','r') 
arq = open('assembly_mips.s','r')

linhas = arq_aux.readlines()
qtd_linhas = len(linhas)

for i in range(qtd_linhas):
	linha_codigo = arq.readline()
	lista = linha_codigo.split()
	
	label = '1'

	#VERIFICA SE É UMA INSTRUÇÃO DO TIPO R
	for cont in range(24):
		if(lista[0] == instruções_R[cont]):
			tipo_instrução = "R"
			label = '0'

	#VERIFICA SE É UMA INSTRUÇÃO DO TIPO 
	for cont in range(17):
		if(lista[0] == instruções_I[cont]):
			tipo_instrução = "I"
			label = '0'


	#VERIFICA SE É UMA INSTRUÇÃO DO TIPO J
	for cont in range(1): 
		if(lista[0] == instruções_J[cont]):
			tipo_instrução = "J"
			label = '0'	
	
	#VERIFICA SE FOI PASSADO UMA LABEL
	if(label == '1'):
		label = str(lista[0])
		condição_label = label.find(':')
		if(condição_label == -1):		
			break	
		else:
			num_label = qtd_linhas
			num_label = bin(num_label)
			continue


	#TRATAMENTO DA INSTRUÇÃO TIPO R
	if(tipo_instrução == 'R'):
		instrução = lista[0]	
		lista.pop(0)
		lista = str(lista).strip('[]')
		lista = lista.strip('')
		lista = lista.replace("'",'')
		lista = lista.split(',')
		
		#VERIFICAÇÃO DE REGISTRADORES
		aux1 = 0
		aux2 = 0
		aux3 = 0

		for cont in registradores:
			if(lista[0] == cont):	
				aux1 = 1
				break

		for cont in registradores:
			if(lista[1] == cont):
				aux2 = 1
				break

		for cont in registradores:
			if(lista[2] == cont):
				aux3 = 1
				break
	

		#TRATAMENTO DOS REGISTRADORES

		rs = str(lista[1]) #rs
		rt = str(lista[2]) #rt
		rd = str(lista[0]) #rd

		#DESCOBRiR NÚMERO REFERENTE A REGISTRADOR
		
		#REFERENTE AO RS
		for i in registradores:
			if(i == rs):
				index = registradores.index(i)
				break

		aux = int(registradores_num[index])
		rs = aux
	
		#REFERENTE AO RT
		for i in registradores:
			if(i == rt):
				index = registradores.index(i)
				break

		aux = int(registradores_num[index])
		rt = aux	

		#REFERENTE AO RD
		for i in registradores:
			if(i == rd):
				index = registradores.index(i)
				break

		aux = int(registradores_num[index])
		rd = aux
	
	
		#TRANSFORMA OS REGISTRADORES EM HEXADECIMAL 
		rs = bin(rs)
		rt = bin(rt)
		rd = bin(rd)

		#ESCREVE NO ARQUIVO assembly.m
		arq_hexadecimal = open('assembly.m', 'a')
		arq_hexadecimal.write("00")
		arq_hexadecimal.write(rs)
		arq_hexadecimal.write(rt)
		arq_hexadecimal.write(rd)
		arq_hexadecimal.write("00")
		for i in instruções_R:
			if(instrução == i): 
				funct_index = instruções_R.index(i)
		arq_hexadecimal.write(funct_R[funct_index])
		arq_hexadecimal.write("\n")
		continue

################################################################################################################################################

	#TRATAMENTO DE INSTRUÇÃO TIPO I
	elif(tipo_instrução == 'I'):
		instrução = lista[0]

		#INSTRUÇÕES LW E SW POSSUEM UM TRATAMENTO ESPECIAL
		if(instrução == "lw" or instrução == "sw"): 	
			lista.pop(0)
			lista = str(lista)
			lista = lista.replace(',',' ')
			lista = lista.replace('(','')
			lista = lista.replace(')','')
			lista = lista.replace('[','')
			lista = lista.replace(']','')
			lista = lista.replace("'",'')
			lista = lista.replace("'",'')
			lista = lista.replace("$",' $')
			lista = lista.split()

		
			#VERIFICAÇÃO DE REGISTRADORES
			aux1 = 0
			aux2 = 0

			for cont in registradores:
				if(lista[0] == cont):	
					aux1 = 1
					break


			for cont in registradores:
				if(lista[2] == cont):
					aux2 = 1
					break


			#TRATAMENTO DE REGISTRADORES
			rt = str(lista[0]) #rt
			rd = str(lista[2]) #rd

			#DESCOBRIR NÚMERO REFERENTE AO REGISTRADOR
	
			#REFERENTE AO RT
			for i in registradores:
				if(i == rt):
					index = registradores.index(i)
					break

			aux = int(registradores_num[index])
			rt = aux	

			#REFERENTE AO RD
			for i in registradores:
				if(i == rd):
					index = registradores.index(i)
					break

			aux = int(registradores_num[index])
			rd = aux
			
			#RECEBE O ENDEREÇO
			adress = 4*int(lista[1])


			#TRANSFORMA OS REGISTRADORES E O ENDEREÇO EM HEXADECIMAL
			rt = bin(rt)
			rd = bin(rd)
			adress = bin(adress)

			#ESCREVE NO ARQUIVO			
			arq_hexadecimal = open('assembly.m', 'a')			
			if(tipo_instrução == 'I'):
				for i in instruções_I:
					if(instrução == i): 
						funct_index = instruções_I.index(i)
				arq_hexadecimal.write(opcode_I[funct_index])
				arq_hexadecimal.write(rt)
				arq_hexadecimal.write(rd)
				arq_hexadecimal.write(adress)
				arq_hexadecimal.write("\n")
				continue
		
		#TRATAMENTO REFERENTE AS OUTRAS INSTRUÇÕES DO TIPO I
		else:		
			lista.pop(0)
			lista = str(lista)
			lista = lista.replace(',',' ')
			lista = lista.replace("'",'')
			lista = lista.replace("'",'')
			lista = lista.replace("[",'')
			lista = lista.replace("]",'')			
			lista = lista.split()

			aux1 = 0
			aux2 = 0
			
			#VERIFICAÇÃO DE REGISTRADORES	
			for cont in registradores:
				if(lista[0] == cont):	
					aux1 = 1
					break


			for cont in registradores:
				if(lista[1] == cont):
					aux2 = 1
					break
				
			#TRATAMENTO DE REGISTRADORES
			rt = str(lista[0]) #rt
			rd = str(lista[1]) #rd				

			for i in registradores:
				if(i == rt):
					index = registradores.index(i)
					break

			aux = int(registradores_num[index])
			rt = aux	

			#REFERENTE AO RD
			for i in registradores:
				if(i == rd):
					index = registradores.index(i)
					break

			aux = int(registradores_num[index])
			rd = aux

		        #CONSTANTE PASSADA PELO USUÁRIO
			constant = int(lista[2])


			#TRANSFORMA REGISTRADORES E CONSTANTE EM HEXADECIMAL 
			rt = bin(rt)
			rd = bin(rd)
			constant = bin(constant)
			
			#ESCREVE NO ARQUIVO
			arq_hexadecimal = open('assembly.m', 'a')
			for i in instruções_I:
				if(instrução == i): 
					funct_index = instruções_I.index(i)
			arq_hexadecimal.write(opcode_I[funct_index])
			arq_hexadecimal.write(rt)
			arq_hexadecimal.write(rd)
			arq_hexadecimal.write(constant)
			arq_hexadecimal.write("\n")
			continue

################################################################################################################################################

	#INSTRUÇÃO DO TIPO J	
	else:
		#COMO A LABEL JÁ FOI DECLARADA BASTA ESCREVER O OPCDODE + ENDEREÇO PASSADO
		#ESCREVE NO ARQUIVO
		arq_hexadecimal = open('assembly.m', 'a')
		instrução = lista[0]
		for i in instruções_J:
			if(instrução == i): 
				funct_index = instruções_J.index(i)
		arq_hexadecimal.write(opcode_J[funct_index])
		arq_hexadecimal.write(num_label)
		arq_hexadecimal.write("\n")
		continue


################################################################################################################################################


















