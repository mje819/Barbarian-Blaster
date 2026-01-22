extends Area3D

var direction := Vector3.FORWARD

@export var speed := 30.0

func _physics_process(_delta: float) -> void:
	position += direction * speed * _delta
	


func _on_timer_timeout() -> void:
	queue_free()
