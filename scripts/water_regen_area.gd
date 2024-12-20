extends Area2D

@onready var timer: Timer = $"../Timer"
@onready var game_manager: Node = %"Game Manager"
@onready var game: Node2D = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#game.regenerating_water = false
	
func _on_body_entered(body: Node2D) -> void:
	print(type_string(typeof(body)))
	if body is not TileMap:
		timer.stop()
		timer.start(2)
		game.regenerating_water = true
		print(game.regenerating_water)
func _on_body_exited(body: Node2D) -> void:
	if body is not TileMap:
		timer.stop()
		if GameManagerss.last_scene == "africa":
			timer.start(6)
		elif GameManagerss.last_scene == "arabia":
			timer.start(4)
		elif GameManagerss.last_scene == "india":
			timer.start(5)
		
		game.regenerating_water = false
		print(game.regenerating_water)
