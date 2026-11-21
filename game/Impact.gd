extends Node

@export var AXE_CANVAS: AudioStreamPlayer
@export var AXE_CERAMIC: AudioStreamPlayer
@export var AXE_GLASS: AudioStreamPlayer
@export var AXE_STONE: AudioStreamPlayer
@export var AXE_WOOD1: AudioStreamPlayer
@export var AXE_WOOD2: AudioStreamPlayer
@export var AXE_WOOD3: AudioStreamPlayer

@export var KNIFE_WOOD: AudioStreamPlayer
@export var KNIFE_CERAMIC: AudioStreamPlayer
@export var KNIFE_GLASS: AudioStreamPlayer
@export var KNIFE_STONE: AudioStreamPlayer
@export var KNIFE_CANVAS1: AudioStreamPlayer
@export var KNIFE_CANVAS2: AudioStreamPlayer
@export var KNIFE_CANVAS3: AudioStreamPlayer

@export var PICKAXE_CANVAS: AudioStreamPlayer
@export var PICKAXE_CERAMIC: AudioStreamPlayer
@export var PICKAXE_GLASS: AudioStreamPlayer
@export var PICKAXE_WOOD: AudioStreamPlayer
@export var PICKAXE_STONE1: AudioStreamPlayer
@export var PICKAXE_STONE2: AudioStreamPlayer
@export var PICKAXE_STONE3: AudioStreamPlayer

@export var THIS_FIIIIRE_IS_OUT_OF_CONTROL: AudioStreamPlayer

@export var Paint1: AudioStreamPlayer
@export var Paint2: AudioStreamPlayer
@export var Paint3: AudioStreamPlayer

@export var HAMMER_CANVAS: AudioStreamPlayer
@export var HAMMER_CERAMIC1: AudioStreamPlayer
@export var HAMMER_CERAMIC2: AudioStreamPlayer
@export var HAMMER_CERAMIC3: AudioStreamPlayer
@export var HAMMER_GLASS1: AudioStreamPlayer
@export var HAMMER_GLASS2: AudioStreamPlayer
@export var HAMMER_GLASS3: AudioStreamPlayer
@export var HAMMER_STONE: AudioStreamPlayer
@export var HAMMER_WOOD: AudioStreamPlayer

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
					#if Gm.life = 3 : 
					#	son
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
