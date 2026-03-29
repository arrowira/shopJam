extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("hide")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_time_timeout() -> void:
	visible=false
