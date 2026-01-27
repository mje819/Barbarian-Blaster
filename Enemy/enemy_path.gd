extends Path3D

@onready var timer: Timer = $Timer

@export var enemy_scene : PackedScene
@export var difficulty_manager : Node
func spawn_enemy() -> void:
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	timer.wait_time = difficulty_manager.get_spawn_time()
	enemy.max_health = difficulty_manager.get_enemy_health()
	print(enemy.max_health)
	
func _on_timer_timeout() -> void:
	spawn_enemy()
