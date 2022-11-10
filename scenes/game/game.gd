extends Node2D

var Bottle = preload("res://scenes/bottle/bottle.tscn")

var bottles = []
var selected_bottles = []


func _ready():
	setup_board(4,4)


func _process(_delta):
	for bottle in selected_bottles:
		if bottle.rotation >= 6.28319:
			bottle.rotation = 0.0
		bottle.rotation += 0.01


func create_bottle():
	var new_bottle = Bottle.instance()
	add_child(new_bottle)
	new_bottle.connect("selected", self, "_on_Bottle_selected")
	bottles.push_back(new_bottle)
	return new_bottle


func setup_board(rows: int, columns: int):
	var column_width: int = 192
	var row_height: int = 384
	
	for row in range(1, rows + 1):
		for column in range(1, columns + 1):
			var bottle = create_bottle()
			bottle.position.x = column_width * column
			bottle.position.y = row_height * row
			
			print(Vector2(row,column), " - ", bottle.position)


func _on_Bottle_selected(bottle):
		selected_bottles.push_back(bottle)
		print(bottle.position)
