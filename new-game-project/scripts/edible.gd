extends Area2D

var value

func _ready() -> void:
	$sprites.get_children()[randi_range(0,10)].visible = true
	value = randi_range(5, 10)

func getValue():
	return value
