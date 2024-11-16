extends Control
func _ready() -> void:
	print(GameManagerss.last_scene)
	if GameManagerss.last_scene == "africa":
		SoundFx.background_music()
	if GameManagerss.last_scene == "arabia":
		SoundFx.background_music()
	if GameManagerss.last_scene == "india":
		SoundFx.background_music()
