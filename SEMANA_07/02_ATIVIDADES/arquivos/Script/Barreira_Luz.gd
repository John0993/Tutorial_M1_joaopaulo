extends Area2D

var velocity = Vector2.ZERO #define a velocidade como um vetor
var speed = Global.speed_barreira #pega a velocidade a partir do script Global

func _ready():
	pass 

func _physics_process(delta): #movimenta a barreira no eixo vertical para baixo
	velocity.y = 1
	velocity.x = 0 
	velocity = velocity * speed
	position += velocity

func _on_VisibilityNotifier2D_screen_exited(): #exclui a barreira ao sair da tela
	queue_free()

