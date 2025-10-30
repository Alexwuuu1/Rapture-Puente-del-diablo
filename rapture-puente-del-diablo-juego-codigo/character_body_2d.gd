extends CharacterBody2D

@export var speed := 100.0
@onready var anim = $AnimatedSprite2D

func _physics_process(_delta):
	var input_vector = Vector2.ZERO

	# Detectar movimiento con WASD y flechas
	if Input.is_key_pressed(KEY_W) or Input.is_action_pressed("ui_up"):
		input_vector.y -= 1
	if Input.is_key_pressed(KEY_S) or Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_key_pressed(KEY_D) or Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	if Input.is_key_pressed(KEY_A) or Input.is_action_pressed("ui_left"):
		input_vector.x -= 1

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
				anim.play("izq")
		else:
			if input_vector.y > 0:
				anim.play("abajo")
			else:
				anim.play("arriba")
	else:
		# Animación idle según la última dirección
		if anim.animation == "der" or anim.animation == "der_idle":
			anim.play("der_idle")
		elif anim.animation == "izq" or anim.animation == "izq_idle":
			anim.play("izq_idle")
		elif anim.animation == "abajo" or anim.animation == "abajo_idle":
			anim.play("abajo_idle")
		elif anim.animation == "arriba" or anim.animation == "arriba_idle":
			anim.play("arriba_idle")
		else:
			anim.play("abajo_idle")  # default
