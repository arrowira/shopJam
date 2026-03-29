extends Area2D

var value

func _ready() -> void:
	if randf()<0.5:
		queue_free()
	$sprites.get_children()[randi_range(0,10)].visible = true
	value = randi_range(1, 5)

func getValue():
	return value
