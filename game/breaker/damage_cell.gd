extends Node2D
class_name DamageCell

@export var texture : Texture2D
@export var cell_size : Vector2 = Vector2.ZERO
@export var top_position : Vector2 = Vector2(0,0)

@export var collision_shape : CollisionShape2D
@export var rigid_body : RigidBody2D
@export var sprite_2d : Sprite2D

func create(top_pos : Vector2, size : Vector2, offset : Vector2) -> void:
	self.top_position = top_pos
	self.cell_size = size
	self.position = top_position + (cell_size/2)
	sprite_2d.texture = texture
	sprite_2d.region_rect = Rect2(offset,cell_size)
	var new_rect : RectangleShape2D = RectangleShape2D.new()
	new_rect.size = cell_size
	rigid_body.sleeping = true
	collision_shape.shape = new_rect
