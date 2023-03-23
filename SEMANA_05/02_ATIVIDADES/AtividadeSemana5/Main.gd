extends Node2D

#var teste = false #Variável nunca utilizada no código, pode ser deletada
#var valor = 0 #Variável nunca utilizada no código, pode ser deletada
var numero = 0 #O Godot não reconhece caracteres especiais, como o "´"
var lista = [] #Faltou acrescer o var no início
var nome = ''#Resolve o problema na linha 12, no qual a variável não estava definida, e na 13, na qual a variável sem valor retornava erro no código
var cont #Resolve o problema na linha 27, no qual a variável não era declarada

func _on_Button_pressed():
	#Coletando dados inseridos pelo usuário
	numero = int($LineEdit.text) #O Godot não reconhece caracteres especiais, como o ´, faltou o $ antes do LineEdit
	nome = $LineEdit2.text #A variável não foi definida anteriormente, e o nome não estava sendo definido pelo LineEdit, mas o contrário

func _on_Button2_pressed():
	#Incrementando o número inserido pelo usuário
	for i in range(10):
		numero += i #Identação inadequada e nome da variável errado
		lista.append(numero) #Erro no nome da variável
	$Label.text = str(lista) #É necessário tranformar a variável em string, para poder definir o texto

func _on_Button3_pressed():
	#Mudando o nome do usuário de acordo com os dados da lista
	#Se houver algum número ímpar o nome deve adicionar "baldo" ao final
	while len(lista): #Identação inadequada do while
		cont = 0 #Variável não definida e identação inadequada
		var i = 0 #Variável não definida anteriormente
		if lista[i] % 2 == 1: #Identação inadequada no formato do if, e troca do 0 por i, para poder passar por todos os elementos na lista
			cont += 1 #Identação inadequada
			i += 1 
	if cont != 0: #Identação inadequada no formato do if
		nome = nome + "baldo" #Identação inadequada
	$Label2.text = nome
