class_name BattleScene
extends Node2D


@export var music: AudioStreamPlayer
@export var monster : Monster

@onready var Pname_label: Label = $playerRelated/Control/GENERAL/PlayerHUD/Name
@onready var Lvl_label: Label = $playerRelated/Control/GENERAL/PlayerHUD/LVL
@onready var HPTITTLE: Label = $playerRelated/Control/GENERAL/PlayerHUD/HPTTITLE
@onready var HPBAR: ProgressBar =  $playerRelated/Control/GENERAL/PlayerHUD/HPBAR
@onready var HPTEXT: Label = $playerRelated/Control/GENERAL/PlayerHUD/HPTEXT2
@onready var dialogue: Label = $playerRelated/Control/panel/label
func _ready() -> void:
	music.play()
	music.autoplay = true
	
	setup_ui()
	if monster.monsterData:
		dialogue.text = monster.monsterData.first_message
	
func setup_ui() -> void:
	Pname_label.text = Playerdata.Player_Name
	Lvl_label.text = "LV " + str(Playerdata.Love)
	HPBAR.max_value = Playerdata.PHpMax
	HPBAR.value = Playerdata.PHp
	
	HPTEXT.text = str(Playerdata.PHp) + " / " + str(Playerdata.PHpMax) 
	
