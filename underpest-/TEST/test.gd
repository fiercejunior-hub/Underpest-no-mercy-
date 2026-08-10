extends Node2D

@export var music: AudioStreamPlayer2D

func _ready() -> void:
	music.play()
	music.playing = true
	music.autoplay = true





func _on_encontrar_area_entered(_area: Area2D) -> void:
	pass # Replace with function body.
