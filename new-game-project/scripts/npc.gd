extends Node2D

var textwritting = false
var t = 0

var message = "What do you think your doing! You better leave our stuff alone. I don't know what made you think you could just eat up all our goods but it ends NOW!"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if textwritting:
		if t< len(message)-1:
			t+=1
	$SpeechBubl/RichTextLabel.text = message.substr(0,t)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "eatBox":
		dialogue()

func dialogue():
	textwritting=true
	$SpeechBubl.visible = true
	$AudioStreamPlayer.play()
	Engine.time_scale = 0.01
