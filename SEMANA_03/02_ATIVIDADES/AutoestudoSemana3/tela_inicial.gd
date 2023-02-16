extends Node2D

var lista = ["João", "Pedro", "Lucas"]
var lista2 = []
var texto 

func _on_Button_pressed():
	$ColorRect/resposta.text = str(lista)

func _on_boto2_pressed():
	lista2 = $lista.text
	$respostaLista.text = lista2

func _on_Button2_pressed():
	$Label.text = 'No meio do caminho tinha uma pedra'

func _on_Button3_pressed():
	texto = $LineEdit.text
	$Label2.text = texto
