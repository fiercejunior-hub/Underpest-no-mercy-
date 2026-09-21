extends Area2D

@export var batalla: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player1"):
		print("doortime")
		get_tree().change_scene_to_packed(batalla)
