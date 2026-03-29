extends CharacterBody2D

@export var speed = 200

var size = 0

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var oinkTimer = 1000
var t = 0
var sec = 99
var cSec = 99
var lastSec = 0

func _physics_process(delta: float) -> void:
	z_index = position.y/10.0
	var input = Input.get_vector("right", "left", "up", "down").normalized()
	velocity += input * speed
	velocity *= 0.8
	t+=1
	cSec -= (100)/60.0
	lastSec = sec
	sec=int(99-(t/60.0))
	if lastSec != sec:
		cSec = 99
		
	if sec <=0:
		$CanvasLayer/winScreen.visible = true
		$CanvasLayer/winScreen.win(size)
	$CanvasLayer/timer/seconds.text = str(sec)
	$CanvasLayer/timer/centiseconds.text = str(int(cSec))
	
	if randi_range(0,oinkTimer) == 0:
		$oinkManager.get_children()[randi_range(0,2)].play()
		oinkTimer=1000
	else:
		oinkTimer-=1
	
	if input.length() > 0.5:
		$piganims.play("Pig walk")
		$foot.volume_db = 0
	else:
		$piganims.play("Pig Idle")
		$foot.volume_db = -80
		
	
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
				$pigparts/torso.scale.y += 0.0001
				area.queue_free()
				print(size)
			if area.name == "npcArea":
				size+=10
				$bite.pitch_scale = 0.4
				$bite.play()
				$pigparts/torso.scale.y += 0.0005
				Engine.time_scale = 1
				area.get_parent().queue_free()
				print(size)
	
	move_and_slide()
