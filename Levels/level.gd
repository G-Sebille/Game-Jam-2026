extends Node2D

@export var life = 3
@export var use_protection : bool = false

@export var art_type : Gm.art = Gm.art.Vase
@export var protection_type = Gm.art.Verre

func _ready() -> void:
	Gm.life = 3
	Gm.use_protection = use_protection
	Gm.current_type = art_type
	Gm.current_protection_type = protection_type
