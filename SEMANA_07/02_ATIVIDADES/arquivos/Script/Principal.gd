extends Node2D

export (PackedScene) var Barreira #cria uma variável que carrega a cena da barreira

func _ready(): #esconde elementos do HUD ao iniciar o jogo
	$Luz.hide()
	$HUD/recorde.hide()

func iniciar_jogo(): #função que inicia o jogo ao clicar no botão de iniciar
	$Luz.show()
	$aumentarSpeed.start()
	$spawnBarreira.set_wait_time(2)
	$HUD/recorde.show()
	
func game_over(): #função chamada ao colidir com uma barreira. Esconde os elementos da HUD e zera a velocidade da luz
	$Luz.current_state = $Luz.State.Morto
	$spawnBarreira.stop()
	$Luz.hide()
	$Luz.position = Vector2(512, 544)
	$HUD.mensagem("Game Over!")
	$HUD/reiniciar.show()
	Global.speed_barreira = 8 
	Global.recorde += [$HUD.score]
	$HUD/recorde.text = "Recorde: %d" % [Global.recorde.max()]
	
func _on_spawnBarreira_timeout(): #cria uma barreira periodicamente, toda vez que o timer spawnBarreira termina de rodar
	var barreira = Barreira.instance()
	add_child(barreira)
	
func _on_aumentarSpeed_timeout(): #aumenta a velocidade da barreira durante o jogo, até atingir um limite
	if Global.speed_barreira < 14:
		Global.speed_barreira += 0.5

func _on_HUD_start_game(): #inicia o código do jogo ao clicar no botão de iniciar
	$Luz.current_state = $Luz.State.Onda
	$HUD.mensagem("Prepare-se!")
	$Luz.show()
	$iniciar.start()
	$spawnBarreira.start()
	$HUD/reiniciar.hide()
	$dificultar.start()

func _on_iniciar_timeout(): #inicia o jogo após acabar o timer iniciar
	iniciar_jogo()
	$HUD/mensagem.hide()

func _on_dificultar_timeout(): #aumenta a velocidade de spawn da barreira de acordo com o avanço do jogo
	if $spawnBarreira.get_wait_time() > 1:
		$spawnBarreira.set_wait_time($spawnBarreira.get_wait_time() - 0.1)

func _on_Luz_area_entered(area): #verifica a barreira que a luz colidiu e, se for diferente do seu tipo, chama a função game_over e finaliza o jogo
	match area.name:
		"Barreira_Luz":
			if $Luz.current_state == $Luz.State.Onda:
				pass
			elif $Luz.current_state == $Luz.State.Particula:
				game_over()
		"Barreira_Particula":
			if $Luz.current_state == $Luz.State.Onda:
				game_over()
			elif $Luz.current_state == $Luz.State.Particula:
				pass
		"Morte":
			game_over()
		"Pontuacao":
			$HUD.atualiza_score()
