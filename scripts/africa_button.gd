extends Button
@onready var click_sound: AudioStreamPlayer2D = $"../../../ClickSound"
@onready var africa_button: Button = $"."

func _ready() -> void:
	self.button_down.connect(self.button_downs.bind())
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func button_downs() -> void:
	var tree = get_tree()
	if tree != null:
		africa_button.disabled=true
		click_sound.play()
		await click_sound.finished
		tree.change_scene_to_file("res://scenes/africa.tscn")
	else:
		pass
	pass
