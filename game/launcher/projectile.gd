extends Area2D
class_name Projectile

@export var animation_player : AnimationPlayer
@export var sprite_2d : Sprite2D

@warning_ignore("unused_signal")
signal contact(oeuvre_type : Gm.art, pos : Vector2)

@export var weapon_selector : WeaponSelector

@export var current_texture : Texture2D = null

var can_damage : bool = true

func update_texture(new_tex : Texture2D) -> void:
	sprite_2d.texture = new_tex
	current_texture = new_tex

func _ready() -> void: 
	weapon_selector.weapon_changed.connect(on_weapon_change)
	sprite_2d.texture = current_texture

func on_weapon_change(new_weapon : WeaponResource) -> void:
	update_texture(new_weapon.texture)

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	if can_damage :
		print(global_position)
		# C'est temporaire avant que tu merge ton code
		contact.emit(global_position)
		
		print("testkjbdvbeiuzb")
		Gm.loose_life()
		
		for area : Area2D in self.get_overlapping_areas():
			area.area_entered.emit(self)
		self.monitorable = true
		for body in get_overlapping_bodies():
			if body is DamageCell:
				body.can_move = true
				body.sleeping = false
				var dir : Vector2 = body.position - self.position
				dir.x *=0.5
				dir.y *= -1
				body.z_index += 1
				print(dir)
				var force : float = randf_range(2,5)
				body.apply_impulse(dir * force,self.position)
		
		animation_player.play(&"RESET")
		can_damage = false

func launch(target_position : Vector2) -> void:
	print("test")
	animation_player.play(&"launch")
	
	var anim : Animation = animation_player.get_animation("launch")
	var track_idx : int = anim.find_track("Projectile:position:x",Animation.TYPE_BEZIER)
	
	var new_value : Array = anim.track_get_key_value(track_idx,2)
	
	new_value[0] = target_position.x;
	print(new_value)
	
	anim.track_set_key_value(track_idx,2,new_value)
	
	track_idx = anim.find_track("Projectile:position:y",Animation.TYPE_BEZIER)
	
	print(anim.track_get_key_value(track_idx,2))
	new_value[0] = target_position.y;
	
	anim.track_set_key_value(anim.find_track("Projectile:position:y",Animation.TYPE_BEZIER),2,new_value)
