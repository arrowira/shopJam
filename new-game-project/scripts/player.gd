extends CharacterBody2D

@export var speed = 200

var size = 0

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var oinkTimer = 1000

func _physics_process(delta: float) -> void:
	var input = Input.get_vector("right", "left", "up", "down").normalized()
	velocity += input * speed
	velocity *= 0.9
	
	if randi_range(0,oinkTimer) == 0:
		$oinkManager.get_children()[randi_range(0,2)].play()
		oinkTimer=1000
	else:
		oinkTimer-=1
	
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
				$bite.pitch_scale = 1+randf_range(-0.5,0.5)
				$bite.play()
				scale.x += 0.5 * (1.3/size)
				area.queue_free()
				print(size)
	
	move_and_slide()
