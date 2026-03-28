extends Node2D

var RoadObj = preload("res://RoadObject.tscn")

var MapSizeX = 32
var MapSizeY = 32
var Map = []
var Generating = true
var Nodes = []

func _ready() -> void:
	for x in range(MapSizeX):
		var row = []
		for y in range(MapSizeY):
			row.append(0)
		Map.append(row)
	randomize()
	Nodes.append(Vector3(16, 16, 1))
	Nodes.append(Vector3(8, 8, 2))
	Nodes.append(Vector3(24, 24, 3))
	Nodes.append(Vector3(18, 9, 1))
	Nodes.append(Vector3(9, 18, 4))
	while(Generating):
		if(Nodes.size() == 0):
			Generating = false
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
				break
			if(Nodes[i].y + AddY > MapSizeY || Nodes[i].y + AddY < 0):
				Nodes.remove_at(i)
				break
			Map[Nodes[i].x][Nodes[i].y] = 1
			Nodes[i].x +=AddX
			Nodes[i].y +=AddY
	var XPos = 0
	var YPos = 0
	for i in range(Map.size()):
		for i1 in range(Map[i].size()):
			if(Map[i][i1] == 1):
				var REM = RoadObj.instantiate()
				REM.position = Vector2(XPos, YPos)
				add_child(REM)
			XPos += 64
		YPos += 64
		XPos = 0
