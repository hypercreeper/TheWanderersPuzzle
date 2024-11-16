extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManagerss.last_scene="africa"
	$Player/Camera2D/HBoxContainer/Label.text = str(GameManagerss.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
