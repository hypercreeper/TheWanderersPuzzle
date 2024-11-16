extends Area2D
var broken = false
@onready var game_manager: Node = %"Game Manager"
@onready var coin: Area2D = $"../coin7"

func _on_body_entered(body: Node2D) -> void:
	if not self.broken:
		SoundFx.play_pot_break()
		coin.position = Vector2(self.position.x+15, self.position.y)
		coin.show()
		$AnimatedSprite2D.frame = 1
		self.broken = true
