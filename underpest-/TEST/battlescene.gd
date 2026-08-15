class_name BattleScene
extends Node2D


@export var music: AudioStreamPlayer2D

@export var monster_data: Monster_data

@onready var Pname_label: Label = $Control/GENERAL/PlayerHUD/Name
@onready var Lvl_label: Label = $Control/GENERAL/PlayerHUD/LVL
@onready var HPTITTLE: Label = $Control/GENERAL/PlayerHUD/HPTTITLE
@onready var HPBAR: ProgressBar =  $Control/GENERAL/PlayerHUD/HPBAR
@onready var HPTEXT: Label = $Control/GENERAL/PlayerHUD/HPTEXT2
@onready var dialogue: Label = $Control/Sprite2D/Label
func _ready() -> void:
	music.play()
	music.autoplay = true
	
	setup_ui()
	if monster_data:
		dialogue.text = monster_data.first_message
	
func setup_ui() -> void:
	Pname_label.text = Playerdata.Player_Name
	Lvl_label.text = "LV " + str(Playerdata.Love)
	HPBAR.max_value = Playerdata.PHpMax
	HPBAR.value = Playerdata.PHp
	
	HPTEXT.text = str(Playerdata.PHp) + " / " + str(Playerdata.PHpMax) 
	
