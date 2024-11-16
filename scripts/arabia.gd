extends Node2D

func _ready() -> void:
	GameManagerss.last_scene="arabia"
	$Player/Camera2D/HBoxContainer/Label.text = str(GameManagerss.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
