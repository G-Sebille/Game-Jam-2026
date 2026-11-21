extends AudioStreamPlayer

func _ready() -> void:
	Gm.next_level.connect(activate)

func activate():
	play()
