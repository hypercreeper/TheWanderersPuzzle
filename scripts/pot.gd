extends Area2D

@onready var game_manager: Node = %"Game Manager"
@onready var coin: Area2D = $"../coin7"
func _on_body_entered(body: Node2D) -> void:
	self.hide()
	coin.show()
	
	queue_free()
