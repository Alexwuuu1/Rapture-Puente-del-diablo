extends CharacterBody2D

@export var speed := 100.0
@onready var anim = $AnimatedSprite2D

func _physics_process(delta):
	var input_vector = Vector2.ZERO

	# Detectar movimiento
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector = input_vector.normalized()

	# Mover personaje
	velocity = input_vector * speed
	move_and_slide()

	# Reproducir animación según dirección
	if input_vector != Vector2.ZERO:
		if abs(input_vector.x) > abs(input_vector.y):
			if input_vector.x > 0:
				anim.play("der")
			else:
				anim.play("izq") # ← crea esta animación si aún no la tienes
		else:
			if input_vector.y > 0:
				anim.play("abajo")
			else:
				anim.play("arriba")
	else:
		anim.stop()  # si no se mueve, se detiene la animación
