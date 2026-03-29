extends Control

var maxWeight = 400.0

var fillAmt = 0

	
func _physics_process(delta: float) -> void:
	if $ProgressBar.value < fillAmt:
		$ProgressBar.value+=0.2
	$Panel/weight.text = str(int($ProgressBar.value*4))
func win(weight):
	fillAmt = (weight/maxWeight)*100
	
	
