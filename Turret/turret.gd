extends Node3D

var projectile = preload("res://Turret/projectile.tscn")


func _on_timer_timeout() -> void:
	var projectile_instance = projectile.instantiate()
	add_child(projectile_instance)
	projectile_instance.global_position = self.global_position
