extends Node2D

# Variables
var player_in_range = false
var dialogue_texts = ["Ibn Batuta...","It seems to me that you are fond of foreign travel","You must visit my brother Fariduddin in India","and Burhudin in Arabia","Convey my greetings to them..."]
var current_dialogue_index = 0
@onready var dialogue_label: Label = $Control/Label
@onready var detection_area: Area2D = $DetectionArea
@onready var label_2: Label = $Control/Label2
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"

func _ready():
	detection_area.body_entered.connect(_on_body_entered)
	detection_area.body_exited.connect(_on_body_exited)
	label_2.visible = true
	hide_dialogue()

func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("ui_accept"):
		if GameManagerss.score >= 7:
			show_next_dialogue()
			label_2.visible=false
		else:
			dialogue_label.text = "Collect all coins first!"
			dialogue_label.show()

func _on_body_entered(body):
	if body is not TileMap:
		player_in_range = true
		if GameManagerss.score >= 7:
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
			animation_player.play("fade out")
			await animation_player.animation_finished
			get_tree().change_scene_to_file("res://scenes/arabia.tscn")
			hide_dialogue()
			current_dialogue_index = 0

func hide_dialogue():
	dialogue_label.hide()
