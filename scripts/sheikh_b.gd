extends Node2D

# Variables
var player_in_range = false
var dialogue_texts = ["Thank you for finding me","Ibn Batuta...","I hope my brother is well","For your efforts you will receive 30 Artifacts"]
var current_dialogue_index = 0
@onready var dialogue_label: Label = $Control/Label
@onready var detection_area: Area2D = $DetectionArea
@onready var label_2: Label = $Control/Label2
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var game_manager: Node = %"Game Manager"

func _ready():
	detection_area.body_entered.connect(_on_body_entered)
	detection_area.body_exited.connect(_on_body_exited)
	label_2.visible = true
	hide_dialogue()

func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("ui_accept"):
		if GameManagerss.score >= 15:
			show_next_dialogue()
			label_2.visible=false
		else:
			dialogue_label.text = "Collect all coins first!"
			dialogue_label.show()

func _on_body_entered(body):
	if body is not TileMap:
		player_in_range = true
		if GameManagerss.score >= 15:
			label_2.text = "Press Enter to talk"
		else:
			label_2.text = "Collect all coins first!"
		label_2.visible = true

func _on_body_exited(body):
	player_in_range = false
	label_2.visible = true
	hide_dialogue()
var fired = false
func show_next_dialogue():
	if current_dialogue_index < dialogue_texts.size():
		dialogue_label.text = dialogue_texts[current_dialogue_index]
		dialogue_label.show()
		current_dialogue_index += 1
	else:
		if not fired:
			fired = true
			GameManagerss.artifacts += 30
			game_manager.update_water_label()
			animation_player.play("fade out")
			await animation_player.animation_finished
			get_tree().change_scene_to_file("res://scenes/india.tscn")
			hide_dialogue()
			current_dialogue_index = 0

func hide_dialogue():
	dialogue_label.hide()
