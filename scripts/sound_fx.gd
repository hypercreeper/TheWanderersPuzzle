extends Node

func background_music():
	$Indianback.stop()
	$ArabianMusic.stop()
	$AfricanMusic.stop()
	$player.play()

func play_indian():
	$ArabianMusic.stop()
	$AfricanMusic.stop()
	$player.stop()
	$Indianback.play()
	
func play_arabian():
	$Indianback.stop()
	$AfricanMusic.stop()
	$player.stop()
	$ArabianMusic.play()

func play_african():
	$Indianback.stop()
	$ArabianMusic.stop()
	$player.stop()
	$AfricanMusic.play()
	
func play_pot_break():
	$PotBreak.play()
