extends Node

@onready var label: Label = $"../Player/Camera2D/HBoxContainer/Label"
static var artifacts = 0
static var score = 0
static var in_convo = false
var last_scene: String = ""

static var water:int =15

func add_point(points):
	score +=points
	label.text = "Score: " + str(score) + "\n\nWater: " + str(water) + "\n\nArtifacts: " + str(artifacts)

func update_water_label():
	label.text = "Score: " + str(score) + "\n\nWater: " + str(water) + "\n\nArtifacts: " + str(artifacts)

func kill_player():
	pass
