extends Button
@onready var click_sound: AudioStreamPlayer2D = $"../../../ClickSound"
@onready var arabia_button: Button = $"."

func _ready() -> void:
	self.button_down.connect(self.button_downs.bind())

func _process(delta: float) -> void:
	pass

func button_downs() -> void:
	var tree = get_tree()
	if tree != null:
		arabia_button.disabled=true
		click_sound.play()
		await click_sound.finished
		SoundFx.play_arabian()

		tree.change_scene_to_file("res://scenes/arabia.tscn")
	else:
		pass
	pass
