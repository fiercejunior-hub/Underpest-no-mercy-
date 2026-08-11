extends Control

@onready var corazon: TextureRect = $TextureRect
# Si el Label está dentro de Sprite2D (o Sprite2D1), asegúrate de que la ruta coincida con el árbol
@onready var text: Label = $Sprite2D/Label 
@export var sound: AudioStreamPlayer2D

@onready var target: 

# local variables
var attacking : bool = false

# 1. RUTAS CORREGIDAS (Todos están dentro de GENERAL/OPTIONS)
@onready var buttons: Array[Node] = [
	$GENERAL/OPTIONS/ATACAR,
	$GENERAL/OPTIONS/ACTUAR,
	$GENERAL/OPTIONS/ITEM,
	$GENERAL/OPTIONS/MERCY
]

var text_options: Array[String] = [
	"* You feel weak",
	"* We dont want this",
	"* You food is infected by stranger infection",
	"* You feel strange, you can't do MERCY."
]

var opc: int = 0

# ⚙️ AJUSTE DE POSICIÓN DEL CORAZÓN (Ajusta la X si lo quieres más a la izquierda del botón)
@export var offset_corazon: Vector2 = Vector2(10, 15)

func _ready() -> void:
	# Le da un frame a Godot para calcular las posiciones globales de la UI correctamente
	await get_tree().process_frame
	_update_heart_position()

# changed from _unhandled_input to _process because some input was being ignored - Cemis
# (se lo cambié las cosas de _unhandled_input para _process porque
# algunas veces el input no era registrado - Cemis)

#func _unhandled_input(event: InputEvent) -> void:
	#if event.is_action_pressed("ui_left"):
		#opc -= 1
		#if opc < 0:
			#opc = buttons.size() - 1
		#_update_heart_position()
		#
	#elif event.is_action_pressed("ui_right"):
		#opc += 1
		#if opc >= buttons.size():
			#opc = 0
		#_update_heart_position()
		#
	#elif event.is_action_pressed("interactuar"):
		#interact()
		## 2. PROTECCIÓN DE SONIDO (Evita que el juego se cierre si no hay audio asignado)
		#if sound:
			#sound.play()

func  _process(delta: float) -> void:
	if attacking: return
	# doesn't do anything if already attacking
	if Input.is_action_just_pressed("ui_left"):
		opc -= 1
		if opc < 0:
			opc = buttons.size() - 1
		_update_heart_position()
		
	elif Input.is_action_just_pressed("ui_right"):
		opc += 1
		if opc >= buttons.size():
			opc = 0
		_update_heart_position()
		
	elif Input.is_action_just_pressed("interactuar"):
		interact()
		# 2. PROTECCIÓN DE SONIDO (Evita que el juego se cierre si no hay audio asignado)
		if sound:
			sound.play()

func _update_heart_position() -> void:
	var btn: Control = buttons[opc] as Control
	if btn:
		corazon.global_position = btn.global_position + offset_corazon


func interact() -> void:
	if text and opc = 0:	#attack
		attacking = true
		corazon.visible = false
	if text and opc < text_options.size():
		text.text = text_options[opc]
