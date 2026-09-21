extends Control

@onready var PName_introduce: LineEdit



func _on_accept_pressed() -> void:
	var Pname = $Name.text.strip_edges().to_upper()	
	if $Name.text.length() >= 7 or Pname == "":
		$error.visible = true
	else:
		$error.visible = false
		Playerdata.Player_Name = Pname
		get_tree().change_scene_to_file("res://TEST/TEST.tscn")


func _on_name_text_submitted(new_text: String) -> void:
	_on_accept_pressed()
