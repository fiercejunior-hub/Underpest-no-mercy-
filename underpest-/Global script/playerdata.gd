extends Node

var Player_Name: String = ""
@export var Love: int = 1
@export var exp_actual: int = 0
@export var xp_next_level: int = 10
@export var PHpMax: int = 10
@export var PHp: int = 10
@export var Damage: int = 2
@export var Defense: int = 1


func GainXp(amount: int):
	exp_actual += amount
	
	while exp_actual >= xp_next_level:
		Lvlup()

func Lvlup():
	Love += 1
	PHpMax += 4
	PHp = PHpMax
	exp_actual -= xp_next_level
	xp_next_level *= 2
