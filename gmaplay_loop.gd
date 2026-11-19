extends Node2D

@export var anim : AnimationPlayer

func _ready() -> void:
	pass 

func _process(_delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	anim.play("trowing")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print("Collision !!!!")
