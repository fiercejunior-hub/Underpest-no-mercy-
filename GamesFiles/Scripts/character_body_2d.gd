extends CharacterBody2D

@export var speed: float = 300.0
@export var Runspeed: float = 500.0
@export var chance_appear_monster: int = 1

var is_running: bool = false
var last_direction: String = "down"
@onready var animacion: AnimatedSprite2D = $AnimatedSprite2D

var is_in_zone: bool = false
var current_zone: Area2D = null
var step_timer: float = 0.0
@export var step_interval: float = 0.4


func _physics_process(delta: float) -> void:
	# 1. Obtener la dirección del vector de entrada
	var input_direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_direction == Vector2.ZERO:
		var custom_x = Input.get_axis("izquierda", "derecha")
		var custom_y = Input.get_axis("arriba", "abajo")
		input_direction = Vector2(custom_x, custom_y).normalized()

	# 2. Control del sistema de correr
	if Input.is_action_pressed("correr") and input_direction != Vector2.ZERO:
		is_running = true
	else:
		is_running = false

	# 3. Asignar velocidad según si está corriendo o caminando
	var current_speed = Runspeed if is_running else speed
	velocity = input_direction * current_speed

	# 4. Control de Animaciones e Histórico de Dirección
	_update_animations(input_direction)

	# 5. Mover al personaje y chequear encuentros solo si camina
	move_and_slide()

	if input_direction != Vector2.ZERO:
		_check_encounter(delta)
	else:
		step_timer = 0.0


# AQUÍ VA LA FUNCIÓN DE ANIMACIONES CORREGIDA
func _update_animations(input_direction: Vector2) -> void:
	if input_direction != Vector2.ZERO:
		# Determinar dirección dominante
		if abs(input_direction.x) > abs(input_direction.y):
			if input_direction.x > 0:
				last_direction = "right"
				animacion.flip_h = true
			else:
				last_direction = "left"
				animacion.flip_h = false
			
			# Seleccionar la animación lateral
			_play_anim("correr" if is_running else "CAMINAR")
		else:
			if input_direction.y > 0:
				last_direction = "down"
				_play_anim("CAMINAR ABAJO")
			else:
				last_direction = "up"
				_play_anim("CAMINAR ARRIBA")
	else:
		# IDLE según la última dirección
		match last_direction:
			"right":
				animacion.flip_h = true
				_play_anim("IDLE")
			"left":
				animacion.flip_h = false
				_play_anim("IDLE")
			"down":
				_play_anim("IDLE ABAJO")
			"up":
				_play_anim("IDLE ARRIBA")


# Función para no reiniciar la animación en cada frame si ya se está reproduciendo
func _play_anim(nombre_anim: String) -> void:
	if animacion.animation != nombre_anim:
		animacion.play(nombre_anim)


func set_in_encounter_zone(in_zone: bool, area: Area2D) -> void:
	is_in_zone = in_zone
	current_zone = area
	step_timer = 0.0


func _check_encounter(delta: float) -> void:
	if not is_in_zone or current_zone == null:
		return

	step_timer += delta
	if step_timer >= step_interval:
		step_timer = 0.0  # Reinicio correcto del timer

		if randf() < current_zone.encounter_chance:
			print("encontrado")
			velocity = Vector2.ZERO
			is_in_zone = false
			current_zone.start_battle()
	
