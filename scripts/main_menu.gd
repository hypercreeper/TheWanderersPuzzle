class_name Main_Menu
extends Control

@onready var start_button: Button = $"MarginContainer/HBoxContainer/VBoxContainer/Start Button" as Button
@onready var options_button: Button = $"MarginContainer/HBoxContainer/VBoxContainer/Options Button" as Button
@onready var quit_button: Button = $"MarginContainer/HBoxContainer/VBoxContainer/Quit Button" as Button
@onready var startmain = preload("res://scenes/startmain.tscn") as PackedScene
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var hover_sound: AudioStreamPlayer2D = $HoverSoundr
@onready var click_sound: AudioStreamPlayer2D = $ClickSound

func _ready() -> void:
	SoundFx.background_music()
	start_button.mouse_entered.connect(func(): _on_button_hover(start_button))
	options_button.mouse_entered.connect(func(): _on_button_hover(options_button))
	quit_button.mouse_entered.connect(func(): _on_button_hover(quit_button))
	start_button.mouse_exited.connect(func(): _on_button_exit(start_button))
	options_button.mouse_exited.connect(func(): _on_button_exit(options_button))
	quit_button.mouse_exited.connect(func(): _on_button_exit(quit_button))
	start_button.button_down.connect(on_start_pressed)
	quit_button.button_down.connect(on_quit_pressed)
	
func on_start_pressed() -> void:
	start_button.disabled=true
	click_sound.play()
	await click_sound.finished
	animation_player.play("fade out")
	await animation_player.animation_finished
	GameManagerss.last_scene = "MainMenu"
	get_tree().change_scene_to_file("res://scenes/africa.tscn")

func on_quit_pressed() -> void:
	quit_button.disabled=true
	click_sound.play()
	await click_sound.finished
	get_tree().quit()

func _on_button_hover(button: Button) -> void:
	hover_sound.play()

func _on_button_exit(button: Button) -> void:
	var tween = create_tween()
	tween.parallel().tween_property(button, "scale", Vector2(1.0, 1.0), 0.1)
	tween.parallel().tween_property(button, "modulate", Color(1, 1, 1), 0.1)
