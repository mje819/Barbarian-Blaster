extends Path3D

@onready var timer: Timer = $Timer

@export var enemy_scene : PackedScene

func spawn_enemy() -> void:
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	
func _on_timer_timeout() -> void:
	spawn_enemy()
