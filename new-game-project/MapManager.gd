extends Node2D

var MapSizeX = 32
var MapSizeY = 32
var Map = [MapSizeX][MapSizeY]
var Generating = true
var Nodes = []

func _ready() -> void:
	randomize()
	Nodes[0] = Vector3(16, 16, 1)
	Nodes[1] = Vector3(8, 8, 2)
	Nodes[2] = Vector3(24, 24, 3)
	Nodes[3] = Vector3(18, 9, 1)
	Nodes[4] = Vector3(9, 18, 4)
	while(Generating):
		for i in range(Nodes.size()):
			var Direction = Nodes[i].z
			var AddX = 0
			var AddY = 0
			if(randi_range(0, 20) == 20):
				Direction = randi_range(1, 4)
				Nodes[i].z = Direction
			#Direction Conversion
			if(Direction == 1):
				AddX = 1
			if(Direction == 2):
				AddX = -1
			if(Direction == 3):
				AddY = 1
			if(Direction == 4):
				AddY = -1
			if(Nodes[i].x + AddX > MapSizeX || Nodes[i].x + AddX < 0):
				Nodes.remove_at(i)
			if(Nodes[i].y + AddY > MapSizeY || Nodes[i].y + AddY < 0):
				Nodes.remove_at(i)
			Map[Nodes[i].x][Nodes[i].y] = 1
			Nodes[i].x +=AddX
			Nodes[i].y +=AddY
