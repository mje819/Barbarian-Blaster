extends PathFollow3D
class_name Enemy

## The speed in m/s the enemy will move (reset back to 6.5)
@export var speed := 10.0
@export var max_health := 50

var health : int :
	set(new_health):
		health = new_health
		if health < 1:
			queue_free()

@onready var base : Base = get_tree().get_first_node_in_group("base")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += speed * delta
	if progress_ratio == 1:
		base.take_damage()
		queue_free()
