extends Node2D
class_name LevelManager

@export var button : Button
@export var LevelList : Array[PackedScene]

@export var Click_Menu: AudioStreamPlayer

var CurrentLevel = 0

func _ready() -> void:
	Gm.next_level.connect(nextLevel)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		nextLevel()

func nextLevel():
	for i in get_children():
		i.queue_free()
	Click_Menu.play()
	var scene = LevelList[CurrentLevel].instantiate()
	self.add_child(scene)
	CurrentLevel += 1
