extends Node3D
class_name Base

@onready var label_3d: Label3D = $Label3D
@export var max_health := 5
var health : int :
	set(new_health):
		health = new_health
		label_3d.text = str(new_health) + "/" + str(max_health)
		var red : Color = Color.RED
		var white : Color = Color.WHITE
		
		label_3d.modulate = red.lerp(white, float(health)/max_health)
		
		if health == 0:
			await get_tree().create_timer(1).timeout
			print("you lost")
			#get_tree().reload_current_scene()

func _ready() -> void:
	#Engine.time_scale = 5
	health = max_health
	#label_3d.modulate = Color.WHITE

func take_damage() -> void:
	health -= 1
	
