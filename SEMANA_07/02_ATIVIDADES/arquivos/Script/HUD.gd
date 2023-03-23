extends CanvasLayer

var score = 0 #pontuação do jogador

signal start_game
signal reiniciar

func _ready(): #esconde o botão de reiniciar ao começar o jogo
	$reiniciar.hide()

func mensagem(texto): #função que atualiza o texto da label $mensagem
	$mensagem.show()
	$mensagem.text = texto	

func _on_iniciar_pressed(): #emite o sinal para começar o jogo na cena principal
	$iniciar.hide()
	emit_signal("start_game")

func atualiza_score(): #atualiza o texto da pontuação
	score += 1 
	$score.text = str(score)

func _on_reiniciar_pressed(): #zera a pontuação ao reiniciar e emite um sinal para começar novamente pra cena principal
	score = 0
	$score.text = str(score)
	emit_signal("start_game")
	
