extends Node3D

var projectile = preload("res://Turret/projectile.tscn")
var enemy_path : Path3D

# turn to enemies
func _physics_process(delta: float) -> void:
	var enemy = enemy_path.get_children().back()
	look_at(enemy.global_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	var projectile_instance = projectile.instantiate()
	add_child(projectile_instance)
	projectile_instance.global_position = self.global_position
