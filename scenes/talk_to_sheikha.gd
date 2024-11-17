extends Area2D

@onready var game_manager: Node = %"Game Manager"
@onready var timer: Timer = $"../Timer"
@onready var player: CharacterBody2D = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
var nec: Array[String] = [
	"Every explorer must be able to collect treasures from their discoveries.",
	"Find me 5 coins...",
	"Then come talk to me.",
]
var lines: Array[String] = [
	"Ibn Batuta...",
	"It seems you are very fond of foreign travel",
	"You must visit my brother Fariduddin in India",
	"Rukonuddin in Sind,",
	"and Burhanuddin in China.",
	"Convey my greetings to them."]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is not TileMap:
		game_manager.in_convo = true
		timer.paused = true
		if game_manager.score >= 5:
			#DialogManager.start_dialog(player.position, lines)
		else:
			#DialogManager.start_dialog(player.position, nec)
			game_manager.in_convo = false
			timer.paused = false
