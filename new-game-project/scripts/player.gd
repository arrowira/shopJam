extends CharacterBody2D

@export var speed = 200

var size = 0

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	var input = Input.get_vector("right", "left", "up", "down").normalized()
	velocity += input * speed
	velocity *= 0.9
	
	if input.length() > 0.5:
		$piganims.play("Pig walk")
	else:
		$piganims.play("Pig Idle")
	
	if input.x>0.1:
		$pigparts.scale.x = 1
	elif input.x < -0.1:
		$pigparts.scale.x = -1
	
	if Input.is_action_pressed("eat"):
		for area in $eatBox.get_overlapping_areas():
			if area.is_in_group("edible"):
				size+=area.getValue()
				area.queue_free()
				print(size)
	
	move_and_slide()
