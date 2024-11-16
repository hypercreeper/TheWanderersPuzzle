extends Node

func background_music():
	$Indianback.stop()
	$ArabianMusic.stop()
	$AfricanMusic.stop()
	$player.play()

func play_indian():
	$player.stop()
	$Indianback.play()
	
func play_arabian():
	$player.stop()
	$ArabianMusic.play()

func play_african():
	$player.stop()
	$AfricanMusic.play()
	
