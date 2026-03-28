extends CharacterBody2D

@export var speed = 20

var size = 0

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	var input = Input.get_vector("right", "left", "up", "down").normalized()
	velocity += input * speed
	velocity *= 0.9
	
	move_and_slide()


func _on_eat_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("edible"):
		size += area.getValue()
		print(size)
		area.queue_free()
