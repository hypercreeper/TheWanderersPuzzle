extends Node
@onready var label: Label = $"../Player/Camera2D/Label"
var score = 0

func add_point(points):
	score +=points
	label.text = "Score:" + str(score)
