extends Button

@onready var button: Button = $"."

func _on_button_down() -> void:
	var tree = get_tree()
	tree.change_scene_to_file("res://scenes/main_menu.tscn")
