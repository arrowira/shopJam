extends Control

var maxWeight = 200.0

var fillAmt = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win(130)
	
func _physics_process(delta: float) -> void:
	if $ProgressBar.value < fillAmt:
		$ProgressBar.value+=0.2
	$Panel/weight.text = str(int($ProgressBar.value*4))
func win(weight):
	fillAmt = (weight/maxWeight)*100
	
	
