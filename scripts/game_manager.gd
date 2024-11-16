extends Node

@onready var label: Label = $"../Player/Camera2D/HBoxContainer/Label"
var score = 0

func add_point(points):
	score +=points
	label.text = str(score)
