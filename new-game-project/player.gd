extends CharacterBody2D

@export var speed = 20

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	var input = Input.get_vector("right", "left", "up", "down").normalized()
	velocity += input * speed
	velocity *= 0.9
	
	move_and_slide()
