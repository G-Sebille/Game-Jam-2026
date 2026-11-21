extends Control

@export var slide_duration: float = 0.75

@export var Click_Menu: AudioStreamPlayer

@onready var main_page: Control = $UI/Main
@onready var settings_page: Control = $UI/Settings

@onready var volume_slider: HSlider = $UI/Settings/MarginContainer/VBoxContainer/VolumeContainer/VolumeSlider
@onready var volume_label: Label = $UI/Settings/MarginContainer/VBoxContainer/VolumeContainer/VolumeLabel

var _tween: Tween
var _busy := false

signal play

static var saved_volume: float = 50.0

func _ready() -> void:
	main_page.visible = true
	main_page.position.x = 0.0
	settings_page.visible = false
	
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	
	volume_slider.set_value_no_signal(saved_volume)
	_apply_volume(saved_volume)

func _on_settings_button_pressed() -> void:
	_slide(main_page, settings_page, 1)
	Click_Menu.play()

func _on_back_button_pressed() -> void:
	_slide(settings_page, main_page, -1)
	Click_Menu.play()

func _slide(from_page: Control, to_page: Control, dir: int) -> void:
	if _busy:
		return
	_busy = true
	
	var w := size.x
	to_page.position.x = w * dir
	to_page.visible = true
	
	# tweens my beloved
	_tween = create_tween().set_parallel(true)
	_tween.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_tween.tween_property(from_page, "position:x", -w * dir, slide_duration)
	_tween.tween_property(to_page, "position:x", 0.0, slide_duration)
	_tween.chain().tween_callback(_on_slide_finished.bind(from_page))

func _on_slide_finished(from_page: Control) -> void:
	from_page.visible = false
	_busy = false

func _on_fullscreen_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		Click_Menu.play()
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		Click_Menu.play()

# je n'ai aucune idée de si cette partie marche mais az
func _on_volume_slider_value_changed(value: float) -> void:
	saved_volume = value
	_apply_volume(value)
	Click_Menu.play()

func _apply_volume(value: float) -> void:
	volume_label.text = "Volume : %d" % int(value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value / 100.0))


func _on_play_button_pressed() -> void:
	play.emit()
	queue_free()
