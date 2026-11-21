extends CPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Gm.next_level.connect(play_the_thing)


func play_the_thing() :
	emitting = true
