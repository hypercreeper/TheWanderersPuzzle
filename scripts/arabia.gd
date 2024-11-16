extends Node2D
@onready var game_manager: Node = %"Game Manager"
#@onready var water_label: Label = $Player/Camera2D/WaterLabel
@onready var timer: Timer = $Timer

func _ready() -> void:
	GameManagerss.last_scene="arabia"
	GameManagerss.water = 15
	$Player/Camera2D/HBoxContainer/Label.text = str(GameManagerss.score)
	timer.timeout.connect(remove_water)
	game_manager.update_water_label()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func remove_water():
	if GameManagerss.water > 0:
		GameManagerss.water -= 1
		game_manager.update_water_label()
	else:
		$Player.get_node("CollisionShape2D").queue_free()
		get_tree().reload_current_scene()
		GameManagerss.water = 15
