extends Node2D
class_name WeaponSelector

#var tableau = [peinture, couteau]
#var cadre = [Hache, Alumette, peinture]
#var ceramique = [Marteau, peinture, alumette] 
var statue = [ ]

signal weapon_changed(new_weapon : WeaponResource)

@export var WEAPON_LEFT: AudioStreamPlayer
@export var WEAPON_RIGHT: AudioStreamPlayer

@export var weapon_array : Array[WeaponResource] =[]
@export var label : Label
@export var button_R : TextureButton
@export var button_L : TextureButton
@export var center_Sprite : Sprite2D
@export var splash_Ball : Sprite2D
@export var pickaxe : Sprite2D
@export var fire_stick : Sprite2D

var sprite_tab : Array[Sprite2D] = []
@export var current_weapon : WeaponResource
var current_index : int =0
var is_swipping_right : bool = false


func _ready() -> void:
	#create_weapon()
	pass

func create_weapon() -> void:
	for weapon : WeaponResource in weapon_array:
		var new_sprite = Sprite2D.new()
		self.add_child(new_sprite)
		new_sprite.texture = weapon.texture
		label.text = weapon.name
		current_weapon = weapon_array[current_index+1]
		sprite_tab.append(new_sprite)
		
	current_index = int(weapon_array.size()/2)

func select_weapon(is_swiping_right) -> WeaponResource:
	if is_swiping_right == true:
		current_index = (current_index+1)%weapon_array.size()
	else:
		current_index = (current_index-1)%weapon_array.size()

	Gm.current_index = current_index
	Gm.current_weapon = weapon_array[current_index].type
	self.current_weapon = weapon_array[current_index]
	weapon_changed.emit(current_weapon)
	return weapon_array[current_index]
	
	
func update_img() -> void:
	fire_stick.texture = weapon_array[(current_index+3)%weapon_array.size()].texture
	pickaxe.texture = weapon_array[(current_index+2)%weapon_array.size()].texture
	button_R.texture_normal = weapon_array[(current_index+1)%weapon_array.size()].texture
	center_Sprite.texture = weapon_array[current_index].texture
	button_L.texture_normal = weapon_array[(current_index-1)%weapon_array.size()].texture
	splash_Ball.texture = weapon_array[(current_index-2)%weapon_array.size()].texture

func _on_button_right_pressed() -> void:
	WEAPON_RIGHT.play()
	select_weapon(true)
	update_img()

func _on_button_left_pressed() -> void:
	WEAPON_LEFT.play()
	select_weapon(false)
	update_img()
