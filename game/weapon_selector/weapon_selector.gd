extends Node2D

@export var weapon_array : Array[WeaponResource] =[]

@export var label : Label

var current_weapon : WeaponRessource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_weapon() -> void:
	for weapon : WeaponResource in weapon_array:
		var new_sprite = Sprite2D.new()
		self.add_child(new_sprite)
		new_sprite.texture = weapon.texture
		label.text = weapon.name
