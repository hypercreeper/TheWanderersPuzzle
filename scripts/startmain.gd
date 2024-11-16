extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameManagerss.last_scene == "MainMenu":
		SoundFx.background_music()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
