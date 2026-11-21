extends Node

enum arme{Marteau, Couteau, Allumette, Hache, Pioche, Peinture}

enum art{Peinture, Statue, Vase, Verre}

var current_index = 0

signal next_level

# Alwais use protections guys
var use_protection : bool = false

var current_type : art

var current_protection_type : art

var life : int = 3

func loose_life() :
	life -= 1
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
