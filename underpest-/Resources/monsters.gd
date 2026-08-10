class_name Datos_monstruo
extends Resource


#data
@export var Mname: String = ""
@export var Health: int = 10
@export var MaxHealth: int = 10
@export var Dmg: int = 2
@export var Defense: int = 1

#reward
@export var Quantity_gold: int = 0
@export var Quiantity_xp: int = 0


#misc
@export var posible_message: Array[String] = []
@export var first_message: String = ""
@export var can_mercy: bool = false
