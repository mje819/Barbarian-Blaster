extends PathFollow3D
class_name Enemy

## The speed in m/s the enemy will move (reset back to 6.5)
@export var speed := 10
@export var max_health := 50

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var health : int :
	set(new_health):
		if new_health < health:
			animation_player.play("take_damage")
		health = new_health
		if health < 1:
			#await get_tree().create_timer(.25).timeout
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
