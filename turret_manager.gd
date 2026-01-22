extends Node3D
class_name TurretManager

@export var turret : PackedScene
@export var enemy_path : Path3D

func build_turret(pos : Vector3) -> void:
	var turret_instance = turret.instantiate()
	add_child(turret_instance)
	turret_instance.global_position = pos
	turret_instance.enemy_path = enemy_path
