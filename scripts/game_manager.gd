extends Node

@onready var label: Label = $"../Player/Camera2D/HBoxContainer/Label"
static var score = 0
var last_scene: String = ""

func add_point(points):
	score +=points
	label.text = str(score)
