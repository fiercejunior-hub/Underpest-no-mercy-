extends Node2D
@onready var heartBox = $heartBox
@onready var player = $player
var gotoSize : Vector2
var gotoPos : Vector2

func _ready() -> void:
	gotoSize = heartBox.size
	gotoPos = heartBox.position
	_setupBox()
func _process(delta: float) -> void:
	pass

# vv found out godot has an animation editor right after finishing ts
func _setupBox() -> void:
	var t = 0
	var animFinish = 0.2
	
	var initSize = Vector2(636,182)
	var initPos = Vector2(-318,-70)
	
	# start
	visible = true
	player.visible = false
	
	while(t < 1):
		heartBox.size = initSize.lerp(gotoSize, t)
		heartBox.position = initPos.lerp(gotoPos, t)
		t += get_process_delta_time()/animFinish
		await get_tree().process_frame
		
	heartBox.size = gotoSize
	heartBox.position = gotoPos
		
	player.visible = true
