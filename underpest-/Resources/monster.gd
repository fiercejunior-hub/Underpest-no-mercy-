extends Node2D
class_name Monster

@export var monsterData : Monster_data
@onready var dmgOutput : Label = $remoteChildren/dmgOutput
@onready var healthBar : ProgressBar = $remoteChildren/healthBar

func _ready() -> void:
	# basically lets the ui element outside of the enemy
	# this prevents the monster stats to move alongside them 
	var parent = get_tree().root
	var remoteChildren = $remoteChildren
	
	remove_child(remoteChildren)
	parent.add_child.call_deferred(remoteChildren)
	remoteChildren.position = position
	
	print(remoteChildren.get_parent())
	
	# this sets up the health bar
	healthBar.max_value = monsterData.MaxHealth

@onready var slash : AnimatedSprite2D = $"../slash"
@onready var snd_slash : AudioStreamPlayer = $"../slash/SndSlash"
@onready var snd_damage : AudioStreamPlayer = $"../slash/SndDamageC"

func _takeDamage(damage : int):
	monsterData.Health -= damage
	dmgOutput.text = var_to_str(damage)
	
	var x = position.x
	var magnitude = 12
	var interval = 0.1
	
	#region play slash animation
	slash.visible = true
	slash.play("default")
	snd_slash.play()
	await slash.animation_finished
	slash.visible = false
	#endregion
	#region play damage animation
	snd_damage.play()
	dmgOutput.visible = true
	healthBar.visible = true
	healthBar.value = monsterData.Health
	for i in range(0,4):
		position.x += magnitude
		await get_tree().create_timer(interval).timeout
		position.x = x
		position.x -= magnitude
		await get_tree().create_timer(interval).timeout
		position.x = x
	dmgOutput.visible = false
	healthBar.visible = false
	#endregion
	if (monsterData.Health <= 0):
		_die()
func _die():
	modulate = Color(1,0.8,1,0.4)
	var spriteAnimation : AnimatedSprite2D = $"."
	if spriteAnimation:
		spriteAnimation.stop()
