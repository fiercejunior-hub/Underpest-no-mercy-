extends CharacterBody2D

@onready var box : NinePatchRect = $"../heartBox"
const marginUp = Vector2(24,24)
const marginDown = -Vector2(28,28)
const SPEED = 300.0


func _physics_process(delta: float) -> void:
	if (!visible): return
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("izquierda","derecha","arriba","abajo")
	if direction:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	move_and_slide()
	position = position.clamp(marginUp - box.size/2, marginDown + box.size/2)
