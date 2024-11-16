extends Area2D
var broken = false
@onready var game_manager: Node = %"Game Manager"
@onready var coin: Area2D = $"../coin7"

func _on_body_entered(body: Node2D) -> void:
	if not self.broken:
		coin.position = Vector2(24.0, -8.0)
		coin.show()
		$AnimatedSprite2D.frame = 1
		self.broken = true
