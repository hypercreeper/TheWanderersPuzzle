extends Area2D

@onready var game_manager: Node = %"Game Manager"

func _on_body_entered(body: Node2D) -> void:
	game_manager.add_point(1)
	print(game_manager.score)
	queue_free()
	
