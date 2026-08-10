extends Area2D

@export var batalla: PackedScene
@export var Sound: AudioStreamPlayer2D
@export_range(0.0, 1.0) var encounter_chance: float = 0.15

func _ready() -> void:
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)
	if not body_exited.is_connected(_on_body_exited):
		body_exited.connect(_on_body_exited)



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player1"):
		body.set_in_encounter_zone(true, self)
		print("you entered")


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player1"):
		body.set_in_encounter_zone(false, null)
		print("you exited")
		

func start_battle():
	if batalla:
		Sound.play()
		await get_tree().create_timer(0.8).timeout
		get_tree().change_scene_to_packed(batalla)
	else:
		print("error")
