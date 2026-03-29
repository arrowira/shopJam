extends Node2D

var RoadObj = preload("res://scenes/RoadObject.tscn")
var SmallShopScene = preload("res://scenes/shop.tscn")
var MeduimShopScene = preload("res://scenes/shop.tscn")
var LargeShopScene = preload("res://scenes/shop.tscn")

var MapSizeX = 32
var MapSizeY = 32
var Map = []
var Generating = true
var Nodes = []

var SmallShop = 10
var MeduimShop = 3
var LargeShop = 3

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
	#Prewrite nodes
	for i in range(randi_range(3, 7)):
		Nodes.append(Vector3(randi_range(1, MapSizeX), randi_range(1, MapSizeY), randi_range(1, 4)))
	while(Generating):
		if(Nodes.size() == 0):
			Generating = false
		for i in range(Nodes.size()):
			var Direction = Nodes[i].z
			var AddX = 0
			var AddY = 0
			if(randi_range(0, 60) == 60):
				if(Direction == 1 || Direction == 2):
					Nodes.append(Vector3(Nodes[i].x, Nodes[i].y, randi_range(3, 4)))
				else:
					Nodes.append(Vector3(Nodes[i].x, Nodes[i].y, randi_range(1, 2)))
				continue
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
			Map[Nodes[i].x-1][Nodes[i].y-1] = 1
			Nodes[i].x +=AddX
			Nodes[i].y +=AddY
	for i in range(SmallShop):
		var SG = true
		var T = 0
		while(SG == true):
			#T+=1
			var Restart = false
			var RX = randi_range(0, MapSizeX-3)
			var RY = randi_range(0, MapSizeY-3)
			if(Map[RX][RY] > 0):
				continue
			if(T>=100):
				var RAM = MeduimShopScene.instantiate()
				RAM.position = Vector2((RX+1)*320, (RY+1)*320)
				add_child(RAM)
				SG = false
			for i1 in range(3):
				for i2 in range(3):
					if(Map[RX+i2][RY+i1] > 1):
						Restart = true
			if(Restart == true):
				continue
			SG = false
			#var RAM = MeduimShopScene.instantiate()
			#RAM.position = Vector2((RX)*320, (RY)*320)
			#add_child(RAM)
			var REM = RoadObj.instantiate()
			REM.position = Vector2((RX+1)*320, (RY+1)*320)
			REM.scale = Vector2(REM.scale.x*3, REM.scale.y*3)
			add_child(REM)
		T = 0
	var XPos = 0
	var YPos = 0
	for i in range(Map.size()):
		for i1 in range(Map[i].size()):
			if(Map[i][i1] == 1):
				var REM = RoadObj.instantiate()
				REM.position = Vector2(XPos, YPos)
				add_child(REM)
			XPos += 320
		YPos += 320
		XPos = 0
