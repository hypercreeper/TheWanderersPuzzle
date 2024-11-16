extends Node

func background_music():
	$Indianback.stop()
	$player.play()

func play_indian():
	$player.stop()
	$Indianback.play()
