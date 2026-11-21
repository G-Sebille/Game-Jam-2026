extends AudioStreamPlayer

func _ready() -> void:
	Gm.impact.connect(activate)
	Gm.next_level.connect(shut)

func shut():
	volume_db = -80

func activate():
	volume_db = 0
