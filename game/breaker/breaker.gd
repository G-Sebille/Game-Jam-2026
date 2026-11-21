extends Node2D
class_name Satue

@export var texture : Texture2D

@export var sprite_division : Vector2i = Vector2(2,2)

@export var cell_parent : Node2D

func create_cells() -> void:
	var offset : Vector2 = texture.get_size() / Vector2(sprite_division)
	var top_position : Vector2 = Vector2.ZERO - texture.get_size()/2
	
	var cell_scene : PackedScene = load("res://game/breaker/damage_cell.tscn")

	
	for y in sprite_division.y :
		for x in sprite_division.x:
			
			var new_cell : DamageCell = cell_scene.instantiate()
			new_cell.name = str(x) + " " + str(y)
			cell_parent.add_child(new_cell)
			new_cell.texture = texture
			new_cell.create(top_position + offset*Vector2(x,y)*1.01, offset, offset*Vector2(x,y), global_scale)
			
			new_cell.visible = true
			new_cell.owner = $CellParent
			


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_cells()
