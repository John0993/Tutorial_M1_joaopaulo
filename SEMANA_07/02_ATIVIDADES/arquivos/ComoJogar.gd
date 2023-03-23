extends CanvasLayer

func _ready():
	pass

func _on_voltar_pressed(): #volta para a cena principal ao clicar no botão de voltar
	get_tree().change_scene("res://Cenas/Principal.tscn")
