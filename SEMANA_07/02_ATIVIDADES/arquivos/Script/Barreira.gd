extends Node2D

var current_state #estado atual da barreira

#máquina de estado para definir as propriedades do estado atual da barreira
enum State {
	Barreira_Particula 
	Barreira_Onda 
}

func _ready():
	current_state = randi() % len(State) #aleatoriza qual barreira será gerada
	if current_state == 0: #Cria a barreira da partícula, e exclui a da onda
		current_state = State.Barreira_Particula
	else: #Cria a barreira da onda, e exclui a da partícula
		current_state = State.Barreira_Onda
		
	match current_state: #ao carregar uma das barreiras, exclui a outra, para que as duas não sejam instanciadas simultaneamente
		State.Barreira_Particula: 
			$Barreira_Luz.queue_free()
			
		State.Barreira_Onda:
			$Barreira_Particula.queue_free()

func _on_Barreira_Particula_area_entered(area): #deleta o CollisionShape da barreira da partícula ao entrar em contato com ela. Assim, o jogador não pode receber mais de um ponto ao passar pela barreira
	match current_state:
		State.Barreira_Particula:
			$Barreira_Particula/hitBox.queue_free()
		State.Barreira_Onda:
			pass

func _on_Barreira_Luz_area_entered(area): #deleta o CollisionShape da barreira da luz ao entrar em contato com ela. Assim, o jogador não pode receber mais de um ponto ao passar pela barreira
	match current_state:
		State.Barreira_Particula:
			pass
		State.Barreira_Onda:
			$Barreira_Luz/hitBox.queue_free()
