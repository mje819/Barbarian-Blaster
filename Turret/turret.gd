extends Node3D


@export var turret_range := 10.0


var projectile = preload("res://Turret/projectile.tscn")
var enemy_path : Path3D
var target : Node3D #change back to Enemy

# turn to enemies
func _physics_process(_delta: float) -> void:
	target = find_best_target()
	if target != null and target is Enemy:
		look_at(target.global_position, Vector3.UP, true)


func _on_timer_timeout() -> void:
	if target != null and target is Enemy:
		var projectile_instance = projectile.instantiate()
		add_child(projectile_instance)
		projectile_instance.global_position = self.global_position
		projectile_instance.direction = global_transform.basis.z

func find_best_target() -> PathFollow3D:
	var farthest_progress = 0
	var best_target = null
	
	for child in enemy_path.get_children():
		if child is Enemy:
			if child.progress > farthest_progress and self.global_position.distance_to(child.global_position) <= turret_range:
				#var distance = self.global_position.distance_to(child.global_position)
				#if distance <= turret_range:
				farthest_progress = child.progress
				best_target = child
	return best_target
