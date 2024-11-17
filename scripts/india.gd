extends Node2D
@onready var timer: Timer = $Timer
@onready var game_manager: Node = %"Game Manager"
@onready var replenishing_label: Label = $Player/Camera2D/ReplenishingLabel

static var regenerating_water = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManagerss.last_scene="india"
	GameManagerss.water = 15
	$Player/Camera2D/HBoxContainer/Label.text = str(GameManagerss.score)
	timer.timeout.connect(remove_water)
	game_manager.update_water_label()

func remove_water():
	print(GameManagerss.water)
	print(regenerating_water)
	if not regenerating_water:
		if GameManagerss.water > 0:
			GameManagerss.water -= 1
		else:
			$Player.get_node("CollisionShape2D").queue_free()
			get_tree().reload_current_scene()
			GameManagerss.water = 15
	else:
		if GameManagerss.water < 15:
			GameManagerss.water += 1
	game_manager.update_water_label()
