extends Node2D

@onready var water_label: Label = $Player/Camera2D/WaterLabel
@onready var timer: Timer = $Timer


func _ready() -> void:
	GameManagerss.last_scene="arabia"
	$Player/Camera2D/HBoxContainer/Label.text = str(GameManagerss.score)
	timer.timeout.connect(remove_water)
	update_water_label()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func remove_water():
	if GameManagerss.water > 0:
		GameManagerss.water -= 1
		update_water_label()
	else:
		print("No water left!")

func update_water_label():
	print(GameManagerss.water)
