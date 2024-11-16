extends Node

@onready var label: Label = $"../Player/Camera2D/HBoxContainer/Label"
static var score = 0
var last_scene: String = ""

static var water:int =15

func add_point(points):
	score +=points
	label.text = "Score: " + str(score) + "\nWater: " + str(water)

func update_water_label():
	label.text = "Score: " + str(score) + "\nWater: " + str(water)

func kill_player():
	pass
