extends Node2D

@export var swipe_end_above_y : Marker2D

var pos_start : Vector2
var swapping : bool = false

signal swap_effected(Vector2)

func _input(event):
	if event is InputEventMouseButton:
		event = event as InputEventMouseButton
		if event.button_index == MOUSE_BUTTON_LEFT:
			if !event.pressed :
				if event.position.y > swipe_end_above_y.position.y :
					swap_effected.emit(event.position - pos_start)
					print("SwapFinished")
				else :
					swapping = false
					print("SwapCanceled")

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		event = event as InputEventMouseButton
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed :
				pos_start = event.position
				swapping = true
				print("SwapStarted")
