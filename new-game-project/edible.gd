extends Area2D

var value

func _ready() -> void:
	value = randi_range(5, 10)

func getValue():
	return value
