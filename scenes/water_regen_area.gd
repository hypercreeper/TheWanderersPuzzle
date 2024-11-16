extends CollisionPolygon2D

@onready var timer: Timer = $Timer
@onready var game_manager: Node = %"Game Manager"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManagerss.water = 15
	$Player/Camera2D/HBoxContainer/Label.text = str(GameManagerss.score)
	timer.timeout.connect(remove_water)
	game_manager.update_water_label()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_body_entered(body: Node2D) -> void:
	Engine.time_scale=0.5
	print("death")
	body.get_node("CollisionShape2D").queue_free()
	
