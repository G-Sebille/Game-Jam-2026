extends Node2D
@export var button : Button
@export var LevelList : Array[PackedScene]

var CurrentLevel = 0

func _ready() -> void:
	Gm.next_level.connect(nextLevel)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		nextLevel()

func nextLevel():
	get_child(0).queue_free()
	var scene = LevelList[CurrentLevel].instantiate()
	self.add_child(scene)
	CurrentLevel += 1
