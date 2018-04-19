
f = open('entrada')
pilha = []

for line in f:
    aux = line.split()

    print(aux)

    if(aux[0] == 'PUSH'):
    	pilha.append(int(aux[1]))

    elif(aux[0]=='MULT'):
    	num1 = pilha.pop()
    	num2 = pilha.pop()
    	pilha.append(num1*num2)

    elif(aux[0]=='DIV'):
    	num1 = pilha.pop()
    	num2 = pilha.pop()
    	pilha.append(num2/num1)

    elif(aux[0]=='SOMA'):
    	num1 = pilha.pop()
    	num2 = pilha.pop()
    	pilha.append(num1+num2)

    elif(aux[0]=='SUB'):
    	num1 = pilha.pop()
    	num2 = pilha.pop()
    	pilha.append(num2-num1)

    elif(aux[0]=='PRINT'):
    	print(pilha.pop())

f.close()
