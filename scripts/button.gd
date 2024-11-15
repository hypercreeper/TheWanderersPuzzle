extends Button
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(self._pressed.bind())
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _pressed() -> void:
	#.change_scene_to_file("res://scenes/game.tscn")
	var tree = get_tree()
	if tree != null:
		tree.change_scene_to_file("res://scenes/arabia.tscn")
	else:
		pass
	pass
