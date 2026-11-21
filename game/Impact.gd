extends Node

@export var fire : CPUParticles2D
@export var glass : CPUParticles2D
@export var victory : CPUParticles2D
@export var canvas : CPUParticles2D
@export var rock : CPUParticles2D
@export var porcelain : CPUParticles2D

var current_weapon : Gm.arme

func IMPACT(pos : Vector2) -> bool:
	current_weapon = Gm.current_weapon
	var oeuvre_type = Gm.get_type()
	print(current_weapon)
	print("Start")
	match oeuvre_type :
		Gm.art.Peinture :
			match current_weapon :
				Gm.arme.Marteau :
					spawn_paticules(Gm.art.Peinture, pos)
					return false
				Gm.arme.Couteau :
					spawn_paticules(Gm.art.Peinture, pos)
					return true
				Gm.arme.Allumette :
					spawn_paticules(Gm.art.Peinture, pos)
					return true
				Gm.arme.Hache :
					spawn_paticules(Gm.art.Peinture, pos)
					return false
				Gm.arme.Pioche :
					spawn_paticules(Gm.art.Peinture, pos)
					return false
				Gm.arme.Peinture :
					spawn_paticules(Gm.art.Peinture, pos)
					return true
					
		Gm.art.Statue :
			print("Statue")
			match current_weapon :
				Gm.arme.Marteau :
					print("Statue")
					spawn_paticules(Gm.art.Statue, pos)
					return false
				Gm.arme.Couteau :
					spawn_paticules(Gm.art.Statue, pos)
					return true
				Gm.arme.Allumette :
					spawn_paticules(Gm.art.Statue, pos)
					return true
				Gm.arme.Hache :
					spawn_paticules(Gm.art.Statue, pos)
					return false
				Gm.arme.Pioche :
					spawn_paticules(Gm.art.Statue, pos)
					return false
				Gm.arme.Peinture :
					spawn_paticules(Gm.art.Statue, pos)
					return true
					
		Gm.art.Vase :
			match current_weapon :
				Gm.arme.Marteau :
					spawn_paticules(Gm.art.Vase,pos)
					return false
				Gm.arme.Couteau :
					spawn_paticules(Gm.art.Vase,pos)
					return true
				Gm.arme.Allumette :
					spawn_paticules(Gm.art.Vase,pos)
					return true
				Gm.arme.Hache :
					spawn_paticules(Gm.art.Vase,pos)
					return false
				Gm.arme.Pioche :
					spawn_paticules(Gm.art.Vase,pos)
					return false
				Gm.arme.Peinture :
					spawn_paticules(Gm.art.Vase,pos)
					return true
					
		Gm.art.Verre :
			match current_weapon :
				Gm.arme.Marteau :
					spawn_paticules(Gm.art.Verre,pos)
					return false
				Gm.arme.Couteau :
					spawn_paticules(Gm.art.Verre,pos)
					return true
				Gm.arme.Allumette :
					spawn_paticules(Gm.art.Verre,pos)
					return true
				Gm.arme.Hache :
					spawn_paticules(Gm.art.Verre,pos)
					return false
				Gm.arme.Pioche :
					spawn_paticules(Gm.art.Verre,pos)
					return false
				Gm.arme.Peinture :
					spawn_paticules(Gm.art.Verre,pos)
					return true
					
	return false
	

func spawn_paticules(oeuvre_type : Gm.art, pos : Vector2) -> void:
	match oeuvre_type: 
		Gm.art.Peinture:
			match current_weapon : 
				Gm.arme.Allumette:
					fire.global_position = pos
					fire.emitting = true
					print("Fire")
				_ :
					pass
		Gm.art.Statue:
			match current_weapon:
				Gm.arme.Allumette:
					fire.global_position = pos
					fire.emitting = true
					print("Fire")
				_ : 
					rock.global_position = pos
					rock.emitting = true
					print("Rock")
		Gm.art.Vase:
			match current_weapon:
				Gm.arme.Allumette:	
					fire.global_position = pos
					fire.emitting = true
					print("Fire")
				_ : 
					porcelain.global_position = pos
					porcelain.emitting = true
					print("Porc")
		Gm.art.Verre:
			match current_weapon:
				Gm.arme.Allumette:
					fire.global_poistion = pos
					fire.emitting = true
					print("Fire")
				_ : 
					glass.global_position = pos
					glass.emitting = true 
					print("Glass")
