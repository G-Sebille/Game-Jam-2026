extends Node

enum arme{Marteau, Couteau, Allumette, Hache, Pioche, Peinture}

enum art{Peinture, Statue, Vase, Verre}

var current_index = 0

@warning_ignore("unused_signal")
signal next_level

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
