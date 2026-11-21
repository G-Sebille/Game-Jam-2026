extends Node

enum arme{Marteau, Couteau, Allumette, Hache, Pioche, Peinture}

enum art{Peinture, Statue, Vase, Verre}

var current_index = 0

var current_weapon : arme

signal next_level

# Alwais use protections guys
var use_protection : bool = false

var current_type : art

var current_protection_type : art

var life : int = 3

signal impact

func loose_life() :
	life -= 1
	impact.emit()
	if life <= 0 :
		if use_protection :
			use_protection = false
			life = 3
		else :
			next_level.emit()

func get_type() -> art :
	if use_protection :
		return current_protection_type
	else :
		return current_type
