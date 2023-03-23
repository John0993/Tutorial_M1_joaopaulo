extends Area2D

#máquina de estado referente ao estado da luz
enum State {
	Onda
	Particula
	Morto
} 

var screen_size
var current_state = State.Onda
var speed = 750
var controle = true
var n = 0 
var control_state = true

signal game_over

func _ready():
	position = Vector2(512, 558) #ao iniciar, define posição no centro inferior da tela
	screen_size = get_viewport_rect().size #define o tamanho da tela
	
func _physics_process(delta):
	var velocity = Vector2.ZERO 
	
	if controle: #muda o estado da luz ao apertar o botão de espaço
		if Input.is_action_just_pressed("ui_accept"):
			if control_state:
				current_state = State.Particula
				control_state = false
			else:
				current_state = State.Onda
				control_state = true 
			
		#define a movimentação da luz
		if Input.is_action_pressed("ui_right"):
			velocity.x += 1 
		if Input.is_action_pressed("ui_left"):
			velocity.x -= 1
		if Input.is_action_pressed("ui_up"):
			velocity.y -= 1 
		if Input.is_action_pressed("ui_down"):
			velocity.y += 1
	
	#normaliza a velocidade e atualiza a posição ao se mover
	velocity = velocity.normalized() * speed 
	position += velocity * delta 
	#define o tamanho da tela, para que a luz não possa ultrapassá-lo
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	match current_state: #muda as animações e tamanho da luz de acordo com o seu estado atual
		State.Onda: 
			$Animacao.animation = 'Onda'
			$Animacao.scale = Vector2(0.15,0.15)
			controle = true
		State.Particula:
			$Animacao.animation = 'Particula'
			$Animacao.scale = Vector2(0.09,0.09)
			controle = true
		State.Morto:
			controle = false
			var current_state = State.Onda
			
