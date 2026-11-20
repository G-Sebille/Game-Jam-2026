extends Node2D
@export var button : Button
@export var LevelList : Array[PackedScene]

var CurrentLevel = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		nextLevel()

func nextLevel():
	get_child(0).queue_free()
	var scene = LevelList[CurrentLevel].instantiate()
	self.add_child(scene)
	CurrentLevel += 1

func _on_button_pressed() -> void:
	nextLevel()
